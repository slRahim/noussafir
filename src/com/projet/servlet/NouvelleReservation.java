package com.projet.servlet;

import com.projet.beans.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "NouvelleReservation")
public class NouvelleReservation extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String id_membre=request.getParameter("id_membre");
        int id_trajet=Integer.parseInt(request.getParameter("id_trajet"));
        Reservation reservation=new Reservation();
        reservation.reserver(id_trajet,id_membre);

         request.setAttribute("id_membre",id_membre);
        this.getServletContext().getRequestDispatcher("/Voyageur").include(request,response);

    }
}
