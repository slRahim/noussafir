package com.projet.servlet;

import com.projet.beans.Trajet;
import com.projet.beans.Voiture;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "ModifieTrajet")
public class ModifieTrajet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id=request.getParameter("id_membre") ;
        int id_trajet=Integer.parseInt(request.getParameter("id_trajet"));
        String date=request.getParameter("d_depart");
        SimpleDateFormat format =new SimpleDateFormat("yy-MM-dd");
        Date date_depart= null;
        try {
            date_depart = format.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }


        Trajet trajet=new Trajet();
        trajet.setArret_1(request.getParameter("arret_1"));
        trajet.setArret_2(request.getParameter("arret_2"));
        trajet.setArret_3(request.getParameter("arret_3"));
        trajet.setDate_dapart(date_depart);
        trajet.setH_depart(request.getParameter("h_depart"));
        trajet.setNombre_place(Integer.parseInt(request.getParameter("n_place")));
        trajet.setPrix(Float.parseFloat(request.getParameter("p_place")));

        Voiture voiture=new Voiture() ;
        voiture.setMatricule(request.getParameter("id_matricule"));
        voiture.setMarque(request.getParameter("v_marque"));
        voiture.setDescription(request.getParameter("v_description"));

        trajet.editTrajet(id_trajet,voiture);

        request.setAttribute("id_membre",id);
        this.getServletContext().getRequestDispatcher("/Conducteur").include(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id_trajet=request.getParameter("id_trajet");

        Trajet trajet=new Trajet();
        trajet.setId_trajet(Integer.valueOf(id_trajet));

        Object [] objects=trajet.consulterTrajet();

        request.setAttribute("trajet",(Trajet)objects[0]);
        request.setAttribute("voiture",objects[1]);
        this.getServletContext().getRequestDispatcher("/page_trajet.jsp").forward(request,response);

    }
}
