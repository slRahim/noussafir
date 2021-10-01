package com.projet.servlet;

import com.projet.beans.Compte;
import com.projet.beans.Membre;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "consulterProfile")
public class consulterProfile extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id=request.getParameter("id_membre");

        Membre profile=new Membre();
        Compte compte=new Compte();

        profile=profile.consulterProfile(id);
        compte=compte.consulterCompte(id);

        request.setAttribute("id_membre",id);
        request.setAttribute("profile",profile);
        request.setAttribute("compte",compte);

        this.getServletContext().getRequestDispatcher("/profile.jsp").forward(request,response);

    }
}
