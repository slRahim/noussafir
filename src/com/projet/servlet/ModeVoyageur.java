package com.projet.servlet;

import com.projet.beans.Main;
import com.projet.beans.Reservation;
import com.projet.beans.Trajet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ModeVoyageur")
public class ModeVoyageur extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id=request.getParameter("id_membre");

        //la metodes qui charge les reservations du voyageur
        Object [] objects=Main.mesReservation(id) ;
        List<Reservation> reservations= (List<Reservation>) objects[0];
        List<Trajet> trajets= (List<Trajet>) objects[1];

        List<Trajet> toutTrajet=Main.getAllTrajetVoyageur();

        request.setAttribute("id_membre",id);
        request.setAttribute("liste_reservation", reservations );
        request.setAttribute("list_trajet",trajets);
        request.setAttribute("tout_trajet",toutTrajet);
        this.getServletContext().getRequestDispatcher("/profile_voyageur.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id=request.getParameter("id_membre");

        //la metodes qui charge les reservations du voyageur
        Object [] objects=Main.mesReservation(id) ;
        List<Reservation> reservations= (List<Reservation>) objects[0];
        List<Trajet> trajets= (List<Trajet>) objects[1];


        List<Trajet> toutTrajet=Main.getAllTrajetVoyageur();

        request.setAttribute("id_membre",id);
        request.setAttribute("liste_reservation", reservations );
        request.setAttribute("list_trajet",trajets);
        request.setAttribute("tout_trajet",toutTrajet);
        this.getServletContext().getRequestDispatcher("/profile_voyageur.jsp").forward(request,response);

    }
}
