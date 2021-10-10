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
    <title>update</title>
    <link href = "bootstrap/css/bootstrap.css" rel = "stylesheet" type="text/css">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<h1>Welcome to Poll Management system</h1>
<div class="row">
    <div class="col-sm-4">
        <jsp:useBean id="p" class="com.example.pollsystemproject.Poll" scope="application">
        </jsp:useBean>
        <form   action="#" method="post">
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
                <input type="text" class="form-control"  name="choice1" required>
            </div><br>
            <div align="left" >
                <label class="form-label">Choice2: </label>
                <input type="text" class="form-control"  name="choice2" required>
            </div><br>
            <div align="left" >
                <label class="form-label">Choice3: </label>
                <input type="text" class="form-control"  name="choice3" required>
            </div><br>
            <input type="submit" id="sumbit" value="Create" name="submit" class="btn btn-info">
            <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">

        </form>
    </div>

    <%
        if("post".equalsIgnoreCase(request.getMethod()) && request.getParameter("submit")!=null){
        if(p.getPoll_status()==null){
    %>
    <%

        String title=request.getParameter("title");
        String question=request.getParameter("question");
        String[] choices;
        String choice1 = request.getParameter("choice1");
        String choice2 = request.getParameter("choice2");
        String choice3 = request.getParameter("choice3");
        choices = new String[]{choice1, choice2, choice3};
        p.create_Poll(title,question,choices);
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
                    <th>Update</th>
                    <th>Delete</th>

                </tr>
                </thead>
                <tr>
                    <td><%=p.getTitle()%> </td>
                    <td><%=p.getQuestion()%>  </td>
                    <td><%=p.getChoice()[0]%>  </td>
                    <td><%=p.getChoice()[1]%>  </td>
                    <td><%=p.getChoice()[2]%>  </td>
                    <td><%=p.getPoll_status()%> </td>
                    <td><a href="update.jsp">Update</a></td>
                    <td><a href="update.jsp">Delete</a></td>

                </tr>

            </table>
            <%
            }else {
                out.print("Error! You already create one poll!");
            %>
            <div class="col-sm-14">
                <div class="panel-body">
            <table id="tbl-student" class="table table-responsive table-bordered" cellpadding = "0" width="100%">
                <thead>
                <tr>
                    <th>Title </th>
                    <th>Question </th>
                    <th>Choice1 </th>
                    <th>Choice2 </th>
                    <th>Choice3 </th>
                    <th>Status </th>
                    <th>Update</th>
                    <th>Delete</th>

                </tr>
                </thead>
                <tr>
                    <td><%=p.getTitle()%> </td>
                    <td><%=p.getQuestion()%>  </td>
                    <td><%=p.getChoice()[0]%>  </td>
                    <td><%=p.getChoice()[1]%>  </td>
                    <td><%=p.getChoice()[2]%>  </td>
                    <td><%=p.getPoll_status()%> </td>
                    <td><a href="update.jsp">Update</a></td>
                    <td><a href="update.jsp">Delete</a></td>

                </tr>

            </table>

            <%
                    }
                }

            %>
        </div>
    </div>

</div>


</body>
</html>
