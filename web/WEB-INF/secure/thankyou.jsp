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
    <title>Payment details page</title>
    <script src="resources/js/jquery.min.js" type="text/javascript"></script>
    <link href="resources/css/header.css" type="text/css" rel="stylesheet">
    <style>
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
    <p id="store_name"><a href="/home">Sport clothes store</a></p>
</div>
<div id="body">
    <h1>Your shipping will be in your hand very soon. Thank you</h1>
</div>
<script>
    $(function(){
        window.setTimeout(function(){
            window.location.replace("localhost:8080/home");
        }, 3000);
    });
</script>
</body>
</html>
