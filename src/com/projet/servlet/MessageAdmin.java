package com.projet.servlet;

import com.projet.beans.Message;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "MessageAdmin")
public class MessageAdmin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           request.setCharacterEncoding("utf-8");
           String email=request.getParameter("id_email");
           String contenu=request.getParameter("commentaire");
           Message message=new Message();
           message.setEmmeteur(email);
           message.setContenu(contenu);
           message.setDate_message(new Date());
           message.ajouterMsg();
           this.getServletContext().getRequestDispatcher("/Acceuil.jsp").forward(request,response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
