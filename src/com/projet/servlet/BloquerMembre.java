package com.projet.servlet;

import com.projet.beans.Membre;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "BloquerMembre")
public class BloquerMembre extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String id_membre = request.getParameter("id_membre");
        Membre membre = new Membre();
        membre.bloquerMembre(id_membre);

        response.sendRedirect("/ModeAdmin");
    }
}
