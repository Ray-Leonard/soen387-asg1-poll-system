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
<%@ page errorPage="error.jsp" %>
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

                String title=request.getParameter("title");
                String question=request.getParameter("question");
                String[] choices = new String[3];
                String choice1 = request.getParameter("choice1");
                String choice2 = request.getParameter("choice2");
                String choice3 = request.getParameter("choice3");
                choices[0] = choice1;
                choices[1] = choice2;
                choices[2] = choice3;
                p.create_Poll(title,question,choices);

        }

    %>

    <%
        if("post".equalsIgnoreCase(request.getMethod()) && request.getParameter("update")!=null){

        String title=request.getParameter("title");
        String question=request.getParameter("question");
        String[] choices = new String[3];
        String choice1 = request.getParameter("choice1");
        String choice2 = request.getParameter("choice2");
        String choice3 = request.getParameter("choice3");
        choices[0] = choice1;
        choices[1] = choice2;
        choices[2] = choice3;
        p.update_Poll(title,question,choices);

        }
    %>
    <%
        if("post".equalsIgnoreCase(request.getMethod()) && request.getParameter("run")!=null){

        p.run_Poll();
        }
    %>
    <%
        if("post".equalsIgnoreCase(request.getMethod()) && request.getParameter("release")!=null){

                p.release_Poll();
        }
    %>
    <%
        if("post".equalsIgnoreCase(request.getMethod()) && request.getParameter("unrelease")!=null){
                p.unrelease_Poll();
        }
    %>

    <%
        if("post".equalsIgnoreCase(request.getMethod()) && request.getParameter("clear")!=null){

                p.clear_Poll();
        }
%>


    <%
        if("post".equalsIgnoreCase(request.getMethod()) && request.getParameter("close")!=null){
                 p.close_Poll();
                 RequestDispatcher rd = request.getRequestDispatcher("create.jsp");
                 rd.forward(request,response);
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

                    <td><%=p.getChoice()[0]%></td>
                    <td><%=p.getChoice()[1]%></td>
                    <td><%=p.getChoice()[2]%></td>
                    <td><%=p.getPoll_status()%> </td>
                    <td><button class="btn-outline-warning"><a href="update.jsp">Update</a></button></td>
                    <td><button class="btn-outline-warning"><a href="run.jsp">Run</a></button></td>
                    <td><button class="btn-outline-warning"><a href="clear.jsp">Clear</a></button></td>
                    <td><button class="btn-outline-warning"><a href="release.jsp">Release</a></button></td>
                    <td><button class="btn-outline-warning"><a href="unrelease.jsp">UnRelease</a></button></td>
                    <td><button class="btn-outline-warning"><a href="close.jsp">Close</a></button></td>

                </tr>
                <%
                    if(p.getPoll_status() == Poll.status.released){
                        Enumeration<String> keys = p.get_Poll_Result().keys();
                            int[] result = new int[3];
                            int i =0;
                            while(keys.hasMoreElements()){
                                result[i] = p.get_Poll_Result().get(keys.nextElement());
                                i++;
                            }

                %>
                <tr>
                    <td colspan="2">Poll result</td>
                    <td><%=result[0]%></td>
                    <td><%=result[1]%></td>
                    <td><%=result[2]%></td>
                    <td colspan="7"> </td>
                </tr>
                <%
                    }
                %>

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
