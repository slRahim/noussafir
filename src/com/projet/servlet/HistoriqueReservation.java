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

@WebServlet(name = "HistoriqueReservation")
public class HistoriqueReservation extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String id= (String) request.getAttribute("id_membre");

        Object [] objects= Main.historiqueReservation(id);
        List<Reservation> reservations= (List<Reservation>) objects[0];
        List<Trajet>trajets = (List<Trajet>) objects[1];
        List<Membre> membres= (List<Membre>) objects[2];

        request.setAttribute("id_membre",id);
        request.setAttribute("liste_reservation",reservations);
        request.setAttribute("liste_trajet",trajets);
        request.setAttribute("liste_conducteur",membres);
        this.getServletContext().getRequestDispatcher("/historique_reservation.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id=request.getParameter("id_membre");

        Object [] objects= Main.historiqueReservation(id);
        List<Reservation> reservations= (List<Reservation>) objects[0];
        List<Trajet>trajets = (List<Trajet>) objects[1];
        List<Membre> membres= (List<Membre>) objects[2];

        request.setAttribute("id_membre",id);
        request.setAttribute("liste_reservation",reservations);
        request.setAttribute("liste_trajet",trajets);
        request.setAttribute("liste_conducteur",membres);
        this.getServletContext().getRequestDispatcher("/historique_reservation.jsp").forward(request,response);

    }
}
