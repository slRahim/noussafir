package com.projet.servlet;

import com.projet.beans.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AnnulerReservation")
public class AnnulerReservation extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        int id_reservation = Integer.parseInt( request.getParameter("id_reservation"));

        Reservation annuler = new Reservation();
        annuler.annulerReservation(id_reservation);

        request.setAttribute("id_membre",request.getParameter("id_membre"));
        this.getServletContext().getRequestDispatcher("/Voyageur").include(request,response);

    }
}
