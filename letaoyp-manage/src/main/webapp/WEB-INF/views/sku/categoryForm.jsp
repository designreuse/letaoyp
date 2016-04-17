<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<form id="form" class="form-horizontal" form-validate action="${ctx}/sku/category/update" method="post">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="myModalLabel">${category.id == null ? '新增' : '编辑'}</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<!-- form start -->
			<input type="hidden" id="id" name="id" value="${category.id}" />

			<div class="form-group">
				<label class="col-sm-4 control-label" for="name">类目名称</label>
				<div class="col-sm-6">
					<input class="form-control" id="name" name="name" type="text" value="${category.name}" data-rule-required="true"
						data-msg-required="请输入类目名称" /> <span class="help-inline"><form:errors path="name" /></span>
				</div>
			</div>
			
			<shiro:hasRole name="admin">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="seoDescription">seoDescription</label>
					<div class="col-sm-6">
						<input class="form-control" id="seoDescription" name="seoDescription" type="text"
							value="${category.seoDescription}" /> <span class="help-inline"><form:errors path="seoDescription" /></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label" for="seoKeywords">seoKeywords</label>
					<div class="col-sm-6">
						<input class="form-control" id="seoKeywords" name="seoKeywords" type="text" value="${category.seoKeywords}" /> <span
							class="help-inline"><form:errors path="seoKeywords" /></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label" for="seoTitle">seoTitle</label>
					<div class="col-sm-6">
						<input class="form-control" id="seoTitle" name="seoTitle" type="text" value="${category.seoTitle}" /> <span
							class="help-inline"><form:errors path="seoTitle" /></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label" for="treePath">treePath</label>
					<div class="col-sm-6">
						<input class="form-control" id="treePath" name="treePath" type="text" value="${category.treePath}" readonly="readonly"/> 
						<span class="help-inline"><form:errors path="treePath" /></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label" for="treeName">treeName</label>
					<div class="col-sm-6">
						<input class="form-control" id="treeName" name="treeName" type="text" value="${category.treeName}" readonly="readonly" /> 
						<span class="help-inline"><form:errors path="treeName" /></span>
					</div>
				</div>
				<div class="form-group">
	        <label class="col-sm-4 control-label" for="isLeaf">isLeaf</label>
	        <div class="col-sm-6">
	          <input class="form-control" id="isLeaf" name="isLeaf" type="text" value="${category.isLeaf}" readonly="readonly"/> <span
	            class="help-inline"><form:errors path="isLeaf" /></span>
	        </div>
	      </div>
	      <div class="form-group">
	        <label class="col-sm-4 control-label" for="level">层级</label>
	        <div class="col-sm-6">
	          <input class="form-control" id="level" name="level" type="text" value="${category.level}" readonly="readonly"/> <span
	            class="help-inline"><form:errors path="level" /></span>
	        </div>
	      </div>
			</shiro:hasRole>
			
			<div class="form-group">
				<label class="col-sm-4 control-label" for="parent">父类目</label>
				<div class="col-sm-6">
				  <input type="text" class="form-control" id="input_category_name" readonly="readonly"> 
					<input class="form-control" id="parent" name="parent" type="hidden" value="${category.parent}" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-4 control-label" for="icon">图标(60 * 60)</label>
				<div class="col-sm-6">
					<input id="icon" name="icon" type="hidden" value="${category.icon}" />
				  <img id="img_icon" src="${category.icon}" width="60" height="60">
				  <input type="file" class="pos-abs pic_upload" 
               data-config='{"url": "${ctx}/admin/file/upload", "input_img":"#img_icon", "input_id":"#icon"}' />
				</div>
			</div>
			<div class="form-group">
        <label class="col-sm-4 control-label" for="sort">排序(越大越靠前)</label>
        <div class="col-sm-6">
          <input class="form-control" id="sort" name="sort" type="text" value="${category.sort}" /> <span
            class="help-inline"><form:errors path="order" /></span>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-4 control-label" for="top">置顶至首页</label>
        <div class="col-sm-6">
          <input class="form-control" id="top" name="top" type="text" value="${category.top ? '是' : '否'}" readonly="readonly" />
        </div>
      </div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="logo">类目logo (150 * 60)</label>
				<div class="col-sm-6">
					<input class="form-control" id="logo" name="logo" type="hidden" value="${category.logo}" />
          <img id="img_logo" src="${category.logo}" width="150px" height="60px">
				  <input type="file" class="pos-abs pic_upload" 
               data-config='{"url": "${ctx}/admin/file/upload", "input_img":"#img_logo", "input_id":"#logo"}' />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="active">active</label>
				<div class="col-sm-6">
					<input type="radio" name="active" class="minimal icheck" <c:if test="${category.active}">checked</c:if> value="1">
					<span class="label label-success">Active</span> &nbsp;&nbsp; <input type="radio" name="active"
						class="minimal icheck" <c:if test="${!category.active}">checked</c:if> value="0"> <span
						class="label label-danger">Banned</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="created">created</label>
				<div class="col-sm-6">
					<input class="form-control" id="created" name="created" type="text"
						value="<fmt:formatDate value='${category.created}' pattern='yyyy-MM-dd HH:mm:ss'/>" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="modified">modified</label>
				<div class="col-sm-6">
					<input class="form-control" id="modified" name="modified" type="text"
						value="<fmt:formatDate value='${category.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>" readonly="readonly">
				</div>
			</div>

		</div>
	</div>
	<div class="modal-footer">
		<button type="reset" class="btn btn-default">重置</button>
		<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		<button type="submit" class="btn btn-primary">提交</button>
	</div>
</form>

<script type="text/javascript" src="${ctx}/static/js/app_single.js" />
<script>
$(function() {
  if('${category.id}' == '') {
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
  
  $('#top').click(function() {
    
  })
})
</script>