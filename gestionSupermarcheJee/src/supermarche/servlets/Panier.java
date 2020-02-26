package supermarche.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.TreeMap;

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
	@SuppressWarnings({ "unchecked" })
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		boolean redirectHome = true;
		String message = null;
		
		if(session != null) {
			String method = request.getParameter("method");
			Supermarche supermarche = (Supermarche) this.getServletContext().getAttribute("supermarche");
			TreeMap<Integer, Article> panier = (TreeMap<Integer, Article>) session.getAttribute("panier");
			Article articleToAdd = null;
			int key = 0;
			
			switch(method) {
				case "add" :
					long CodeBarre = Long.parseLong(request.getParameter("article"));
					articleToAdd = supermarche.getArticles().get(CodeBarre);
					if(panier.lastEntry() != null) {
						key = panier.lastEntry().getKey() + 1;
					}
					panier.put(key, articleToAdd);
					break;
					
				case "addByCode" :
					try {
						long codeSubmitted = Long.parseLong(request.getParameter("code"));
						System.out.println("l63 - " + codeSubmitted);
						articleToAdd = supermarche.getArticles().get(codeSubmitted);
						System.out.println("l65 - " + articleToAdd);
						if(articleToAdd != null) {
							if(panier.lastEntry() != null) {
								key = panier.lastEntry().getKey() + 1;
							}
							panier.put(key, articleToAdd);
						} else {
							message = "Le code barre ne correspond à aucun article";
						}
					} catch (Exception e) {
						message = "Le code barre ne correspond à aucun article";
					}
					redirectHome = false;
					break;
					
				case "delete" :
					key = Integer.parseInt(request.getParameter("index"));
					panier.remove(key);
					redirectHome = false;
					break;
			}
			
		}
		
		session.setAttribute("message", message);

		if(redirectHome) {
			response.sendRedirect(request.getContextPath() + "/Home");
		} else {
			response.sendRedirect(request.getContextPath() + "/Panier");
			System.out.println("l91 - Je redirect");
		}
		
	}

}
