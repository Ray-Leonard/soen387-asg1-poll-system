<%--
  Created by IntelliJ IDEA.
  User: liuhe
  Date: 2021-10-12
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8">
    <title>Login page</title>
    <link href = "bootstrap/css/bootstrap.css" rel = "stylesheet" type="text/css">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="row">
    <div class="col-sm-4">
<form action="Login" method="post">
    Enter password:<input type="password" name="pass"><br>
    <input class="btn btn-warning" type="submit" value="login">
</form>
    </div>
</div>
<div class="col-sm-4">
    <div align = "right">
        <p><a href="index.jsp">Click Back</a> </p>
    </div>
</div>
</body>
</html>
