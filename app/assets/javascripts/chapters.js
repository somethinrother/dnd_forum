document.addEventListener('DOMContentLoaded', function(){
  // Selects the setting_detail form wrapper
  var newDetail = document.querySelector('#new_chapter');
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
          var button = document.querySelector('.chapter-submit');
          button.disabled = false;
        } else if (responseData.title != '' && responseData.description != '') {
          var div = document.createElement('div');
          div.className = 'chapter-tab';
          var listNum = document.querySelectorAll('.chapter-tab').length + 1;
          var title = responseData.title
          div.innerText = listNum.toString() + '. ' + title
          var chaptersList = document.querySelector('.chapters');
          chaptersList.append(div);
        }
        // Clear out the text field
        $('#new_chapter').trigger("reset");

        var button = document.querySelector('.chapter-submit');
        button.disabled = false;
      }).fail(function(){
        console.log(arguments);
      });
    });
  };

  // For hiding and showing the new setting details form
  var button = document.querySelector('.new-chapter-button');
  button.addEventListener('click', function(e){
    e.preventDefault();
    e.target.style.display = 'none';
    var form = document.querySelector('#new_chapter');
    var closeButton = document.querySelector('.new-chapter-close');
    form.style.display = 'block';
    closeButton.className = 'new-chapter-close';
  });

  var closeButton = document.querySelector('.new-chapter-close');
  closeButton.addEventListener('click', function(e){
    e.preventDefault();
    e.target.className = 'new-chapter-close hidden';
    var form = document.querySelector('#new_chapter');
    var button = document.querySelector('.new-chapter-button');
    form.style.display = 'none';
    button.style.display = 'block';
  });
});
