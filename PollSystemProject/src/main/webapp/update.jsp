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
    <title>update</title>
    <link href = "bootstrap/css/bootstrap.css" rel = "stylesheet" type="text/css">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="row">
    <div class="col-sm-4">
        <jsp:useBean id="p" class="com.example.pollsystemproject.Poll" scope="application">
        </jsp:useBean>
        <form   action="#" method="post">
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
                <input type="text" class="form-control" value=<%=p.getChoice()[0]%> name="choice1" required>
            </div><br>
            <div align="left" >
                <label class="form-label">Choice2: </label>
                <input type="text" class="form-control" value=<%=p.getChoice()[1]%> name="choice2" required>
            </div><br>
            <div align="left" >
                <label class="form-label">Choice3: </label>
                <input type="text" class="form-control" value=<%=p.getChoice()[2]%> name="choice3" required>
            </div><br>
            <input type="submit" id="update" value="Update" name="update" class="btn btn-info">

        </form>
        <div align = "right">
        <p><a href="index.jsp">Click Back</a> </p>
        </div>
    </div>



    <div class="col-sm-14">
        <div class="panel-body">
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
<%--                    <td><%=p.getChoice()[0]%>  </td>--%>
<%--                    <td><%=p.getChoice()[1]%>  </td>--%>
<%--                    <td><%=p.getChoice()[2]%>  </td>--%>
<%--                    <td><%=p.getPoll_status()%> </td>--%>


<%--                </tr>--%>

<%--            </table>--%>
            <%
                if("post".equalsIgnoreCase(request.getMethod()) && request.getParameter("update")!=null){
                if(p.getPoll_status()== Poll.status.created || p.getPoll_status()== Poll.status.running)
                {
            %>
            <%
                String title=request.getParameter("title");
                String question=request.getParameter("question");
                String[] choices;
                String choice1 = request.getParameter("choice1");
                String choice2 = request.getParameter("choice2");
                String choice3 = request.getParameter("choice3");
                choices = new String[]{choice1, choice2, choice3};
                p.update_Poll(title,question,choices);
            %>
            <table id="tbl-student" class="table table-responsive table-bordered" cellpadding = "0" width="100%">
                <thead>
                <tr>
                    <th>Title </th>
                    <th>Question </th>
                    <th>Choice1 </th>
                    <th>Choice2 </th>
                    <th>Choice3 </th>
                    <th>Status </th>

                </tr>
                </thead>
                <tr>
                    <td><%=p.getTitle()%> </td>
                    <td><%=p.getQuestion()%>  </td>
                    <td><%=p.getChoice()[0]%>  </td>
                    <td><%=p.getChoice()[1]%>  </td>
                    <td><%=p.getChoice()[2]%>  </td>
                    <td><%=p.getPoll_status()%> </td>


                </tr>

            </table>
            <%
                }else{
                    out.println("Error! Your poll status is not created or running!");

            %>

            <%
                }
                }
            %>
        </div>
    </div>
</div>

</body>
</html>
