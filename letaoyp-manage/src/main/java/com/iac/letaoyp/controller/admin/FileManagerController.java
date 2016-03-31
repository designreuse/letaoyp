package com.iac.letaoyp.controller.admin;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springside.modules.mapper.JsonMapper;

import com.iac.letaoyp.security.ShiroDbRealm.ShiroUser;
import com.iac.letaoyp.service.admin.FileManagerService;
import com.iac.letaoyp.util.ImageCropParam;
import com.iac.letaoyp.util.ImageUtil;

@Controller
@RequestMapping("admin/file")
public class FileManagerController {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private FileManagerService fileManagerService;
	
	private JsonMapper jsonMapper = JsonMapper.nonDefaultMapper();

	@RequestMapping("upload")
	@ResponseBody
	public FileUploadResut upload(HttpServletRequest request, 
			@RequestParam(value="dir", required=false, defaultValue="image") String dir,
			@RequestParam(value="description", required=false, defaultValue="") String description
			) throws IOException {
		if(!fileManagerService.isAccesiableDir(dir)) {
			return new FileUploadResut(1, "目录名不正确。");
		}
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		
		ShiroUser user = (ShiroUser)SecurityUtils.getSubject().getPrincipal();
		
		for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
			// 单个文件
			MultipartFile mf = entity.getValue();
			if(!fileManagerService.isAccesiableFileType(dir, mf.getOriginalFilename())) {
				return new FileUploadResut(1, "文件类型错误。");
			}
			String url = fileManagerService.uploadFile(user.id, mf.getBytes(), dir, mf.getOriginalFilename(), description);
			return new FileUploadResut(0, null, url);
		}
		
		return new FileUploadResut(1, "请选择文件");
	}
	
	@RequestMapping("image/cut")
	@ResponseBody
	public FileUploadResut cutImage(HttpServletRequest request, 
			MultipartFile file, @RequestParam("cropParam") String cropParam,
			@RequestParam(value="description", required=false, defaultValue="") String description
			) throws IOException {
		String dir = "image";
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		
		ShiroUser user = (ShiroUser)SecurityUtils.getSubject().getPrincipal();
		String url = null;
		for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
			// 单个文件
			MultipartFile mf = entity.getValue();
			if(!fileManagerService.isAccesiableFileType(dir, mf.getOriginalFilename())) {
				return new FileUploadResut(1, "文件类型错误。");
			}
			String fileExt = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf(".") + 1).toLowerCase();
			BufferedImage bi = ImageIO.read(new ByteArrayInputStream(mf.getBytes()));
			BufferedImage result = ImageUtil.cut(bi, jsonMapper.fromJson(cropParam, ImageCropParam.class));
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			ImageIO.write(result, fileExt, bos);
			url = fileManagerService.uploadFile(user.id, bos.toByteArray(), dir, mf.getOriginalFilename(), description);
			System.out.println("File manager mulity upload URL:" + url);
		}
		
		return new FileUploadResut(0, null, url);
	}
	
	@ExceptionHandler
	@ResponseBody
    public FileUploadResut doException(Exception e, HttpServletRequest request) throws Exception {
		log.error("File upload due to exception.", e);
		
        if (e instanceof MaxUploadSizeExceededException) {
            long maxSize = ((MaxUploadSizeExceededException) e)
                    .getMaxUploadSize();
            return new FileUploadResut(1, "上传文件太大，不能超过" + maxSize / 1024 + "k");
        }else if(e instanceof RuntimeException){
        	return new FileUploadResut(1, "未选中文件");
        }
        throw e;
    }
}
