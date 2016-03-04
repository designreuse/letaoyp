$(function() {
	// register validate funciton, depends on jquery-validate frame
	//$('form').validate();
	
	//ajaxify menus
	$('#content a.ajax-link').click(function(e){
		var $clink=$(this);
		$clink.parent('li').addClass('active');	
		ajaxSubmit($clink.attr('action'), 'get', null);
	});
	
	// ajax 异步提交form表单
	$('#form_submit').click(function() {
		var $clink = $(this);
		var $form = $clink.parents('form');
		
		ajaxSubmit($form.attr('action'), $form.attr('method') || 'post', $form.serialize());
	});
})