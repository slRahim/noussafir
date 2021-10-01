package com.projet.servlet;

import com.projet.beans.Main;
import com.projet.beans.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SuivreReservationAdmin")
public class SuivreReservationAdmin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        int id_reservation = Integer.parseInt(request.getParameter("id_reservation"));
        Reservation reservation = new Reservation();
        reservation.supprimerReservationAdmin(id_reservation);

        response.sendRedirect("ModeAdmin");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.setCharacterEncoding("utf-8");

        String id_trajet=request.getParameter("id_trajet");

        Object [] objects=Main.voyageurTrajet(Integer.parseInt(id_trajet)) ;

        request.setAttribute("liste_voyageur", objects[0]);
        request.setAttribute("complement_reservation",objects[1]);
        this.getServletContext().getRequestDispatcher("/page_supp_reservation_admin.jsp").forward(request,response);
    }
}
