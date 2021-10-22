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
    <link href="bootstrap/css/signin.css" rel="stylesheet" type="text/css">
    <!-- for including headers -->
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script>
        $(function(){
            $("#header").load("header.html");
        });
    </script>
</head>
<body>
<div id="header"></div>

<main class="form-signin">
<%--    sign in form    --%>
    <form action="Login" method="post">
        <h1 class="h3 mb-3 fw-normal"> Enter password: </h1>
        <div class="form-floating">
            <input type="password" class="form-control" name="pass" placeholder="password" required><br>
        </div>
        <input class="w-100 btn btn-lg btn-primary" type="submit" value="login">
    </form>
<%--back button--%>
    <div style="text-align:right">
        <p><a href="index.jsp">Back</a> </p>
    </div>
</main>
</body>
</html>
