package com.example.pollsystemproject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/VoteServlet")
public class VoteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String sessionId = session.getId();
        String poll = request.getParameter("poll");

        session.setAttribute("sessionId",sessionId);
        session.setAttribute("poll",poll);
        response.sendRedirect("vote.jsp");

    }
}
