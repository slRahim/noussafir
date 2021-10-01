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
import java.util.Vector;

@WebServlet(name = "modeConducteur")
public class modeConducteur extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         request.setCharacterEncoding("utf-8");
        String id_membre=request.getParameter("id_membre");

        Object [] objects=Main.demandeReservation(id_membre);

        List<Membre> membres= (List<Membre>) objects[0];
        List<Trajet> trajets= (List<Trajet>) objects[1];
        List<Reservation> reservations= (List<Reservation>) objects[2];

        List<Trajet> mesTrajets=Main.mesTrajet(id_membre);

        request.setAttribute("liste_trajet",mesTrajets);
        request.setAttribute("id_membre",id_membre);
        request.setAttribute("membres",membres);
        request.setAttribute("trajets",trajets);
        request.setAttribute("reservations",reservations);
        this.getServletContext().getRequestDispatcher("/profile_conducteur.jsp").forward(request,response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
         String id_membre=request.getParameter("id_membre");

         Object [] objects=Main.demandeReservation(id_membre);

        List<Membre> membres= (List<Membre>) objects[0];
        List<Trajet> trajets= (List<Trajet>) objects[1];
        List<Reservation> reservations= (List<Reservation>) objects[2];

        List<Trajet> mesTrajets=Main.mesTrajet(id_membre);

        request.setAttribute("liste_trajet",mesTrajets);
        request.setAttribute("id_membre",id_membre);
        request.setAttribute("membres",membres);
        request.setAttribute("trajets",trajets);
        request.setAttribute("reservations",reservations);
        this.getServletContext().getRequestDispatcher("/profile_conducteur.jsp").forward(request,response);
    }
}
