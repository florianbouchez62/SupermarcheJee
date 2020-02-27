package supermarche.servlets;

import java.io.IOException;

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
 * Servlet implementation class Gestion
 */
@WebServlet("/Gestion")
public class Gestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String errorMessage = null;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("loggedAs") != null) {
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/jsp/gestion/Menu.jsp");
			dispatcher.forward(request, response);
			session.setAttribute("addMessage", null);
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
		this.errorMessage = null;
	
		switch(method) {
			case "add":
				Article articleToAdd = createArticleFromData(request);
				if(articleToAdd != null) {
					if(!supermarche.getArticles().containsKey(articleToAdd.getCodeBarre())) {
						supermarche.ajouterArticle(articleToAdd);
					} else {
						this.errorMessage="Un code barre existe déjà pour ce produit.";
					}
				} else {
					this.errorMessage = "Une des propriétés de l'Article n'est pas valide.";
				}
				break;
			case "edit":
				boolean completed = processEditForm(request, supermarche);
				if(!completed) {
					this.errorMessage = "Modification de l'article impossible, un champ du formulaire est invalide";
				}
				break;
			case "delete":
				long key = Long.parseLong(request.getParameter("index"));
				supermarche.supprimerArticle(key);
				break;
		}
		
		session.setAttribute("addMessage", this.errorMessage);
		response.sendRedirect(request.getContextPath() + "/Gestion");
	}
	
	//Crée un article en fonction des données passées dans la requête
	private Article createArticleFromData(HttpServletRequest request) {
		try {
			String imageUri = request.getParameter("imageUri");
			long codeBarre = Long.parseLong(request.getParameter("codeBarre"));
			String reference = request.getParameter("reference");
			String libelle = request.getParameter("libelle");
			int prixHT = (int)(Float.parseFloat(request.getParameter("prixHT")) * 100);
			int tauxTVA = Integer.parseInt(request.getParameter("tauxTVA"));
			return new Article(codeBarre, reference, libelle, prixHT, tauxTVA, imageUri);
		} catch (Exception e) {
			this.errorMessage = "Une des propriétés de l'Article n'est pas valide.";
			return null;
		}
	}
	
	//Action lorsque le formulaire de modification est envoyé, retourne true si la modification est bien effectuée
	private boolean processEditForm(HttpServletRequest request, Supermarche supermarche) {
		try {
			long codeBarre = Long.parseLong(request.getParameter("codeBarreModif"));
			String libelle = request.getParameter("libelleModif");
			String imageUri = request.getParameter("imageUriModif");
			int prixHT = (int)(Float.parseFloat(request.getParameter("prixHTModif")) * 100);
			Article a = supermarche.getArticles().get(codeBarre);
			a.setLibelle(libelle);
			a.setImageUri(imageUri);
			a.setPrixHT(prixHT);
			supermarche.getArticles().replace(codeBarre, a);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

}
