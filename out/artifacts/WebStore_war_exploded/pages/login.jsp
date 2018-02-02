<%--
  Created by IntelliJ IDEA.
  User: 986214
  Date: 2/1/2018
  Time: 1:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login page</title>
</head>
<body>
<form method="post" action="login">
    <label>Username : <input type="text" name="username" value="${cookie['username'].value}"></label>
    <label>Password : <input type="password" name="password"></label>
    <label><input type="checkbox" name="remember_me" ${cookie['username'].value != "" ? "checked" : ""}>remember me</label>
    <input type="submit">
</form>
<p><em>* Username:Tamir <br/>*Password:Password </em></p>
<script>
    window.onload = function(){
        var error = "${errormsg}";
        if(error) {
            window.confirm(error);
        }
    }
</script>
</body>
</html>
