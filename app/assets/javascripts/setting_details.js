document.addEventListener('DOMContentLoaded', function(){
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
        } else if (responseData.title != '' && responseData.description != '') {
          var div = document.createElement('div');
          var title = responseData.title.charAt(0).toUpperCase() + responseData.title.slice(1);
          var description = responseData.description.charAt(0).toUpperCase() + responseData.description.slice(1);
          div.innerText = title + ' - ' + description
          var detailsList = document.querySelector('.setting-details');
          detailsList.append(div);
        }
        // Clear out the text field
        $('#new_setting_detail').trigger('reset');

        var button = document.querySelector('.detail-submit');
        button.disabled = false;
      }).fail(function(){
        console.log(arguments);
      });
    });
  };

  // For hiding and showing the new setting details form
  var button = document.querySelector('.new-setting-button');
  if (button) {
    button.addEventListener('click', function(e){
      e.preventDefault();
      e.target.style.display = 'none';
      var form = document.querySelector('#new_setting_detail');
      var closeButton = document.querySelector('.new-setting-close');
      form.style.display = 'block';
      closeButton.className = 'new-setting-close';
    });
  }

  var closeButton = document.querySelector('.new-setting-close');
  if (closeButton) {
    closeButton.addEventListener('click', function(e){
      e.preventDefault();
      e.target.className = 'new-setting-close hidden';
      var form = document.querySelector('#new_setting_detail');
      var button = document.querySelector('.new-setting-button');
      form.style.display = 'none';
      button.style.display = 'block';
    });
  }
});
