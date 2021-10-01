package com.projet.servlet;

import com.projet.beans.Main;
import com.projet.beans.Membre;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EvaluationVoyageur")
public class EvaluationVoyageur extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String id_exa=request.getParameter("examinateur");

        Membre membre=new Membre();
        membre.setNom_utilisateur(request.getParameter("voyageur"));
        membre.setNote(Float.parseFloat(request.getParameter("note")));

        membre.evaluerMembre(id_exa);

        request.setAttribute("id_membre",id_exa);
        this.getServletContext().getRequestDispatcher("/HistoriqueTrajet").include(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String id_membre=request.getParameter("id_membre");
        String id_trajet=request.getParameter("id_trajet");


        List<Membre> membres= (List<Membre>) Main.voyageurTrajet(Integer.parseInt(id_trajet))[0];

        request.setAttribute("id_membre",id_membre);
        request.setAttribute("liste_voyageur", membres);
        this.getServletContext().getRequestDispatcher("/evaluer_voyageur.jsp").forward(request,response);

    }
}
