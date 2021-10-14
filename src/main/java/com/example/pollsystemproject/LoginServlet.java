package com.example.pollsystemproject;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String pass = request.getParameter("pass");
        if(pass.equals("1234")){
            HttpSession session = request.getSession();//check the uname to avoid display welcome.jsp
            session.setAttribute("username", "Manager");
            response.sendRedirect("create.jsp");
        }
        else
        {
            response.sendRedirect("login.jsp");
        }
    }


}