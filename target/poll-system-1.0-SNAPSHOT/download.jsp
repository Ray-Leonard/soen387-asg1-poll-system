<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Hashtable" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileNotFoundException" %><%--
  Created by IntelliJ IDEA.
  User: liuhe
  Date: 2021-10-18
  Time: 01:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Download</title>
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
<div class="col-md-7 col-lg-8">
<h1>Download the poll result? </h1><br>


<jsp:useBean id="p" class="com.example.pollsystemproject.Poll" scope="application">
</jsp:useBean>

<%
    if ("get".equalsIgnoreCase(request.getMethod()) && request.getParameter("download")!=null){
    String filename = p.getTitle();
    session.setAttribute("filename",filename);
    session.setAttribute("p",p);
    out.println("FileName: " + filename);
%>
<br><br>


        <form action="download" method="get">
            <input class="btn btn-warning" type="submit" name="yes" value="Yes">
        </form>
</div>

<%
    }
%>
<div align = "center">
    <p><a href="index.jsp">Click Back</a> </p>
</div>

</body>
</html>
