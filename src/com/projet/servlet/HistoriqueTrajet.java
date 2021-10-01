package com.projet.servlet;

import com.projet.beans.Main;
import com.projet.beans.Membre;
import com.projet.beans.Reservation;
import com.projet.beans.Trajet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HistoriqueTrajet")
public class HistoriqueTrajet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         request.setCharacterEncoding("utf-8");

        String id_membre= (String) request.getAttribute("id_membre");

        List<Trajet> trajets=Main.historiqueTrajet(id_membre);

        request.setAttribute("id_membre",id_membre);
        request.setAttribute("liste_trajet",trajets);
        this.getServletContext().getRequestDispatcher("/historique_trajet.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id_membre=request.getParameter("id_membre");

        List<Trajet> trajets=Main.historiqueTrajet(id_membre);

        request.setAttribute("id_membre",id_membre);
        request.setAttribute("liste_trajet",trajets);
        this.getServletContext().getRequestDispatcher("/historique_trajet.jsp").forward(request,response);

    }
}
