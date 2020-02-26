package supermarche.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import supermarche.models.Article;
import supermarche.models.Supermarche;

/**
 * Servlet implementation class Panier
 */
@WebServlet("/Panier")
public class Panier extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/jsp/Panier.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings({ "unchecked", "unlikely-arg-type" })
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("je passe dans le post");
		HttpSession session = request.getSession(false);
		if(session != null) {
			if(request.getParameter("method").equals("add")) {
				System.out.println("la methode est bien add");
				Supermarche supermarche = (Supermarche) this.getServletContext().getAttribute("supermarche");
				ArrayList<Article> panier = (ArrayList<Article>) session.getAttribute("panier");
				System.out.println(supermarche.getArticles());
				long CodeBarre = Long.parseLong(request.getParameter("article"));
				Article a = supermarche.getArticles().get(CodeBarre);
				System.out.println(panier);
				panier.add(a);
			}
		}

		response.sendRedirect(request.getContextPath() + "/Home");
	}

}
