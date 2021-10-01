package com.projet.servlet;

import com.projet.beans.Compte;
import com.projet.beans.Main;
import com.projet.beans.Membre;
import com.projet.beans.Trajet;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(name = "Acceuil")
public class Acceuil extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String email = request.getParameter("id_email");
        String passe = request.getParameter("mot de passe");
        Compte compte = new Compte();
        compte.setId_email(email);
        compte.setMot_de_passe(passe);
        Object [] res= compte.login();
        if ((boolean) res[0].equals(false)) {
            boolean b = true;
            request.setAttribute("message", b);
            this.getServletContext().getRequestDispatcher("/Acceuil.jsp").forward(request, response);
        }
        else {
            if (email.equals("admin@admin.com")) {

                HttpSession session=request.getSession();
                session.setAttribute("id_membre","admin");
                response.sendRedirect("/ModeAdmin");

            }
            else {
                Object [] objects=Main.mesNotification((String)res[1]);
                HttpSession session = request.getSession();
                session.setAttribute("id_membre", (String)res[1]);
                session.setAttribute("liste_notification",objects[0]);
                session.setAttribute("nombre_notification",objects[1]);
                this.getServletContext().getRequestDispatcher("/page_mode_utilisateur.jsp").forward(request, response);
            }

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        session.invalidate();


        String [] stat=Main.statAcceuil() ;
        String stat1=stat[0];String stat2=stat[1];String stat3=stat[2];String stat4=stat[3];

        request.setAttribute("liste_trajet",Main.dernierTrajet());
        request.setAttribute("stat1",stat1);
        request.setAttribute("stat2",stat2);
        request.setAttribute("stat3",stat3);
        request.setAttribute("stat4",stat4);
        this.getServletContext().getRequestDispatcher("/Acceuil.jsp").forward(request,response);
    }
}
