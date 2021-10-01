package com.projet.servlet;

import com.projet.beans.Main;
import com.projet.beans.Membre;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EvaluationConducteur")
public class EvaluationConducteur extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String id_exa=request.getParameter("examinateur");

        Membre membre=new Membre();
        membre.setNom_utilisateur(request.getParameter("conducteur"));
        membre.setNote(Float.parseFloat(request.getParameter("note")));

        membre.evaluerMembre(id_exa);

        request.setAttribute("id_membre",id_exa);
        this.getServletContext().getRequestDispatcher("/HistoriqueReservation").include(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String id_membre=request.getParameter("id_membre");
        String id_conducteur=request.getParameter("id_conducteur");

        request.setAttribute("id_membre",id_membre);
        request.setAttribute("conducteur", Main.conducteurTrajet(id_conducteur));
        this.getServletContext().getRequestDispatcher("/evaluer_conducteur.jsp").forward(request,response);
    }
}
