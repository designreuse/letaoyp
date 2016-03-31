<%@page import="com.iac.letaoyp.entity.info.Advertise.Model"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.iac.letaoyp.entity.info.Advertise" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<form id="form" class="form-horizontal" form-validate action="${ctx}/info/advertise/update" method="post">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="myModalLabel">${advertise.id == null ? '新增' : '编辑'}</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<!-- form start -->
			<input type="hidden" id="id" name="id" value="${advertise.id}" />

			<div class="form-group">
				<label class="col-sm-4 control-label" for="model">模块</label>
				<div class="col-sm-6">
				  <!-- 从其他页面跳转过来 指定model参数后 则不允许再选择模块 disabled-->
				  <select id="select_model" name="model" class="form-control" <c:if test="${param.model != null}">disabled</c:if>>  
				    <% 
				      Advertise advertise = (Advertise)request.getAttribute("advertise");
				      String modelParam = request.getParameter("model");
				      for(Advertise.Model model : Model.values()) {
				    %>
				    <option value="<%= model.name() %>" 
				      <% if( (advertise !=null && model == advertise.getModel()) || model.name().equals(modelParam)) { %>
				        selected="selected"
				      <% } %>
				      data-option='{"width":<%= model.getWidth() %>, "height": <%= model.getHeight() %>}'
				      <% if(model == Advertise.Model.HOME_CATEGORY) {%>
                disabled
              <% }%>
				    >
				      <%= model.getDescription() %>
				    </option>
				    <%} %>
				  </select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="image">广告图片<span id="label_size"></span></label>
				<div class="col-sm-6">
				  <img alt="" id="img_advertise" src="${advertise.image}" width="300px" />
					<input id="image" name="image" type="hidden" value="${advertise.image}" />
          <input type="file" class="pos-abs pic_upload" 
               data-config='{"url": "${ctx}/admin/file/upload", "input_img":"#img_advertise", "input_id":"#image"}' />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="text">广告内容</label>
				<div class="col-sm-6">
					<input class="form-control" id="text" name="text" type="text" value="${advertise.text}" 
					   data-rule-required="true" data-msg-required="请输入广告内容描述" /> 
					<span class="help-inline"><form:errors path="text" /></span>
				</div>
			</div>
			<div class="form-group">
        <label class="col-sm-4 control-label" for="index">索引值</label>
        <div class="col-sm-6">
          <input class="form-control" id="index" name="index" type="text" 
            value="${advertise.index == null ? param.index : advertise.index}" <c:if test="${param.model != null}">disabled</c:if> />
        </div>
      </div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="link">链接地址</label>
				<div class="col-sm-6">
					<input class="form-control" id="link" name="link" type="text" value="${advertise.link}" /> <span
						class="help-inline"><form:errors path="link" /></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="active">状态</label>
				<div class="col-sm-6">
					<input type="radio" name="active" class="minimal icheck" <c:if test="${advertise.active}">checked</c:if> value="1">
					<span class="label label-success">Active</span> &nbsp;&nbsp; <input type="radio" name="active"
						class="minimal icheck" <c:if test="${!advertise.active}">checked</c:if> value="0"> <span
						class="label label-danger">Banned</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="created">创建时间</label>
				<div class="col-sm-6">
					<input class="form-control" id="created" name="created" type="text"
						value="<fmt:formatDate value='${advertise.created}' pattern='yyyy-MM-dd HH:mm:ss'/>" disabled>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="modified">修改时间</label>
				<div class="col-sm-6">
					<input class="form-control" id="modified" name="modified" type="text"
						value="<fmt:formatDate value='${advertise.modified}' pattern='yyyy-MM-dd HH:mm:ss'/>" disabled>
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
    var option = $('#select_model option:selected').data('option');
    select(option);
    
    $('#select_model').change(select);
  })
  
  function select(option) {
    option = $(this).find('option:selected').data('option') || option;
    
    $('#label_size').html('(' + option.width + ' * ' + option.height + ')');
    $('#img_advertise').css({width: '380px', height: option.height / option.width * 300 + 'px'});
  }
</script>