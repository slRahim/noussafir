package com.projet.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projet.beans.*;

public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// accéder à la page
		req.setAttribute("id_membre",req.getParameter("id_membre"));
		req.getRequestDispatcher("/loginChat.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pseudo = req.getParameter("pseudo");
		System.out.println(pseudo);
		if(pseudo.length()>0){
			req.getSession().setAttribute("user", new User(pseudo));
			resp.sendRedirect("/chat");
		}
	}
}
