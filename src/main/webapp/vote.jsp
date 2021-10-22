<%@ page import="java.util.Enumeration" %>
<%@ page import="com.example.pollsystemproject.Poll" %>
<%--
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
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
<h1>Welcome to vote </h1><br>


<jsp:useBean id="p" class="com.example.pollsystemproject.Poll" scope="application">
</jsp:useBean>
<%

        if(p.getPoll_status() == Poll.status.running)
        {

%>
    <div class="col-md-7 col-lg-8">
        <form action="VoteServlet" method="post">
            <h2>Title: <%=p.getTitle()%></h2>
            <br>
            <h3>Question: <%=p.getQuestion()%></h3>

            <label for="poll">
                Please select your choice:
            </label>
            <select class="custom-select" name="poll" id="poll">
                <option value=<%=p.getChoice()[0]%> ><%=p.getChoice()[0]%></option>
                <option value=<%=p.getChoice()[1]%> ><%=p.getChoice()[1]%></option>
                <option value=<%=p.getChoice()[2]%> ><%=p.getChoice()[2]%></option>
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


<%
    if(session.getAttribute("sessionId") != null && session.getAttribute("poll") != null) {
        String sessionId = (String) session.getAttribute("sessionId");
        String poll = (String) session.getAttribute("poll");
        p.vote(sessionId,poll);
        out.println("<h3>Successful vote!</h3>");
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
                Enumeration<String> keys = p.get_Poll_Result().keys();
                String[] choices = new String[3];
                int i =0;
                while(keys.hasMoreElements()){
                    choices[i] = keys.nextElement();
                    i++;
                }

%>
<script type="text/javascript">
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
        var data = google.visualization.arrayToDataTable([
            ['Choices', 'Results'],
            ['<%=choices[0]%>',   <%=p.get_Poll_Result().get(choices[0])%>],
            ['<%=choices[1]%>',   <%=p.get_Poll_Result().get(choices[1])%>],
            ['<%=choices[2]%>',   <%=p.get_Poll_Result().get(choices[2])%>]
        ]);

        var options = {
            title: 'The Poll Result',
            pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
    }
</script>
<div id="donutchart" style="width: 900px; height: 500px;"></div>


<div class="col-sm-4">
    <div align = "center">
    <form action="download.jsp" method="get">
        <input class="btn" type="submit" name="download" value="Download">
    </form>
    </div>
</div>

<%
    }
%>
<div class="col-sm-4">
    <div align = "center">
        <p><a href="index.jsp">Click Back</a></p>
    </div>
</div>

<%
        }
%>

</body>
</html>
