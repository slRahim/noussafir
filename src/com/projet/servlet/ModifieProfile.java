package com.projet.servlet;

import com.projet.beans.Compte;
import com.projet.beans.Main;
import com.projet.beans.Membre;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "ModifieProfile")
@MultipartConfig(fileSizeThreshold = 1024*1024*2,
        maxFileSize = 1024*1024*10,
        maxRequestSize = 1024*1024*20
)
public class ModifieProfile extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String nom_util =request.getParameter("nom_utilisateur");
        String email=request.getParameter("id_email");
        String pass=request.getParameter("motdpass");
        String nom=request.getParameter("nom_client");
        String prenom=request.getParameter("prenom_client");
        String date= request.getParameter("date_client");
        String adresse=request.getParameter("adresse");
        String tel=request.getParameter("tel_client");





        SimpleDateFormat format =new SimpleDateFormat("yy-MM-dd");
        Date date_naissance= null;
        try {
            date_naissance = format.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Membre membre=new Membre();
        membre.setNom_utilisateur(nom_util);
        membre.setNom(nom);
        membre.setPrenom(prenom);
        membre.setDate_naissance(date_naissance);
        membre.setAdresse(adresse);
        membre.setNum_tel(tel);


        Compte compte=new Compte();
        compte.setId_email(email);
        compte.setMot_de_passe(pass);

        membre.editMembre(compte);

        this.getServletContext().getRequestDispatcher("/page_mode_utilisateur.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
