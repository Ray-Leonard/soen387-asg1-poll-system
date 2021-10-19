package com.example.pollsystemproject;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/Logout")
public class logoutServlet extends HttpServlet{

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("username");
        session.invalidate();
        response.sendRedirect("index.jsp");
    }
}
