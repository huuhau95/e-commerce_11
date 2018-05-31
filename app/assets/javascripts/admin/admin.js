/*
//= require jquery
//= require bootstrap
//= require toastr
//= require rails-ujs
//= require turbolinks
//= require admin/dashboard.js
//= require_self
*/
$(document).ready(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function(e) {
        $('.view-img img').attr('src', e.target.result);
      }

      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#user_picture").change(function() {
    readURL(this);
  });

  $('.user_picture').on('click', function() {
    $('#user_picture').trigger('click');

  });
});
