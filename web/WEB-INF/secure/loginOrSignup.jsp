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
            border-left: 6px solid green;
            height: 500px;
            position: absolute;
            left: 50%;
            margin-left: -3px;
            top: 0;
        }
    </style>
</head>
<body>
<div id="login">
    <form method="post" action="http://localhost:8080/login">
        <label>Username: <input type="text" name="username"></label>
        <label>Password: <input type="password" name="password"></label>
        <input type="submit" value="Login">
    </form>
</div>
<div class="vl"></div>
<div id="signup">
    <form method="post" action="http://localhost:8080/signup">
        <label>Firstname: <input type="text" name="firstname"></label>
        <label>Lastname: <input type="text" name="lastname"></label>
        <label>Email: <input type="text" name="email"></label>
        <label>Username: <input type="text" name="username"></label>
        <label>Password: <input type="password" name="password"></label>
        <input type="submit" value="Signup">
    </form>
</div>
</body>
</html>

