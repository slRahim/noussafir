package com.projet.servlet;

import com.projet.beans.Reservation;
import com.projet.beans.Trajet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ConsulterTrajet")
public class ConsulterTrajet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id_trajet=request.getParameter("id_trajet");

        Trajet trajet=new Trajet();
        trajet.setId_trajet(Integer.parseInt(id_trajet));

        Reservation reservation=new Reservation();

        Object [] objects=trajet.consulterTrajet();

        request.setAttribute("trajet",(Trajet)objects[0]);
        request.setAttribute("liste_reservation",reservation.reservationValide(Integer.parseInt(id_trajet)));
        this.getServletContext().getRequestDispatcher("/imprimer_trajet.jsp").forward(request,response);
    }
}
