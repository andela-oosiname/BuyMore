 $(document).ready(function(){

  $(".add-to-cart").on("click", function () {
    Materialize.toast("Item Added", 2000);
  })

  $(".cart-drop-down").on("click", function() {
    fillCart();
    console.log("here");
  })

  function fillCart() {
    $.ajax({
      url: "/set-cart",
      type: "GET"
    });
  }


  $('select').material_select();

});

