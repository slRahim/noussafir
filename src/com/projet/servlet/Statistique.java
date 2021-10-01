package com.projet.servlet;

import com.projet.beans.Main;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Statistique")
public class Statistique extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        Object [] objects= Main.statDetail();

        request.setAttribute("actif",objects[0]);
        request.setAttribute("bloquer",objects[1]);
        request.setAttribute("max_publier",objects[2]);
        request.setAttribute("max_note",objects[3]);
        request.setAttribute("max_depart",objects[4]);
        request.setAttribute("max_arriver",objects[5]);
        request.setAttribute("res_valider",objects[6]);
        request.setAttribute("res_cour",objects[7]);
        request.setAttribute("res_annule",objects[8]);
        this.getServletContext().getRequestDispatcher("/stat_admin.jsp").forward(request,response);
    }
}
