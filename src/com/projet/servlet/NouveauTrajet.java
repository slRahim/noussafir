package com.projet.servlet;

import com.projet.beans.Trajet;
import com.projet.beans.Voiture;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "NouveauTrajet")
public class NouveauTrajet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String date=request.getParameter("date_depart");
        String opt_fummer=request.getParameter("opt_fummer");
        String opt_bagage=request.getParameter("opt_bagage");
        String opt_musique=request.getParameter("opt_musique");
        String [] option={opt_fummer,opt_bagage,opt_musique};

        SimpleDateFormat format =new SimpleDateFormat("yy-MM-dd");
        Date date_depart= null;
        try {
            date_depart = format.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Trajet trajet=new Trajet();
        trajet.setV_depart(request.getParameter("v_depart"));
        trajet.setV_arriver(request.getParameter("v_arriver"));
        trajet.setArret_1(request.getParameter("arret_1"));
        trajet.setArret_2(request.getParameter("arret_2"));
        trajet.setArret_3(request.getParameter("arret_3"));
        trajet.setDate_dapart(date_depart);
        for (int i = 0; i <option.length ; i++) {
            if (option[i]!=null) {
                trajet.setDescription(trajet.getDescription()+" "+ option[i]);
            }
        }
        trajet.setDate_ajout(new Date());
        trajet.setH_depart(request.getParameter("h_depart"));
        trajet.setNombre_place(Integer.parseInt(request.getParameter("n_place")));
        trajet.setPrix(Float.parseFloat(request.getParameter("p_place")));



        Voiture voiture=new Voiture();
        voiture.setMatricule(request.getParameter("id_matricule"));
        voiture.setMarque(request.getParameter("v_marque"));
        voiture.setDescription(request.getParameter("v_description"));

        trajet.publierTrajet(voiture,request.getParameter("id_membre"));

        request.setAttribute("id_membre",request.getParameter("id_membre"));
        this.getServletContext().getRequestDispatcher("/Conducteur").include(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
