
<%--
  Created by IntelliJ IDEA.
  User: liuhe
  Date: 2021-10-10
  Time: 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Welcome</title>
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
<div class="mid">
    <main class = "form-signin">
    <h2 class="h3 mb-3 fw-normal">Welcome, You are:</h2>
    <%
        if ("post".equalsIgnoreCase(request.getMethod()) && request.getParameter("exit")!=null){
            session.removeAttribute("sessionId");
            session.removeAttribute("poll");
            request.changeSessionId();
            //out.println(session.getId());
        }
    %>
    <div class="form-floating">
        <button class="w-100 btn btn-lg btn-primary" onclick="window.location.href='vote.jsp'"> User </button>
        <button class="w-100 btn btn-lg btn-secondary" onclick="window.location.href='login.jsp'"> Manager </button>
    </div>
    </main>
</div>
</body>
</html>
