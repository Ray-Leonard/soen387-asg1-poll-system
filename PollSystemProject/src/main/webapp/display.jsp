<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Hashtable" %>
<%@ page import="com.example.pollsystemproject.Poll" %>
<%--
  Created by IntelliJ IDEA.
  User: liuhe
  Date: 2021-10-12
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8">
    <title>Display</title>
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
<h2>Display the current Poll</h2>


    <jsp:useBean id="p" class="com.example.pollsystemproject.Poll" scope="application">
    </jsp:useBean>
    <%
        if("post".equalsIgnoreCase(request.getMethod()) && request.getParameter("create")!=null){
            if(p.getPoll_status()==null)
            {
                String title=request.getParameter("title");
                String question=request.getParameter("question");
                Hashtable<String,Integer> choices = new Hashtable<>();
                String choice1 = request.getParameter("choice1");
                String choice2 = request.getParameter("choice2");
                String choice3 = request.getParameter("choice3");
                choices.put(choice1,0);
                choices.put(choice2,0);
                choices.put(choice3,0);
                p.create_Poll(title,question,choices);
    %>

    <%
    }else {
        out.println("<h2>Error! You already created one poll!</h3>");
            }
        }

    %>



    <%
        if("post".equalsIgnoreCase(request.getMethod()) && request.getParameter("update")!=null){
            if(p.getPoll_status()== Poll.status.created || p.getPoll_status()== Poll.status.running)
            {
    %>
    <%
        String title=request.getParameter("title");
        String question=request.getParameter("question");
        Hashtable<String,Integer> choices = new Hashtable<>();
        String choice1 = request.getParameter("choice1");
        String choice2 = request.getParameter("choice2");
        String choice3 = request.getParameter("choice3");
        choices.put(choice1,0);
        choices.put(choice2,0);
        choices.put(choice3,0);
        p.update_Poll(title,question,choices);
    %>


    <%}else{out.println("Error! Your poll status is not created or running!");

                }
            }
    %>
    <%
        if("post".equalsIgnoreCase(request.getMethod()) && request.getParameter("run")!=null){
            if(p.getPoll_status()== Poll.status.created)
            {
    %>
    <%
        p.run_Poll();
    %>
    <%
            }else{out.println("Error! Your poll status is not created!");
            }
        }
    %>
    <div class="row">
        <div class="col-sm-10">
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
                    <th>Run</th>
                    <th>Clear</th>
                    <th>Release</th>
                    <th>UnRelease</th>
                    <th>Close</th>


                </tr>
                </thead>
                <tr>
                    <td><%=p.getTitle()%> </td>
                    <td><%=p.getQuestion()%>  </td>
                    <%
                        Enumeration<String> keys = p.getChoice().keys();
                        String[] str = new String[3];
                        int i =0;
                        while(keys.hasMoreElements()){
                            str[i] = keys.nextElement();
                            i++;
                        }
                    %>
                    <td><%=str[0]%></td>
                    <td><%=str[1]%></td>
                    <td><%=str[2]%></td>
                    <td><%=p.getPoll_status()%> </td>
                    <td><a href="update.jsp">Update</a></td>
                    <td><a href="run.jsp">Run</a></td>

                    <td><a href="ClearPoll">Clear</a></td>
                    <td><a href="ReleasePoll">Release</a></td>
                    <td><a href="UnReleasePoll">UnRelease</a></td>
                    <td><a href="ClosePoll">Close</a></td>

                </tr>

            </table>

        </div>
    </div>
<div align = "right">
    <form action="Logout" method="post">
        <input type="submit" value="Logout">
    </form>
</div>

</body>
</html>
