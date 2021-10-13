<%@ page import="java.util.Hashtable" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.example.pollsystemproject.Poll" %><%--
  Created by IntelliJ IDEA.
  User: liuhe
  Date: 2021-10-13
  Time: 17:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8">
    <title>Vote</title>
    <link href = "bootstrap/css/bootstrap.css" rel = "stylesheet" type="text/css">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<h1>Welcome to vote </h1><br>


<jsp:useBean id="p" class="com.example.pollsystemproject.Poll" scope="application">
</jsp:useBean>
<%

        if(p.getPoll_status() == Poll.status.running)
        {

%>
<div class="row">
    <div class="col-sm-4">
        <form action="" method="post">
            <h2>Title: <%=p.getTitle()%></h2>
            <br>
            <h3>Question: <%=p.getQuestion()%></h3>
            <%
                Enumeration<String> keys = p.getChoice().keys();
                String[] str = new String[3];
                int i =0;
                while(keys.hasMoreElements()){
                    str[i] = keys.nextElement();
                    i++;
                }
            %>
            <p>
                Please select your choice:
            </p>
            <input type="radio" id="choice1" name="choice1" value="choice1">
            <label for="choice1"><%=str[0]%></label><br>
            <input type="radio" id="choice2" name="choice2" value="choice2">
            <label for="choice2"><%=str[1]%></label><br>
            <input type="radio" id="choice3" name="choice3" value="choice3">
            <label for="choice3"><%=str[2]%></label><br>
        </form>

        <div align = "right">
            <p><a href="index.jsp">Click Back</a> </p>
        </div>
    </div>
</div>
<%

        }else {
            out.println("<h2>No poll is running!</h3>");
%>
<div class="col-sm-4">
<div align = "right">
    <p><a href="index.jsp">Click Back</a> </p>
</div>
</div>
<%
        }
%>

</body>
</html>
