package com.projet.servlet;

import com.projet.beans.Message;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "repondreMessage")
public class repondreMessage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        Message  message=new Message();
        message.setEmmeteur(request.getParameter("emmeteur"));
        message.setContenu(request.getParameter("contenu"));
        message.repondre();

        request.setAttribute("message",message);
        this.getServletContext().getRequestDispatcher("/repondre.jsp").forward(request,response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        Message message=new Message();
        message.setId_message(Integer.parseInt(request.getParameter("id_message")));

        request.setAttribute("message",message.consulterMessage());
        this.getServletContext().getRequestDispatcher("/repondre.jsp").forward(request,response);

    }
}
