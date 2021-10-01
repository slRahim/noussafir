package com.projet.servlet;

import com.projet.beans.Message;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SupprimerMessage")
public class SupprimerMessage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        int id_message = Integer.parseInt(request.getParameter("id_message"));
        Message message = new Message();
        message.supprimerMessage(id_message);

        response.sendRedirect("/ModeAdmin");
    }
}
