<%@ page import="java.util.Hashtable" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.example.pollsystemproject.Poll" %><%--
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
    <title>create</title>
    <link href = "bootstrap/css/bootstrap.css" rel = "stylesheet" type="text/css">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
    response.setHeader("Cache-Control","no-cache");//avoid back page after logout
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);

    if(session.getAttribute("username")==null){
        response.sendRedirect("index.jsp");
    }
%>
<h1>Welcome... ${username} to Poll Management system</h1><br>
<h2>Create a Poll</h2><br>
<div class="row">
    <div class="col-sm-4">
        <jsp:useBean id="p" class="com.example.pollsystemproject.Poll" scope="application">
        </jsp:useBean>
        <%
            if(p.getPoll_status()!=null){
                RequestDispatcher rd = request.getRequestDispatcher("display.jsp");
                rd.forward(request,response);
            }
        %>


        <form   action="display.jsp" method="post">
            <div align="left">
                <label class="form-label">Title: </label>
                <input type="text" class="form-control"  name="title" required>
            </div><br>
            <div align="left" >
                <label class="form-label">Question: </label>
                <input type="text" class="form-control"  name="question" required>
            </div><br>
            <div align="left" >
                <label class="form-label">Choice1: </label>
                <input type="text" class="form-control"   name="choice1" required>
            </div><br>
            <div align="left" >
                <label class="form-label">Choice2: </label>
                <input type="text" class="form-control"  name="choice2" required>
            </div><br>
            <div align="left" >
                <label class="form-label">Choice3: </label>
                <input type="text" class="form-control"  name="choice3" required>
            </div><br>
            <input type="submit" id="sumbit" value="Create" name="create" class="btn btn-info">
            <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">

        </form>
    </div>



</div>
<div align = "right">
<form action="Logout" method="post">
    <input type="submit" value="Logout">
</form>
</div>
</body>
</html>
