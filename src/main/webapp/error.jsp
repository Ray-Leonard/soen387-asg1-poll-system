<%--
  Created by IntelliJ IDEA.
  User: liuhe
  Date: 2021-10-09
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
<head>
    <title>Error page</title>
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
<h1 style="color: red">Opps...</h1>
<p style="color: red">Sorry an error occurred!</p>
<%=exception.getMessage() %>
<div align = "center">
    <p><a href="display.jsp">Click Back</a> </p>
</div>

</body>
</html>
