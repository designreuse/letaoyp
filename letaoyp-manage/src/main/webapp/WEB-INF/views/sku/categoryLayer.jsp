<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${ctx}/static/plugins/ztree/metroStyle/metroStyle.css">
<section class="content-header">
	<h1>
		sku <small>类目</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="${ctx}/admin"><i class="fa fa-dashboard"></i> Home</a></li>
		<li>sku</li>
		<li class="active">类目</li>
	</ol>
</section>

<section class="content">
	<div class="row">
	
	  <div class="col-md-2">
	    <ul id="ul_category_tree" class="ztree"></ul>
	  </div>
		<div id="loading" initialze-onloading="${ctx}${loading}" class="col-xs-10">
			
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
</section>


<div id="modal_form" class="modal fade" role="dialog" aria-labelledby="...">
	<div class="modal-dialog">
		<div class="modal-content"></div>
	</div>
</div>
<!-- /.modal -->

<script type="text/javascript" src="${ctx}/static/js/app_single.js" />
<script type="text/javascript" src="${ctx}/static/plugins/ztree/jquery.ztree.all-3.5.js" />

<script>
  function filterAndSubtract(treeId, parentNode, childNodes) {
    if (!childNodes.data)
      return null;
    for (var i = 0, l = childNodes.data.length; i < l; i++) {
      childNodes.data[i].isParent = !childNodes.data[i].isLeaf;
      var name = childNodes.data[i].name.replace(/\.n/g, '.');
      childNodes.data[i].title = name;

      name = name.length > 10 ? name.substring(0, 10) + '...' : name;
      childNodes.data[i].name = name;
    }
    return childNodes.data;
  };
  
  function getSelectedNode() {
    var treeObj = $.fn.zTree.getZTreeObj('ul_category_tree');
    return treeObj.getSelectedNodes()[0];
  }

  $(function() {
    var setting = {
      data : {
        key : {
          title : 'title'
        }
      },
      async : {
        enable : true,
        url : "${ctx}/sku/category/child",
        autoParam : [ "id=parent" ],
        dataFilter : filterAndSubtract,
        type : 'get'
      },
      simpleData : {
        enable : true,
        idKey : "id",
        pIdKey : "pid",
        rootPId : 0
      },
      view : {
        showIcon : true,
        selectedMulti : false
      },
      callback : {
        onClick : function(event, treeId, treeNode) {
          $('#input_search_category').val(treeNode && treeNode.id ? treeNode.id : '');
          $('#button_search').click();
        }
        //onAsyncSuccess : ztreeOnAsyncSuccess
      }
    };

    $.fn.zTree.init($("#ul_category_tree"), setting);
  })
</script>