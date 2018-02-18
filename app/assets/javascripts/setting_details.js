// Selects the setting_detail form wrapper
var newDetail = document.querySelector('#new_setting_detail');
// ensures content is present
if (newDetail) {
  newDetail.addEventListener('submit',function(e){
    // 1. Prevent the browser from submitting the form
    e.preventDefault();
    //2. Make an AJAX call
    $.ajax({
      url: $(this).attr('action'),
      method: $(this).attr('method'),
      data: $(this).serialize(),
      dataType: 'json'
    }).done(function(responseData){
      console.log(responseData);
      if (responseData.errors) {
        // Resets the button to an active state if an error occurs
        var button = document.querySelector('.detail-submit');
        button.disabled = false;
      } else {
        var div = document.createElement('div');
        div.innerText = responseData.title + ' - ' + responseData.details
      }
      // Clear out the text field
      $('#new_setting_detail').trigger("reset");

      var button = document.querySelector('.detail-submit');
      button.disabled = false;
    }).fail(function(){
      console.log(arguments);
    });
  });
};
