$(function() {
  console.log('app_single.js ready');
  
  _beauty_checkbox();

  _date_picker();

  initialzeOnloading();
  
  //为inputForm注册validate函数
  $('form[form-validate]').validate({
    submitHandler : function(form) {
      console.log('app_single.js submit handler');
      
      var config = $(form).data('config') || {};
      var func = window[config.before];
      console.log(func);
      if(typeof func == 'function') {
        var result = func();
        if(!result)
          return false;
      }
      ajax({
        url : $(form).attr('action'),
        type : $(form).attr('method') || 'GET',
        data : $(form).serialize(),
        success : function(data) {
          notice.information('save successful');
          $('body').removeClass('modal-open').removeClass('pace-done').removeAttr('style');
          $('#modal_form').modal('hide');
          $('.modal-backdrop').hide();
          $('#button_search').click();
        }
      })
    }
  });
})