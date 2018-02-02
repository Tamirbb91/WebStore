<%--
  Created by IntelliJ IDEA.
  User: Tamir
  Date: 1/31/2018
  Time: 9:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment details page</title>
</head>
<body>
    <form method="post" action="http://localhost:8080/final_purchase">
        <label>Billing Address<input type="text"></label>
        <label>Shipping Address<input type="text"></label>
        <label>Card Number<input type="text"></label>
        <label>Card Name<input type="text"></label>
        <label>Card Date<input type="text"></label>
        <input type="submit" value="Purchase">
    </form>
</body>
</html>
