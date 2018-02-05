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
    <script src="resources/js/jquery.min.js" type="text/javascript"></script>
    <script src="resources/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="resources/js/common.js" type="text/javascript"></script>
    <script src="resources/js/checkout_confirmation.js" type="text/javascript"></script>
    <link href="resources/css/header.css" type="text/css" rel="stylesheet">
    <title>Check out confirmation page</title>
    <style>
        .product > img {
            height: 100%;
            float: left;
        }

        #cart_list {
            width: 90%;
            margin: 100px auto 0px;
            /*margin-top: 100px;*/
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

        .product:hover {
            box-shadow: 2px 2px 4px 4px rgba(50, 50, 50, 0.5);
        }

        .prod_remove_cart {
            width: 150px;
            float: right;
            display: inline-block;
            height: 100%;
            color: #000;
            cursor: pointer;
            background-color: #29434e;
            text-align: center;
        }

        .prod_remove_cart svg {
            margin-top: 60px;
        }

        .prod_remove_cart:hover {
            background-color: #819ca9;
        }

        .product_name {
            font-size: 14pt;
            display: inline-block;
            height: 150px;
            float: left;
            margin-left: 20px;
            line-height: 150px;
            text-align: center;
        }

        .product_price {
            font-size: 14pt;
            display: inline-block;
            height: 150px;
            float: right;
            margin-right: 60px;
            line-height: 150px;
            text-align: center;
        }

        .product {
            height: 150px;
            width: 80%;
            margin: 30px auto;
            text-align: center;
            box-shadow: 0px 0px 2px 2px rgba(50, 50, 50, 0.5);
        }

        #purchase {
            border-radius: 30px;
            width: 70px;
            height: 100px;
            background-color: #37474f;
            position: fixed;
            bottom: 100px;
            right: 50px;
            text-align: center;
        }

        #total_price {
            height: 10px;
            color: white;
        }
    </style>
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
    <div id="cart_list">
    <c:forEach items="${purchaseItems}" var="item">
        <div class="product" data-id="${item.price}">
            <img src="${item.image}">
            <div class="product_name">${item.name}</div>
            <div class="prod_remove_cart" prod_id="${item.productId}">
                <svg fill="white" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z"/>
                    <path d="M0 0h24v24H0z" fill="none"/>
                </svg>
            </div>
            <div class="product_price">$${item.price}</div>
        </div>
    </c:forEach>
    </div>
    <div id="purchase">
        <p id="total_price">$ ${totalSum}</p>
        <a href="http://localhost:8080/final_purchase">
            <svg fill="#8BC34A" height="48" viewBox="0 0 24 24" width="48" xmlns="http://www.w3.org/2000/svg">
                <path d="M0 0h24v24H0z" fill="none"/>
                <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z"/>
            </svg>
        </a>
    </div>

    <div id="toast">
        <p id="toast_message">${errormsg}</p>
    </div>
</body>
</html>
