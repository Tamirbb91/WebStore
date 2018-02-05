<%--
  Created by IntelliJ IDEA.
  User: Tamir
  Date: 2/4/2018
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login or Sign up</title>
    <script src="resources/js/jquery.min.js" type="text/javascript"></script>
    <link href="resources/css/header.css" type="text/css" rel="stylesheet">
    <style>
        #login{
            width: 45%;
            float: left;
            display: inline-block;
        }

        #signup{
            width: 45%;
            float: right;
            display: inline-block;
        }

        .vl {
            z-index: -1;
            border-left: 1px solid black;
            height: 100%;
            position: absolute;
            left: 50%;
            margin-left: -3px;
            top: 0;
        }

        form > *{
            font-size: 11pt;
            display: block;
            width: 80%;
            height: 25px;
            margin-left: 50px;
            margin-top: 10px;
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

        #body {
            width: 90%;
            margin: 75px auto;
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
</head>
<body>
<div id="header">
    <p id="store_name"><a href="/">Sport clothes store</a></p>
</div>
<div id="body">
    <div id="login">
        <h2>Login</h2>
        <form method="post" action="http://localhost:8080/login">
            <input type="text" name="username" placeholder="Username">
            <input type="password" name="password" placeholder="Password">
            <input type="submit" value="Login">
        </form>
        <p><em>Demo user: Tamir <br> Password: Password</em></p>
    </div>
    <div class="vl"></div>
    <div id="signup">
        <h2> Sign up</h2>
        <form method="post" action="http://localhost:8080/signup">
            <input type="text" name="firstname" placeholder="First name">
            <input type="text" name="lastname" placeholder="Last name">
            <input type="text" name="email" placeholder="Email address">
            <input type="text" name="username" placeholder="User name">
            <input type="password" name="password" placeholder="Password">
            <input type="submit" value="Signup">
        </form>
    </div>
</div>
<div id="toast">
    <p id="toast_message">${errormsg}</p>
</div>
<script>
    var toastMessage = "${errormsg}";
    if(toastMessage){
        $("#toast").css("display", "block");
        window.setTimeout(function(){
            $("#toast").css("display", "none");
        }, 3000);
    }
</script>
</body>
</html>

