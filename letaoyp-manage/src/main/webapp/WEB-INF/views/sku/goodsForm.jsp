<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.iac.letaoyp.entity.sku.Goods.Status"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
	request.setAttribute("statuses", Status.values());
%>
<form id="form" class="form-horizontal" form-validate action="${ctx}/sku/goods/update" method="post" data-config='{"before": "before_submit"}'>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="myModalLabel">${goods.id == null ? '新增' : '编辑'}</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<!-- form start -->
			<input type="hidden" id="id" name="id" value="${goods.id}" />
			<div class="col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="status">状态</label>
					<div class="col-sm-6">
						<select name="status">
							<c:forEach items="${statuses}" var="status">
								<option value="${status}" <c:if test="${status == goods.status}">selected="selected"</c:if>>
									${status.description}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label" for="name">名称</label>
					<div class="col-sm-6">
						<input class="form-control" id="name" name="name" type="text" value="${goods.name}" data-rule-required="true"
							data-msg-required="请输入商品名" /> <span class="help-inline"><form:errors path="name" /></span>
					</div>
				</div>
				<div class="form-group">
          <label class="col-sm-4 control-label" for="salesPrice">销售价(分)</label>
          <div class="col-sm-6">
            <input class="form-control" id="salesPrice" name="salesPrice" type="text" value="${goods.salesPrice}"
              data-rule-required="true" data-msg-required="请输入销售价" /> <span class="help-inline"><form:errors
                path="salesPrice" /></span>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-4 control-label" for="marketPrice">市场价(分)</label>
          <div class="col-sm-6">
            <input class="form-control" id="marketPrice" name="marketPrice" type="text" value="${goods.marketPrice}"
              data-rule-required="true" data-msg-required="请输入市场价" /> <span class="help-inline"><form:errors
                path="marketPrice" /></span>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-4 control-label" for="cost">成本价(分)</label>
          <div class="col-sm-6">
            <input class="form-control" id="cost" name="cost" type="text" value="${goods.cost}" data-rule-required="true"
              data-msg-required="请输入成本价" /> <span class="help-inline"><form:errors path="cost" /></span>
          </div>
        </div>
				
				<div class="form-group">
					<label class="col-sm-4 control-label" for="baseHits">点击基数</label>
					<div class="col-sm-6">
						<input class="form-control" id="baseHits" name="baseHits" type="text" value="${goods.baseHits}"
							data-rule-required="true" data-msg-required="请输入点击累加基数" data-rule-digists="true" data-msg-digists="请输入数值" /> <span
							class="help-inline"><form:errors path="baseHits" /></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label" for="hits">点击数</label>
					<div class="col-sm-6">
						<input class="form-control" id="hits" name="hits" type="text" value="${goods.hits != null ? goods.hits : 0}"
							readonly="readonly" />
					</div>
				</div>
				
			</div>

			<div class="col-sm-6">
			<!-- 
				<div class="form-group">
					<label class="col-sm-4 control-label" for="brand">品牌</label>
					<div class="col-sm-6">
						<input class="form-control" id="brand" name="brand" type="text" value="${goods.brand}" /> <span
							class="help-inline"><form:errors path="brand" /></span>
					</div>
				</div> -->
				<div class="form-group">
					<label class="col-sm-4 control-label" for="star">星级</label>
					<div class="col-sm-6">
						<input class="form-control" id="star" name="star" type="text" value="${goods.star}" data-rule-required="true"
							data-msg-required="请输入星级" /> <span class="help-inline"><form:errors path="star" /></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label" for="weight">重量</label>
					<div class="col-sm-6">
						<input class="form-control" id="weight" name="weight" type="text" value="${goods.weight}" /> <span
							class="help-inline"><form:errors path="weight" /></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label" for="unit">单位描述</label>
					<div class="col-sm-6">
						<input class="form-control" id="unit" name="unit" type="text" value="${goods.unit}" /> <span class="help-inline"><form:errors
								path="unit" /></span>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-4 control-label" for="category">类目</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" id="input_category_name" readonly="readonly" value="${goods.category}"> 
						<input class="form-control" id="parent" name="category" type="hidden" value="${goods.category}" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label" for="comments">评论数</label>
					<div class="col-sm-6">
						<input class="form-control" id="comments" name="comments" type="text" value="${goods.comments != null ? goods.comments : 0}" readonly="readonly" /> 
						<span class="help-inline"><form:errors path="comments" /></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label" for="onlineTime">onlineTime</label>
					<div class="col-sm-6">
						<input class="form-control datepicker" id="onlineTime" name="onlineTime" type="text" readonly="readonly"
							value="<fmt:formatDate value='${goods.onlineTime}' pattern='yyyy-MM-dd HH:mm:ss'/>">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label" for="active">active</label>
					<div class="col-sm-6">
						<input type="radio" name="active" class="minimal icheck" <c:if test="${goods.active}">checked</c:if> value="1">
						<span class="label label-success">Active</span> &nbsp;&nbsp; <input type="radio" name="active"
							class="minimal icheck" <c:if test="${!goods.active}">checked</c:if> value="0"> <span
							class="label label-danger">Banned</span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label" for="created">created</label>
					<div class="col-sm-6">
						<input class="form-control" id="created" name="created" type="text"
							value="<fmt:formatDate value='${goods.created}' pattern='yyyy-MM-dd HH:mm:ss'/>" readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label" for="modified">modified</label>
					<div class="col-sm-6">
						<input class="form-control" id="modified" name="modified" type="text"
							value="<fmt:formatDate value='${goods.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>" readonly="readonly">
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
		  <div class="form-group">
        <label class="col-sm-2 control-label" for="description">商品图</label>
      </div>
      <input type="hidden" name="images" id="images" />
      <input type="hidden" name="sorts" id="sorts" />
		
		  <div class="form-group">
        <div class="col-sm-7 col-md-offset-1">
          <div id="carousel-example-generic" class="carousel slide" data-interval="false" data-wrap="false">
            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
              <c:set var="contains" value="false"></c:set>
              <c:forEach items="${goodsImages}" var="goodsImage" varStatus="status">
                <c:if test="${goodsImage.src == goods.image}">
                  <c:set var="contains" value="true"></c:set>
                </c:if>
                <div class="item <c:if test="${status.index == 0}">active</c:if>" data-goodsimage="${goodsImage.id}">
                  <img src="${goodsImage.src}" class="img-responsive center-block" alt="${goodsImage.sort}">
                  <div class="carousel-caption">
                    <input type="radio" name="image" class="minimal icheck" <c:if test="${goodsImage.src == goods.image}">checked</c:if> value="${goodsImage.src}">
                  </div>
                </div>
              </c:forEach>
              
              <c:if test="${!contains}">
                <div class="item <c:if test="${empty goodsImages}">active</c:if> unModifiable">
                  <img src="${goods.image}" class="img-responsive center-block" alt="${goods.name}">
                  <div class="carousel-caption">
                    <input type="radio" name="image" class="minimal icheck" checked value="${goods.image}">
                  </div>
                </div>
              </c:if>
            </div>
          
            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
              <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
              <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
        </div>
        <div class="col-sm-2">
          <button type="button" id="button_add_image" class="btn btn-block btn-primary btn-file">
            <span class="fileupload-new">添加图片</span>
            <input type="file" class="pic_upload" data-config='{"before": "beforeAddImage", "success": "addImageCallback"}' />
          </button>
          <button type="button" id="button_replace_image" class="btn btn-block btn-primary btn-file">
            <span class="fileupload-new">更换图片</span>
            <input type="file" class="pic_upload" data-config='{"before": "beforeChangeImage", "success": "changeImageCallback"}' />
          </button>
          <button type="button" id="button_delete_image" onclick="deleteImage();" class="btn btn-block btn-danger">删除图片</button>
        </div>
      </div>
		
		</div>
		
		<div class="row">
      <div class="form-group">
        <label class="col-sm-4 control-label" for="description">键值对属性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="javascript:addProperty();" class="btn btn-default btn-sm" title="删除"> <i class="fa fa-plus-square"></i>增加属性</a>
        </label>
      </div>
      <div id="div_group">
	      <c:forEach items="${goods.parsedProperty}" var="property">
	        <div class="property_group">
		        <div class="col-sm-5 col-md-offset-1">
			        <input class="form-control" name="key" type="text" value="${property.key}" required />
			      </div>
			      <div class="col-sm-5 input-group">
			        <input class="form-control" name="value" type="text" value="${property.value}" required />
				      <a href="javascript:;" onclick="delProperty(this);" class="btn btn-default btn-sm input-group-addon" style="margin-bottom:10px;" title="删除"> <i class="fa fa-minus-square"></i></a>
			      </div>
		      </div>
	      </c:forEach>
      </div>
    </div>
		
		<div class="row">
		  <div class="form-group">
	      <label class="col-sm-2 control-label" for="description">商品描述</label>
	    </div>
			<div class="col-sm-10 col-md-offset-1">
				<textarea class="form-control" id="description" name="description" rows="30" cols="80">
           ${goods.description}
         </textarea>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="reset" class="btn btn-default">重置</button>
		<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		<button type="submit" class="btn btn-primary">提交</button>
	</div>
</form>

<style>
.carousel-inner img {
height: 250px !important;
}
</style>
<script type="text/javascript" src="${ctx}/static/js/app_single.js" />
<script>
  $(function() {
    var editor = CKEDITOR.replace('description');
    
    if('${goods.id}' == '') {
      var node = getSelectedNode();
      if(!node) {
        notice.error('请先选择左侧类目')
        return;
      }
      $('#input_category_name').val(node.name);
      $('#parent').val(node.id);
      
      if(!node.active) {
        notice.error('请注意，' + node.name + '节点为失效状态，您不应该再该节点下增加子节点');
      }
    }
  })
  
  function beforeAddImage() {
    if($('.carousel-inner').find('div.item').length >= 5) {
      notice.errro('抱歉，目前只支持上传5张商品图');
      return false;
    }
    return true;
  }
  
  function addImageCallback(data) {
    
    if(!data.success) {
      notice.error(data.msg || '错误： 文件上传失败');
      return;
    }
    $('.carousel-inner .item').removeClass('active');
    
    $('<div class="item active"><img src="'+data.url+'" class="img-responsive center-block">' + 
        '<div class="carousel-caption"><input type="radio" name="image" class="minimal icheck" value="' + data.url + 
        '"></div>   </div>').appendTo('.carousel-inner');
    //$item.appendTo('.carousel-inner');
    
    $("#carousel-example-generic").carousel("pause").removeData('carousel');
    $('#carousel-example-generic').carousel("pause");
  }
  
  function beforeChangeImage() {
    var $active = $('.carousel-inner').find('div.item.active');
    if(!$active.length) {
      notice.error('请先添加图片');
      return false;
    }
    return true;
  }
  
  function changeImageCallback(data) {
    var $active = $('.carousel-inner').find('div.item.active');
    var $this = $(this);  // input file element
    var goodsImageId = $active.data('goodsimage');
    if(goodsImageId != null && goodsImageId != undefined) {
      ajax({
        url: '${ctx}/sku/goodsimage/update',
        data: {id: goodsImageId, src : data.url},
        type: 'POST',
        success: function(d) {
          var $active = $('.carousel-inner').find('div.item.active');
          console.log(data.url);
          $active.find('img').attr('src', data.url);
          $active.find('input[type="radio"]').val(data.url);
        }
      })
    } else {
      var $active = $('.carousel-inner').find('div.item.active');
      $active.find('img').attr('src', data.url);
      $active.find('input[type="radio"]').val(data.url);
    }
  }
  
  function deleteImage() {
    var $active = $('.carousel-inner').find('div.item.active');
    
    if($active.length == 0) {
      notice.information('请先添加图片');
    }
    
    console.log('unModifiable ::' + $active.attr('unModifiable'));
    if($active.hasClass('unModifiable')) {
      notice.information('网络图片地址，无需删除，只要选中其他图片为主图即可');
      return;
    }
    
    var goodsImageId = $active.data('goodsimage');
    if(goodsImageId != null && goodsImageId != undefined) {
      ajax({
        url: '${ctx}/sku/goodsimage/delete/' + goodsImageId,
        type: 'DELETE',
        success: function() {
          deleteCarouselDom.call($active);
        }
      })
    } else {
      deleteCarouselDom.call($active);
    }
  }
  
  function deleteCarouselDom() {
    var $item = $(this).prev().length ? $(this).prev() : $(this).next();
    
    if($item.length) {
      $item.addClass('active');
      $("#carousel-example-generic").carousel("pause").removeData('carousel');
      $('#carousel-example-generic').carousel("pause");
    }
    $(this).remove();
  }
  
  function before_submit() {
    for(var instanceName in CKEDITOR.instances)
      CKEDITOR.instances[instanceName].updateElement();
    
    var images = [];
    var sorts = [];
    if($('.carousel-inner .item').length == 0) {
      notice.information('未上传商品图');
      return false;
    }
    var inputLength = $('.carousel-inner div.item input[type="radio"]:checked').length;
    console.log('inputLength::' + inputLength);
    if(inputLength == 0) {
      notice.information('请选择商品主图');
      return false;
    }
    
    $('.carousel-inner .item').each(function(i) {
      var $this = $(this);
      var unModifiable = $this.attr('unModifiable');
      if($this.data('goodsimage') || unModifiable) {
        return;
      }
      
      images.push($this.find('img').eq(0).attr('src'));
      sorts.push(i);
    });
    
    console.log(images.join(','));
    $('#images').val(images.join(','));
    $('#sorts').val(sorts.join(','));
    return true;
  }
  
  function addProperty() {
    $('#div_group').append(
        '        <div class="property_group">' + 
        '          <div class="col-sm-5 col-md-offset-1">' + 
        '            <input class="form-control" name="key" type="text" required />' + 
        '          </div>' + 
        '          <div class="col-sm-5 input-group">' + 
        '            <input class="form-control" name="value" type="text" required />' + 
        '            <a href="javascript:;" onclick="delProperty(this);" class="btn btn-default btn-sm input-group-addon" title="删除"> <i class="fa fa-minus-square"></i></a>' +
        '          </div>' + 
        '        </div>'
        );
  }
  
  function delProperty(obj) {
    $(obj).parents('.property_group').remove();
  }
</script>