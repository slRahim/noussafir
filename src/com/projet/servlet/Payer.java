package com.projet.servlet;

import com.projet.beans.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Payer")
public class Payer extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        int id_reservation = Integer.parseInt(request.getParameter("id_reservation"));

        Reservation reservation = new Reservation();
        reservation.payerReservation(id_reservation);

        this.getServletContext().getRequestDispatcher("/page_mode_utilisateur.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("id_reservation",request.getParameter("id_reservation"));
        this.getServletContext().getRequestDispatcher("/payement.jsp").forward(request,response);

    }
}
