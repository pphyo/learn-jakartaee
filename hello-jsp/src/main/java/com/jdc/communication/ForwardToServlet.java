package com.jdc.communication;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/forward-to")
public class ForwardToServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		getServletContext().getRequestDispatcher("/header").include(req, resp);
		
		resp.getWriter().append("<h1>").append("Mesage from forward to servlet").append("</html>").flush();
		
		getServletContext().getRequestDispatcher("/footer").include(req, resp);
	}

}
