package com.projet.servlet;

import com.projet.beans.Compte;
import com.projet.beans.Main;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "motDePasseOublier")
public class motDePasseOublier extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        Compte compte=new Compte() ;

        compte.setId_email(request.getParameter("membre"));
        compte.setMot_de_passe(request.getParameter("mot_passe"));

        compte.modifiePassOublier();

        this.getServletContext().getRequestDispatcher("/Acceuil").include(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id=request.getParameter("num_tel");
        String email=request.getParameter("mail");




        int code=Main.generationCode(email,id);
        System.out.println(code);


        request.setAttribute("code_confirmation", code);
        this.getServletContext().getRequestDispatcher("/page_pass_oublier.jsp").forward(request,response);

    }
}
