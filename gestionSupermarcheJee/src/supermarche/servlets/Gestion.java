package supermarche.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import supermarche.models.Supermarche;

/**
 * Servlet implementation class Gestion
 */
@WebServlet("/Gestion")
public class Gestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("loggedAs") != null) {
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/jsp/gestion/Menu.jsp");
			dispatcher.forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + "/Login");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String method = request.getParameter("method");
		Supermarche supermarche = (Supermarche) this.getServletContext().getAttribute("supermarche");
	
		switch(method) {
			case "delete":
				long key = Long.parseLong(request.getParameter("index"));
				supermarche.supprimerArticle(key);
		}
		
		response.sendRedirect(request.getContextPath() + "/Gestion");
	}

}
