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
//= require jquery.turbolinks
//= require scroll.js
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
$(document).ready(function() {
  $("#q_g_0_c_0_a_0_name option[value=name]").attr("selected","selected") ;
  $("#q_g_0_c_0_a_0_name option[value='']").remove();
  $(".history_filter li #q_g_0_c_0_a_0_name").change(function(){
    a = $(this).val();
    if(a == "created_at"){
      $(this).parent().find("input[type=text]").attr("type","date")
    }
    else{
      $(this).parent().find("input[type=date]").attr("type","text")
    }
  });
  $("#gallery_01 li a").each(function(){
      $(this).click(function(){
        a = $(this).children().attr("src");
        $(this).parent().parent().parent().parent().siblings().children().attr("src",a)
      });
  });
});
