package com.projet.servlet;

import com.projet.beans.Compte;
import com.projet.beans.Main;
import com.projet.beans.Membre;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "NouveauClient")
@MultipartConfig(fileSizeThreshold = 1024*1024*2,
maxFileSize = 1024*1024*10,
        maxRequestSize = 1024*1024*20
)
public class NouveauClient extends HttpServlet {
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


        Part part = request.getPart("photo");
        String fileName = Main.extractFileName(part);
        if (!fileName.equals("")) {
            String savePath = "C:\\Users\\Abderahim\\intelj\\pfd\\web\\static\\img\\" + File.separator + fileName;
            File filesave = new File(savePath);
            part.write(savePath + File.separator);
        }






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
        membre.setImage(fileName);

        Compte compte=new Compte();
        compte.setId_email(email);
        compte.setMot_de_passe(pass);

        Object [] objects= membre.ajouterMembre(compte);
        int statu= (int) objects[0];
        String mem= (String) objects[1];

        if (statu!=0) {
            HttpSession session=request.getSession();
            session.setAttribute("id_membre",mem);
            this.getServletContext().getRequestDispatcher("/page_mode_utilisateur.jsp").forward(request,response);
        }
        else {
            request.setAttribute("etat",statu);
            this.getServletContext().getRequestDispatcher("/page_inscription.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
