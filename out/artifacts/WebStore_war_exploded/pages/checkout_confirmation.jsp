<%--
  Created by IntelliJ IDEA.
  User: Tamir
  Date: 1/31/2018
  Time: 9:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="../resources/js/jquery.min.js"></script>
    <script src="../resources/js/jquery.cookie.js" type="text/javascript"></script>
    <title>Check out confirmation page</title>
</head>
<body>
    <c:forEach items="${purchaseItems}" var="item">
        <div class="product">
            <img src="${item.image}">
            <span>${item.name}</span>
            <span>$${item.price}</span>
            <button prod_id="${item.productId}">remove from cart</button>
        </div>
    </c:forEach>
    <form action="http://localhost:8080/final_purchase">
        <input type="submit" value="Purchase">
    </form>

    <script>
        $(".product>button").click(function(){
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
        });
    </script>
</body>
</html>
