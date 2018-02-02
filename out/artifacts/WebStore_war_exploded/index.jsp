<%--
Created by IntelliJ IDEA.
User: 986214
Date: 1/30/2018
Time: 1:49 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script src="../resources/js/jquery.min.js"></script>
  <script src="../resources/js/jquery.cookie.js" type="text/javascript"></script>
  <title>Main page</title>
  <style>
      @font-face {
          font-family: "titillium_web";
          src: url("resources/fonts/TitilliumWeb-Light.ttf");
      }
    .product{
        float: left;
      text-align: center;
        margin: 10px;
      width: 400px;
      height: 400px;
      display: inline-block;
      box-shadow: 0px 0px 2px 2px rgba(50, 50, 50, 0.5);
    }

      #store_name {
          color: white;
          font-size: 50px;
          margin: 5px;
          font-family: titillium_web, serif;
          float: left;
      }

      #login_part{
          float: right;
          text-align: right;
          margin: 5px;
      }

    .product:hover{
        box-shadow: 2px 2px 4px 4px rgba(50, 50, 50, 0.5);
    }

    .prod_img{
        height: 75%;
    }

    .prod_add_cart{
        height: 50px;
        color: #000;
        cursor: pointer;
        background-color: #29434e;
        text-align: center;
    }

    .prod_add_cart>img{
        margin: 10px;
    }

    .prod_add_cart:hover{
        background-color: #819ca9;
    }

    #header{
        left: 0;
        margin: 0px;
        padding: 0px;
        box-shadow: 3px 0px 2px 4px rgba(50, 50, 50, 0.5);
        background-color: #37474f;
        position: fixed;
        top: 0;
        height: 100px;
        width: 100%;
    }

    #header+*{
      margin-top: 100px;
    }

      #header a{
          margin-right: 10px;
      }

      #products {
          width: 95%;
          margin: auto;
          text-align: center;
      }

      #toast{
        position:fixed;
          right: 20px;
          bottom: 20px;
          text-align: center;
          background-color: rgba(0,0,0,0.75);
          color: azure;
          width: 300px;
          height: 50px;
          padding: 5px;
          font-weight: bold;
      }
  </style>
</head>
<body>
<div id="header">
  <p id="store_name">Sport clothes store</p>
  <div id="login_part">
      <a href="http://localhost:8080/checkout">
          <img src="resources/images/cart.svg">
      </a>
      <a href="http://localhost:8080/login">
          <img src="resources/images/login-variant.svg" alt="login image">
      </a>
  </div>
</div>
<h1>Welcome to main page</h1>
<p><a href="contact.jsp">Contact page</a></p>
<div id="products">
    <div class="product">
      <img class="prod_img" src="https://shop.polymer-project.org/es6-unbundled/data/images/10-14133A.jpg">
      <p>YouTube Ultimate Hooded Sweatshirt $32.35</p>
        <div class="prod_add_cart">
            <img  prod_id="shirt1" src="resources/images/cart-plus.svg" alt="Add to cart">
        </div>
    </div>
    <div class="product">
      <img class="prod_img" src="https://shop.polymer-project.org/es6-unbundled/data/images/10-14152A.jpg">
      <p>Rowan Pullover Hood $60.85</p>
        <div class="prod_add_cart">
            <img  prod_id="shirt1" src="resources/images/cart-plus.svg" alt="Add to cart">
        </div>
    </div>
    <div class="product">
      <img class="prod_img" src="https://shop.polymer-project.org/es6-unbundled/data/images/10-14160A.jpg">
      <p>Grey Heather Fleece Zip Hoodie $38.85</p>
        <div class="prod_add_cart">
            <img  prod_id="shirt1" src="resources/images/cart-plus.svg" alt="Add to cart">
        </div>
    </div>
    <div class="product">
        <img class="prod_img" src="https://shop.polymer-project.org/es6-unbundled/data/images/10-14133A.jpg">
        <p>YouTube Ultimate Hooded Sweatshirt $32.35</p>
        <div class="prod_add_cart">
            <img  prod_id="shirt1" src="resources/images/cart-plus.svg" alt="Add to cart">
        </div>
    </div>
    <div class="product">
        <img class="prod_img" src="https://shop.polymer-project.org/es6-unbundled/data/images/10-14152A.jpg">
        <p>Rowan Pullover Hood $60.85</p>
        <div class="prod_add_cart">
            <img  prod_id="shirt1" src="resources/images/cart-plus.svg" alt="Add to cart">
        </div>
    </div>
    <div class="product">
        <img class="prod_img" src="https://shop.polymer-project.org/es6-unbundled/data/images/10-14160A.jpg">
        <p>Grey Heather Fleece Zip Hoodie $38.85</p>
        <div class="prod_add_cart">
            <img  prod_id="shirt1" src="resources/images/cart-plus.svg" alt="Add to cart">
        </div>
    </div>
    <div class="product">
        <img class="prod_img" src="https://shop.polymer-project.org/es6-unbundled/data/images/10-14133A.jpg">
        <p>YouTube Ultimate Hooded Sweatshirt $32.35</p>
        <div class="prod_add_cart">
            <img  prod_id="shirt1" src="resources/images/cart-plus.svg" alt="Add to cart">
        </div>
    </div>
    <div class="product">
        <img class="prod_img" src="https://shop.polymer-project.org/es6-unbundled/data/images/10-14152A.jpg">
        <p>Rowan Pullover Hood $60.85</p>
        <div class="prod_add_cart">
            <img  prod_id="shirt1" src="resources/images/cart-plus.svg" alt="Add to cart">
        </div>
    </div>
    <div class="product">
        <img class="prod_img" src="https://shop.polymer-project.org/es6-unbundled/data/images/10-14160A.jpg">
        <p>Grey Heather Fleece Zip Hoodie $38.85</p>
        <div class="prod_add_cart">
            <img  prod_id="shirt1" src="resources/images/cart-plus.svg" alt="Add to cart">
        </div>
    </div>
</div>
<div id="toast">
    <p id="toast_message">This is toast message. Please attention</p>
</div>
<script>
    $(".product>img").click(function(){
        var product = new Array();
        if($.cookie("product")){
            product = JSON.parse($.cookie("product"));
        }
        product.push($(this).attr("prod_id"));
        // $.cookie("product", JSON.stringify(product));

        $.cookie("product", JSON.stringify(product), { expires : 10 , path : '/'});
        // var date = new Date();
        // date.setTime(date.getTime() + (1*24*60*60*1000));
        // var expires = "; expires=" + date.toUTCString();
        // document.cookie = "product" + "=" + (JSON.stringify(product) || "")  + expires + "; path=/";
    });
</script>
</body>
</html>
