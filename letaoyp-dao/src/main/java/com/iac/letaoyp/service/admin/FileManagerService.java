package com.iac.letaoyp.service.admin;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.iac.letaoyp.service.ServiceException;
import com.iac.letaoyp.util.DateUtil;
import com.iac.letaoyp.util.Servlets;

@Component
public class FileManagerService {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	private HashMap<String, String> extMap = new HashMap<String, String>();
	//上传文件根目录 
	@Value("${file.upload.dir}")
	private String baseDir;
	@Value("${file.upload.path}")
	private String relativePath;
	
	private void validDir(String dir) {
		if(StringUtils.isBlank(dir)) {
			throw new IllegalStateException("Base dir should be configed in app.*.properties");
		}
		
		//检查目录
		File uploadDir = new File(dir);
		if(!uploadDir.isDirectory()){
			throw new IllegalStateException("Base dir " + dir + " not exists");
		}
		//检查目录写权限
		if(!uploadDir.canWrite()){
			throw new IllegalStateException("No rights writting to base dir");
		}
	}
	
	@PostConstruct
	public void init() {
		System.out.println("baseDir:" + baseDir);
		relativePath = relativePath.startsWith("\\") || relativePath.startsWith("/") ? relativePath.substring(1) : relativePath;
		
		validDir(baseDir);
		
		extMap.put("image", "gif,jpg,jpeg,png,bmp");
		extMap.put("flash", "swf,flv");
		extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
		extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2,apk");
	}

	public boolean isAccesiableDir(String dir) {
		return extMap.containsKey(dir);
	}

	public boolean isAccesiableFileType(String dir, String fileName) {
		String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
		return Arrays.<String>asList(extMap.get(dir).split(",")).contains(fileExt);
	}

	public String uploadFile(Long userId, byte[] bytes, String dir, String fileName, String description) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		String context = Servlets.getRequestContext(request);
		Date now = new Date();
		String sufixUrl = relativePath + "/" + dir + "/" + DateUtil.format(now, "yyyy/MM") 
				+ "/" + DigestUtils.md5Hex(DateUtil.format(now, "yyyy-MM-dd HH:mm:ss") + fileName)
				+ fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
		String fileUrl = this.baseDir + "/"+ sufixUrl;
		File f = new File(fileUrl);
		try {
			FileUtils.writeByteArrayToFile(f, bytes);
		} catch (IOException e) {
			log.error(String.format("File upload failured userId [%s] fileName [%s]", userId, fileName), e);
			throw new ServiceException("文件上传失败");
		}
		return context + "/" + sufixUrl;
	}

	public String getAbsolutePath(String url) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		String context = Servlets.getRequestContext(request);
		String relative = StringUtils.substringAfter(url, context);
		return this.baseDir + relative;
	}
}
