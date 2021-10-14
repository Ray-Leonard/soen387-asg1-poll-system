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
        <form action="VoteServlet" method="post">
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
            <label for="poll">
                Please select your choice:
            </label>
            <select class="custom-select" name="poll" id="poll">
                <option value=<%=str[0]%> ><%=str[0]%></option>
                <option value=<%=str[1]%> ><%=str[1]%></option>
                <option value=<%=str[2]%> ><%=str[2]%></option>
            </select>
            <br><br>
            <input type="submit" name="vote" value="Vote">
        </form>

        <div align = "right">
            <p><a href="index.jsp">Click Back</a> </p>
        </div>
        <div align="center">
            <form action="index.jsp" method="post">
                <input class="btn-warning" type="submit" name="exit" value="Exit">
            </form>
        </div>

    </div>
</div>


<%
    if(session.getAttribute("sessionId") != null && session.getAttribute("poll") != null) {
        String sessionId = (String) session.getAttribute("sessionId");
        String poll = (String) session.getAttribute("poll");
        p.vote(sessionId,poll);
        out.println("<h3>Successful vote</h3>");

    }
%>
<%
        }else {
            if(p.getPoll_status() != Poll.status.released){
            out.println("<h2>No poll is running!</h2>");
            }
            else
            {
                out.println("<h3>The Poll is released, Please check its result:</h3>");

%>
<%
    Enumeration<String> keys = p.getChoice().keys();
    String[] str = new String[3];
    int i =0;
    while(keys.hasMoreElements()){
        str[i] = keys.nextElement();
        i++;
    }
%>
<div class="row">
    <div class="col-sm-4">
        <table class="table table-responsive" cellpadding = "0" width="100%">
            <tr>
                <th>Title</th>
                <th><%=p.getTitle()%></th>
            </tr>
            <tr>
                <td>Question</td>
                <td><%=p.getQuestion()%></td>
            </tr>
            <tr>
                <td>A. <%=str[0]%></td>
                <td><%=p.getChoice().get(str[0])%></td>
            </tr>
            <tr>
                <td>B. <%=str[1]%></td>
                <td><%=p.getChoice().get(str[1])%></td>
            </tr>
            <tr>
                <td>C. <%=str[2]%></td>
                <td><%=p.getChoice().get(str[2])%></td>
            </tr>
        </table>

    </div>
</div>

<%
    }
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
