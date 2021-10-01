package com.projet.servlet;

import com.projet.beans.Reservation;
import com.sun.org.apache.regexp.internal.RE;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ImprimerReservation")
public class ImprimerReservation extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        Reservation reservation=new Reservation();

        reservation.setId_reservation(Integer.parseInt(request.getParameter("id_reservation")));

        Object [] objects=reservation.getReservation();

        request.setAttribute("reservation",(Reservation)objects[0]);
        request.setAttribute("membre",(String)objects[1]);
        request.setAttribute("trajet",objects[2]);
        this.getServletContext().getRequestDispatcher("/imprimer_reservation.jsp").forward(request,response);

    }
}
