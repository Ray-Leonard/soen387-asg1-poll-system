
<%@ page import="java.util.Enumeration" %><%--
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
    <title>Clear</title>
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
<h2>Clear a Poll</h2><br>
<div class="row">
    <div class="col-sm-4">
        <jsp:useBean id="p" class="com.example.pollsystemproject.Poll" scope="application">
        </jsp:useBean>
<%--        <%--%>
<%--            Enumeration<String> keys = p.getChoice().keys();--%>
<%--            String[] str = new String[3];--%>
<%--            int i =0;--%>
<%--            while(keys.hasMoreElements()){--%>
<%--                str[i] = keys.nextElement();--%>
<%--                i++;--%>
<%--            }--%>
<%--        %>--%>

        <form   action="display.jsp" method="post">
            <div align="left">
                <label class="form-label">Title: </label>
                <input type="text" class="form-control" placeholder= <%=p.getTitle()%> name="title" disabled>
            </div><br>
            <div align="left" >
                <label class="form-label">Question: </label>
                <input type="text" class="form-control" placeholder=<%=p.getQuestion()%> name="question" disabled>
            </div><br>
            <div align="left" >
                <label class="form-label">Choice1: </label>
                <input type="text" class="form-control" placeholder=<%=p.getChoice()[0]%> name="choice1" disabled>
            </div><br>
            <div align="left" >
                <label class="form-label">Choice2: </label>
                <input type="text" class="form-control" placeholder=<%=p.getChoice()[1]%> name="choice2" disabled>
            </div><br>
            <div align="left" >
                <label class="form-label">Choice3: </label>
                <input type="text" class="form-control" placeholder=<%=p.getChoice()[2]%> name="choice3" disabled>
            </div><br>
            <input type="submit" id="clear" value="Clear" name="clear" class="btn btn-info">

        </form>
        <div align = "right">
            <p><a href="display.jsp">Click Back</a> </p>
        </div>
    </div>
</div>
<div align = "right">
    <form action="Logout" method="post">
        <input type="submit" value="Logout">
    </form>
</div>

</body>
</html>
