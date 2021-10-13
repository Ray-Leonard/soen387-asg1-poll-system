<%@ page import="com.example.pollsystemproject.Poll" %>
<%@ page import="java.util.Hashtable" %>
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
    <title>update</title>
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
<div class="row">
    <div class="col-sm-4">
        <jsp:useBean id="p" class="com.example.pollsystemproject.Poll" scope="application">
        </jsp:useBean>
        <%
            Enumeration<String> keys = p.getChoice().keys();
            String[] str = new String[3];
            int i =0;
            while(keys.hasMoreElements()){
                str[i] = keys.nextElement();
                i++;
            }
        %>

        <form   action="display.jsp" method="post">
            <div align="left">
                <label class="form-label">Title: </label>
                <input type="text" class="form-control" value=<%=p.getTitle()%> name="title" required>
            </div><br>
            <div align="left" >
                <label class="form-label">Question: </label>
                <input type="text" class="form-control" value=<%=p.getQuestion()%> name="question" required>
            </div><br>
            <div align="left" >
                <label class="form-label">Choice1: </label>
                <input type="text" class="form-control" value=<%=str[0]%> name="choice1" required>
            </div><br>
            <div align="left" >
                <label class="form-label">Choice2: </label>
                <input type="text" class="form-control" value=<%=str[1]%> name="choice2" required>
            </div><br>
            <div align="left" >
                <label class="form-label">Choice3: </label>
                <input type="text" class="form-control" value=<%=str[2]%> name="choice3" required>
            </div><br>
            <input type="submit" id="update" value="Update" name="update" class="btn btn-info">

        </form>
        <div align = "right">
        <p><a href="display.jsp">Click Back</a> </p>
        </div>
    </div>



<%--    <div class="col-sm-14">--%>
<%--        <div class="panel-body">--%>

<%--            <%--%>
<%--                if("post".equalsIgnoreCase(request.getMethod()) && request.getParameter("update")!=null){--%>
<%--                if(p.getPoll_status()== Poll.status.created || p.getPoll_status()== Poll.status.running)--%>
<%--                {--%>
<%--            %>--%>
<%--            <%--%>
<%--                String title=request.getParameter("title");--%>
<%--                String question=request.getParameter("question");--%>
<%--                Hashtable<String,Integer> choices = new Hashtable<>();--%>
<%--                String choice1 = request.getParameter("choice1");--%>
<%--                String choice2 = request.getParameter("choice2");--%>
<%--                String choice3 = request.getParameter("choice3");--%>
<%--                choices.put(choice1,0);--%>
<%--                choices.put(choice2,0);--%>
<%--                choices.put(choice3,0);--%>
<%--                p.update_Poll(title,question,choices);--%>
<%--            %>--%>
<%--            <table id="tbl-student" class="table table-responsive table-bordered" cellpadding = "0" width="100%">--%>
<%--                <thead>--%>
<%--                <tr>--%>
<%--                    <th>Title </th>--%>
<%--                    <th>Question </th>--%>
<%--                    <th>Choice1 </th>--%>
<%--                    <th>Choice2 </th>--%>
<%--                    <th>Choice3 </th>--%>
<%--                    <th>Status </th>--%>

<%--                </tr>--%>
<%--                </thead>--%>
<%--                <tr>--%>
<%--                    <td><%=p.getTitle()%> </td>--%>
<%--                    <td><%=p.getQuestion()%>  </td>--%>
<%--                    <%--%>
<%--                        keys = p.getChoice().keys();--%>
<%--                        str = new String[3];--%>
<%--                        i =0;--%>
<%--                        while(keys.hasMoreElements()){--%>
<%--                            str[i] = keys.nextElement();--%>
<%--                            i++;--%>
<%--                        }--%>
<%--                    %>--%>
<%--                    <td><%=str[0]%></td>--%>
<%--                    <td><%=str[1]%></td>--%>
<%--                    <td><%=str[2]%></td>--%>
<%--                    <td><%=p.getPoll_status()%> </td>--%>


<%--                </tr>--%>

<%--            </table>--%>
<%--            <%--%>
<%--                }else{--%>
<%--                    out.println("Error! Your poll status is not created or running!");--%>

<%--            %>--%>

<%--            <%--%>
<%--                }--%>
<%--                }--%>
<%--            %>--%>
<%--        </div>--%>
<%--    </div>--%>
</div>
<div align = "right">
    <form action="Logout" method="post">
        <input type="submit" value="Logout">
    </form>
</div>

</body>
</html>
