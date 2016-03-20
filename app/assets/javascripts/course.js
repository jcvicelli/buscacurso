
$( document).on( "ready", function(){
  if($("#course_free").is(':checked')){
    $("#course_price").prop('readonly', true); // checked
    $("#course_payment_method").prop('readonly', true);
  }else{
    $("#course_price").prop('readonly', false);  // unchecked
    $("#course_payment_method").prop('readonly', false);
  }
});

$( document).on( "change", "#course_free", function(){
  if($("#course_free").is(':checked')){
    $("#course_price").val("0,00");
    $("#course_price").prop('readonly', true); // checked
    $("#course_payment_method").val("");
    $("#course_payment_method").prop('readonly', true); // checked
  }else{
    $("#course_price").prop('readonly', false);  // unchecked
    $("#course_payment_method").prop('readonly', false);
  }
});
