$(document).ready(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function(e) {
        $('.picture_user img').attr('src', e.target.result);
      }

      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#user_image").change(function() {
    readURL(this);
  });

  $('.user_image').on('click', function() {
    $('#user_image').trigger('click');

  });
});
