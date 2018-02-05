<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Main page</title>
    <style>
        @font-face {
            font-family: "cabin";
            src: url('resources/fonts/Cabin-Regular.ttf') format('truetype');
        }

        @font-face {
            font-family: "quicksand";
            src: url('resources/fonts/Quicksand-Regular.ttf') format('truetype');
        }

        @font-face {
            font-family: "raleway";
            src: url("<c:url value='resources/fonts/Raleway-Regular.ttf'/>");
        }

        .product {
            float: left;
            text-align: center;
            margin: 10px;
            width: 400px;
            height: 400px;
            display: inline-block;
            box-shadow: 0px 0px 2px 2px rgba(50, 50, 50, 0.5);
        }

        .product:hover {
            box-shadow: 2px 2px 4px 4px rgba(50, 50, 50, 0.5);
        }

        .prod_img {
            height: 75%;
        }

        .prod_add_cart {
            height: 50px;
            color: #000;
            cursor: pointer;
            background-color: #29434e;
            text-align: center;
        }

        .prod_add_cart svg {
            margin-top: 12px;
        }

        .prod_add_cart:hover {
            background-color: #819ca9;
        }

        #products {
            width: 95%;
            margin: 100px auto;
            text-align: center;
        }

        #toast {
            position: fixed;
            right: 20px;
            bottom: 20px;
            text-align: center;
            background-color: rgba(0, 0, 0, 0.75);
            color: azure;
            width: 400px;
            height: 50px;
            padding: 5px;
            font-weight: bold;
            display: none;
        }

        #cart_count{
            display: none;
            text-align: center;
            position: fixed;
            top: 18px;
            right: 23px;
            background-color: white;
            color: black;
            border-radius: 15px;
            width: 15px;
            height: 15px;
            font-size: 10pt;
        }
        a:link{
            text-decoration: none;
            color: white;
        }

        a:visited{
            text-decoration: none;
            color: white;
        }
    </style>
    <script src="resources/js/jquery.min.js" type="text/javascript"></script>
    <script src="resources/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="resources/js/index.js" type="text/javascript"></script>
    <script src="resources/js/common.js" type="text/javascript"></script>
    <link href="resources/css/header.css" type="text/css" rel="stylesheet">
</head>
<body>
<div id="header">
    <p id="store_name"><a href="/home">Sport clothes store</a></p>
    <div id="login_part">
        <a href="http://localhost:8080/checkout">
            <svg fill="#000000" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
                <path fill="white"
                      d="M7 18c-1.1 0-1.99.9-1.99 2S5.9 22 7 22s2-.9 2-2-.9-2-2-2zM1 2v2h2l3.6 7.59-1.35 2.45c-.16.28-.25.61-.25.96 0 1.1.9 2 2 2h12v-2H7.42c-.14 0-.25-.11-.25-.25l.03-.12.9-1.63h7.45c.75 0 1.41-.41 1.75-1.03l3.58-6.49c.08-.14.12-.31.12-.48 0-.55-.45-1-1-1H5.21l-.94-2H1zm16 16c-1.1 0-1.99.9-1.99 2s.89 2 1.99 2 2-.9 2-2-.9-2-2-2z"/>
                <path d="M0 0h24v24H0z" fill="none"/>
            </svg>
            <div id="cart_count"></div>
        </a>
    </div>
    <c:if test="${user != null}" var="loggedin">
        <div id="logout_part">
            <span>${user.username}</span>
            <a href="http://localhost:8080/logout">
                <svg fill="white" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M0 0h24v24H0z" fill="none"/>
                    <path d="M10.09 15.59L11.5 17l5-5-5-5-1.41 1.41L12.67 11H3v2h9.67l-2.58 2.59zM19 3H5c-1.11 0-2 .9-2 2v4h2V5h14v14H5v-4H3v4c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2z"/>
                </svg>
            </a>
        </div>
    </c:if>

    <c:if test="${!loggedin}">
        <div id="logout_part">
            <a href="http://localhost:8080/loginOrSignup.jsp">
                <svg fill="white" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
                    <path d="M0 0h24v24H0z" fill="none"/>
                </svg>
            </a>
        </div>
    </c:if>

</div>
<div id="products">
    <c:forEach items="${allproducts}" var="item">
        <div class="product">
            <img class="prod_img" src="${item.value.image}">
            <p>${item.value.name} $${item.value.price}</p>
            <div class="prod_add_cart" prod_id="${item.value.productId}">
                <svg fill="#000000" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M0 0h24v24H0zm18.31 6l-2.76 5z" fill="none"/>
                    <path fill="white"
                          d="M11 9h2V6h3V4h-3V1h-2v3H8v2h3v3zm-4 9c-1.1 0-1.99.9-1.99 2S5.9 22 7 22s2-.9 2-2-.9-2-2-2zm10 0c-1.1 0-1.99.9-1.99 2s.89 2 1.99 2 2-.9 2-2-.9-2-2-2zm-9.83-3.25l.03-.12.9-1.63h7.45c.75 0 1.41-.41 1.75-1.03l3.86-7.01L19.42 4h-.01l-1.1 2-2.76 5H8.53l-.13-.27L6.16 6l-.95-2-.94-2H1v2h2l3.6 7.59-1.35 2.45c-.16.28-.25.61-.25.96 0 1.1.9 2 2 2h12v-2H7.42c-.13 0-.25-.11-.25-.25z"/>
                </svg>
            </div>
        </div>
    </c:forEach>
</div>
<div id="toast">
    <p id="toast_message">${errormsg}</p>
</div>
</body>
</html>