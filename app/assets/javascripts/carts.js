 $(document).ready(function(){

  $(".add-to-cart").on("click", function () {
    Materialize.toast("Item Added", 2000);
  })

  $('select').material_select();
});

