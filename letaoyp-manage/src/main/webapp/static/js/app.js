$(function() {
  "use strict";
  _initialize();
})

function errorHandler(jqXHR, error, errorThrown) {
  var status = jqXHR.status;
  if (status == 405) {
    notice.error('不支持的方法');
  } else if (status == 401) {
    // needLogin
    notice.error('会话失效，请重新登录');
    setTimeout(function() {
      location.reload();
    }, 1000);
  } else if (status == 403) {
    var headerMsg = jqXHR.getResponseHeader('msg');
    notice.error(headerMsg || '系统错误，请稍后再试');
  } else if (status == 400) {
    notice.error('参数错误');
  } else {
    notice.error('系统错误，请联系管理员');
  }
}

function ajax(config) {
  var errorFunc = config.error;
  var successFunc = config.success;
  var complateFunc = config.complete;

  var settings = {
      type: config.type || 'get',
      success: function(data) {
        if(data.success) {
          if (successFunc) {
            successFunc(data);
          }
        } else {
          notice.error(data.msg || '操作失败');
        }
      },
      error: errorHandler,
      complete: function() {
          if (complateFunc) complateFunc();
      }
  }
  $(document).ajaxStart(function() { Pace.restart(); });
  $.ajax($.extend(config, settings));
}

function page(page) {
  $('#page').val(page || $('ul.pagination li.active a').text() || 1);
  $('#button_search').click();
}

/**
 * 图片上传
 * input file 移到创建的form表单中 提交完毕再移回去 
 * TODO: 目前都是input file 外围包装一个a标签 所以直接$parent.append(this) 
 * 需要再改进成通用的方式 有多个节点时 移回去位置会错乱
 */
function picUpload() {
    var $this = $(this);
    $this.prop('name', 'file');
    var $form = $('#pic-ajax-upload');
    if (!$form.length) {
        $form = $('<form id="pic-ajax-upload" style="display: none;" method="post" enctype="multipart/form-data"></form>');
        $('body').append($form);
    }

    $form.html(''); //清空参数
    var $parent = $this.parent();
    $form.append($this);
    var config = $this.data('config');
    var submitData = $this.data('data');
    for (var i in submitData) {
        $form.append('<input name="' + i + '" value="' + submitData[i] + '" />');
    }
    var $inputImg = $(config.input_img);
    var $inputId = $(config.input_id);
    
    if (!$inputImg.length || !$inputId.length) {
        layer.msg('ajax upload file must define input_img and input_id with data-config attribute');
        return;
    }
    var oringnalSrc = $inputImg.prop('src');
    //  $.extend(data, config || {});
    $form.ajaxSubmit({
        url: config.url || $form.attr('action'),
        success: function(data) {
            if(typeof data == 'string') {
                var d = eval("("+data+")");
            } else {
                var d = data;
            }
            
            if (d.success) {
                $inputImg.attr('src', d.url);
                $inputId.val(d.url);
            } else {
                notice.error(d.msg || '文件上传失败');
                $inputId.val('');
                $inputImg.attr('src', oringnalSrc);
            }
        },
        error: errorHandler,
        complete: function() {
            $parent.append($this);
        }
    });
}

function _beauty_checkbox() {
  // Enable iCheck plugin for checkboxes
  // iCheck for checkbox and radio inputs
  $('input[type="checkbox"].icheck, input[type="radio"].icheck').iCheck({
    checkboxClass : $(this).data('checkboxClass') || 'icheckbox_minimal-blue',
    radioClass : $(this).data('radioClass') || 'iradio_minimal-blue'
  });
}

function _date_picker() {
  var _defaultOption = {
    autoclose : true
  };

  // $.extend(_defaultOption, $(this).data('config') || {} );
  $('.datepicker').datepicker(_defaultOption);
}

/**
 * noty function
 */
var default_noty_options = {
  dismissQueue : true,
  timeout : 6000,
  closeWith : [ 'click' ],
  layout : 'topRight',
  maxVisible : 3
}

var notice = {};
notice.information = function(message, layout) {
  if (typeof message == undefined || message.length == 0)
    return;

  noty($.extend(default_noty_options, {
    text : message,
    type : 'information',
    layout : layout || 'topRight'
  }));
}
notice.error = function(message, layout) {
  if (typeof message == undefined || message.length == 0)
    return;

  noty($.extend(default_noty_options, {
    text : message,
    type : 'error',
    layout : layout || 'center'
  }));
}

notice.confirm = function(message, callback_ok, title_ok, callback_cancel,
    title_cancel) {
  noty({
    text : message,
    type : 'alert',
    dismissQueue : true,
    layout : 'center',
    theme : 'defaultTheme',
    buttons : [ {
      addClass : 'btn btn-primary',
      text : title_ok || 'Ok',
      onClick : function($noty) {
        $noty.close();
        callback_ok();
      }
    }, {
      addClass : 'btn btn-danger',
      text : title_cancel || 'Cancel',
      onClick : function($noty) {
        $noty.close();
        if (typeof callback_cancel == 'function') {
          callback_cancel();
        }
      }
    } ]
  });
}
/** noty function end */


function initialzeOnloading() {
  $('[initialze-onloading]').each(function() {
    var $this = $(this);
    var url = $this.attr('initialze-onloading');
    $this.removeAttr('initialze-onloading');
    
    $.ajax({
      url: url,
      type: 'get',
      success: function(html) {
        $($this.data('override') || $this).html(html);
      },
      error: errorHandler
    })
  })
}

function _initialize() {

  // Enable check and uncheck all functionality
  $(document).on('click', '.checkbox-toggle', function() {
    var clicks = $(this).data('clicks');
    var toggle_for = $(this).data('toggle-for');
    if (clicks) {
      // Uncheck all checkboxes
      $('#' + toggle_for).find("input[type='checkbox']").iCheck("uncheck");
      $(".fa", this).removeClass("fa-check-square-o").addClass('fa-square-o');
    } else {
      // Check all checkboxes
      $('#' + toggle_for).find("input[type='checkbox']").iCheck("check");
      $(".fa", this).removeClass("fa-square-o").addClass('fa-check-square-o');
    }
    $(this).data("clicks", !clicks);
  });

  // ajax_link
  $(document).on(
      'click',
      'a.ajax_link',
      function(e) {
        e.preventDefault();
        var $this = $(this);
        $(document).ajaxStart(function() { Pace.restart(); });
        
        $.ajax({
          url : $this.attr('href') || $this.attr('action')
              || ($this.data('config') ? $this.data('config').url : ''),
          data : $this.data('data') || {},
          success : function(html) {
            $($this.data('override') || '#content-wrapper').html(html);
          },
          error: errorHandler
        })
      });
  
  $(document).on(
      'click',
      'form .ajax_link',
      function(e) {
        e.preventDefault();
        var $this = $(this);
        var $form = $(this).parent('form');
        $(document).ajaxStart(function() { Pace.restart(); });
        $.ajax({
          url : $form.attr('action'),
          type: $form.attr('method') || 'GET',
          data : $form.serialize(),
          success : function(html) {
            $($this.data('override') || '#content-wrapper').html(html);
          },
          error: errorHandler
        })
      });
  
  $(document).on('click', '[ajax]', function(e) {
    e.preventDefault();
    var $this = $(this);
    var confirmMsg = $(this).data('confirm');
    if (confirmMsg) {
      notice.confirm(confirmMsg, $.proxy(settings, $this));
    } else {
      settings.apply(this);
    }
  })

  function getSelected() {
    var selected = [];
    $('.icheck[type=checkbox]').each(function() {
      if (/[0-9]+/g.test($(this).val()) && $(this).is(':checked'))
        selected.push($(this).val());
    })
    return selected;
  }

  function settings() {
    selected = getSelected();
    if (selected.length == 0) {
      notice.error('请至少选择一项');
      return;
    }

    $this = $(this);
    $this.data('settings');
    var data = $this.data('data') || {};
    data.ids = selected.join(',');
    ajax({
      url : $this.data('url') || $this.attr('action') || $this.attr('href'),
      type : $this.data('type') || $this.data('method') || 'GET',
      data : data,
      success : function(result) {
        notice.information(result.msg || 'ok，save success');
        $('#button_search').click();
      }
    })
  }
  
  $(document).on('click', '[data-toggle="modal"]', function(e) {
    var $this = $(this), $target = $($(this).data('target'));
    $.ajax({
      url: $this.attr('action'),
      success: function(html) {
        $target.find('.modal-content').html(html);
      },
      error: errorHandler
    })
    
  })
  
  $(document).on('click', '[single-delete]', function(e) {
    e.preventDefault();
    var $this = $(this), $target = $($(this).data('target'));
    notice.confirm('确认删除？ 删除后不可恢复', function() {
      $.ajax({
        url: $this.attr('action') || $this.attr('href') || $this.data('url'),
        type: 'DELETE',
        success: function(data) {
          notice.information(data.msg || 'delete success');
          page();
        },
        error: errorHandler
      })
    })
    
  })
  
  $(document).on('change', '#searchForm input', function(e) {
    $('#page').val(1);
  });
  
  //图片上传
  $(document).on('change', '.pic_upload', picUpload);
}