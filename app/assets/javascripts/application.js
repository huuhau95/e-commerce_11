// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-1.10.2.min
//= require jquery.carouFredSel-6.2.1-packed
//= require jquery.easing.1.3
//= require jquery.flexslider
//= require rails-ujs
//= require script.min
//= require jquery.sequence-min
//= require jquery.elevatezoom.js
//= require toastr
//= require turbolinks
$(document).ready(function(){
  toastr.options = {
  "closeButton": false,
  "debug": false,
  "newestOnTop": false,
  "progressBar": false,
  "positionClass": "toast-bottom-right",
  "preventDuplicates": false,
  "onclick": null,
  "showDuration": "300",
  "hideDuration": "1000",
  "timeOut": "5000",
  "extendedTimeOut": "1000",
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut"
}
});
$(document).on('click', '.star_point', function(e){
  toastr['success']('Thank you rating product');
  $('#Scomit').click();
});
$(document).on('turbolinks:load', function() {
  $(".scroll-to-product").click(function(){
      $('html, body').animate({
      scrollTop: $(".container_fullwidth").offset().top-109
        }, 1000)
  });
})
