package com.projet.servlet;

import com.projet.beans.Trajet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "RechercheTrajet")
public class RechercheTrajet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String date = request.getParameter("date_depart");
        SimpleDateFormat format =new SimpleDateFormat("yy-MM-dd");
        Date date_depart= null;
        try {
            date_depart = format.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Trajet trajet = new Trajet();

        trajet.setV_depart(request.getParameter("ville_depart"));
        trajet.setV_arriver(request.getParameter("ville_arriver"));
        trajet.setDate_dapart(date_depart);

        request.setAttribute("id_membre",request.getParameter("id_membre"));
        request.setAttribute("liste_trajet",trajet.rechercheTrajet());
        this.getServletContext().getRequestDispatcher("/Voyageur").include(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
