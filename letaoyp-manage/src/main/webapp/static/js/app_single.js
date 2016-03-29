$(function() {
  _beauty_checkbox();

  _date_picker();

  //为inputForm注册validate函数
  $('form[form-validate]').validate({
    submitHandler : function(form) {
      ajax({
        url : $(form).attr('action'),
        type : $(form).attr('method') || 'GET',
        data : $(form).serialize(),
        success : function(data) {
          notice.information('save successful');
          $('#modal_rolepermission_form').modal('hide');
          $('.modal-backdrop').hide();
          $('#button_search').click();
        }
      })
    }
  });
})