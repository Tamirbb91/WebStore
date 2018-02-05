$(function(){
    var totalsum = parseFloat($("#total_price").html().substring(1));
    $("#total_price").html("$ " + totalsum.toFixed(2));

    updateProducts();
    var toastMessage = $("#toast_message").html();
    if(toastMessage){
        $("#toast").css("display", "block");
        window.setTimeout(function(){
            $("#toast").css("display", "none");
        }, 3000);
    }

    $(".product> .prod_remove_cart").click(function(){
        var totalsum = parseFloat($("#total_price").html().substring(1));
        totalsum -= parseFloat($(this).parent().attr("data-id"));
        $("#total_price").html("$ " + totalsum.toFixed(2));
        $(this).parent().remove();
        var product = new Array();
        if($.cookie("product")){
            product = JSON.parse($.cookie("product"));
        }
        for(var i=0; i< product.length; i++){
            if(product[i] == $(this).attr("prod_id")){
                product.splice(i, 1);
                break;
            }
        }
        $.cookie("product", JSON.stringify(product), { expires : 10 , path : '/'});
        showToast("The product removed from your cart");
        var count = $("#cart_count").html();
        if(count > 1){
            $("#cart_count").html(--count).css("display","block");
        } else {
            $("#cart_count").html(0).css("display","none");
        }
    });

});