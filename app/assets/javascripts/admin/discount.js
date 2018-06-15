$(document).ready(function(){
  $("#old_price,#discount,#new_price").keyup(function(){
    var re = /([,])/g;
    var old_price1 = $("#old_price").val();
    var old_price = old_price1.replace(re,"");
    var discount = $("#discount").val();
    if(discount>0&&discount<100){
      var percentage = old_price * discount / 100;
      var new_price = old_price - percentage;
      $("#new_price").val(Math.ceil(new_price));
    }
    else if(discount == ""){
      $("#new_price").val(old_price1);
    }
    else{
      $("#discount").text("");
    }
  });
});
function handleChange(input) {
  if (input.value < 0) input.value = 0;
  if (input.value > 99) input.value = 99;
}
