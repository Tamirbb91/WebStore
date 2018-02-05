$(function(){
    updateProducts();

    var toastMessage = $("#toast_message").html();
    if(toastMessage){
        $("#toast").css("display", "block");
        window.setTimeout(function(){
            $("#toast").css("display", "none");
        }, 3000);
    }

    $(".product>.prod_add_cart").click(function () {
        var product = new Array();
        if ($.cookie("product")) {
            product = JSON.parse($.cookie("product"));
        }
        product.push($(this).attr("prod_id"));
        // $.cookie("product", JSON.stringify(product));

        $.cookie("product", JSON.stringify(product), {expires: 10, path: '/'});
        showToast("The product added to your cart");
        var count = $("#cart_count").html();
        if(count){
            count++;
        } else {
            count = 1;
        }

        $("#cart_count").html(count).css("display","block");

        // var date = new Date();
        // date.setTime(date.getTime() + (1*24*60*60*1000));
        // var expires = "; expires=" + date.toUTCString();
        // document.cookie = "product" + "=" + (JSON.stringify(product) || "")  + expires + "; path=/";
    });
});