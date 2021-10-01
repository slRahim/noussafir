package com.projet.servlet;

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

@WebServlet(name = "ModifiePhoto")
@MultipartConfig(fileSizeThreshold = 1024*1024*2,
        maxFileSize = 1024*1024*10,
        maxRequestSize = 1024*1024*20
)
public class ModifiePhoto extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String id_membre=request.getParameter("id_membre");

        Part part = request.getPart("photo");
        String fileName = Main.extractFileName(part);
        String savePath = "C:\\Users\\Abderahim\\intelj\\pfd\\web\\static\\img\\"+ File.separator+fileName;
        File filesave = new File(savePath);
        part.write(savePath+File.separator);

        Membre membre=new Membre();

        membre.setNom_utilisateur(id_membre);
        membre.setImage(fileName);

        membre.modifiePhoto();


        this.getServletContext().getRequestDispatcher("/page_mode_utilisateur.jsp").include(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
