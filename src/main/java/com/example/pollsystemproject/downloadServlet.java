package com.example.pollsystemproject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.security.Principal;

@WebServlet("/download")
public class downloadServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String filename = (String) session.getAttribute("filename");
        Poll p = (Poll)session.getAttribute("p");
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        String newfilename = p.download_Poll_Details(pw,filename);
        response.setContentType("APPLICATION/OCTET-STREAM");
        response.setHeader("Content-disposition", "attachment;filename="+newfilename);
        pw.close();


    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
