package com.projet.servlet;

import com.projet.beans.Trajet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.table.TableRowSorter;
import java.io.IOException;

@WebServlet(name = "SupprimerTrajet")
public class SupprimerTrajet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id_trajet=request.getParameter("id_trajet");
        String id=request.getParameter("id_membre");

        Trajet trajet=new Trajet();
        trajet.setId_trajet(Integer.valueOf(id_trajet));

        trajet.supprimerTrajet();

        request.setAttribute("id_membre",id);
        this.getServletContext().getRequestDispatcher("/Conducteur").include(request,response);

    }
}
