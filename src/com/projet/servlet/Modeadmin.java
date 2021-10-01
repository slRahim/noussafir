package com.projet.servlet;

import com.projet.beans.Main;
import com.projet.beans.Membre;
import com.projet.beans.Trajet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Modeadmin")
public class Modeadmin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        Object [] objects = Main.getAllTrajet() ;
        List<Trajet> trajets = (List<Trajet>) objects[0];
        List<Membre> membres= (List<Membre>) objects[1];

        Object [] objects1=Main.notficationAdmin();

        HttpSession session=request.getSession();

        request.setAttribute("liste_message",Main.messageAdmin());
        request.setAttribute("liste_membre",Main.getAllMembre()[0]);
        request.setAttribute("complement_compte",Main.getAllMembre()[1]);
        request.setAttribute("stat",Main.statAdmin());
        request.setAttribute("liste_trajet",trajets);
        request.setAttribute("complement_trajet",membres);
        session.setAttribute("liste_notification",objects1[0]);
        session.setAttribute("nombre_notification",objects1[1]);
        this.getServletContext().getRequestDispatcher("/profile_admin.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");

        Object [] objects = Main.getAllTrajet() ;
        List<Trajet> trajets = (List<Trajet>) objects[0];
        List<Membre> membres= (List<Membre>) objects[1];

        Object [] objects1=Main.notficationAdmin();

        HttpSession session=request.getSession();

        request.setAttribute("liste_message",Main.messageAdmin());
        request.setAttribute("liste_membre",Main.getAllMembre()[0]);
        request.setAttribute("complement_compte",Main.getAllMembre()[1]);
        request.setAttribute("stat",Main.statAdmin());
        request.setAttribute("liste_trajet",trajets);
        request.setAttribute("complement_trajet",membres);
        session.setAttribute("liste_notification",objects1[0]);
        session.setAttribute("nombre_notification",objects1[1]);
        this.getServletContext().getRequestDispatcher("/profile_admin.jsp").forward(request, response);
    }


}
