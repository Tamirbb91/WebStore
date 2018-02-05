function showToast(msg){
    $("#toast").html(msg).css("display", "block");
    window.setTimeout(function(){
        $("#toast").css("display", "none");
    }, 3000);
}

function updateProducts(){
    var product = new Array();
    if ($.cookie("product")) {
        product = JSON.parse($.cookie("product"));
    }
    $("#cart_count").html(product.length).css("display", "block");
}