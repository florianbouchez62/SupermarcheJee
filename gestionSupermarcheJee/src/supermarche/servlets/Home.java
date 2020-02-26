package supermarche.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import supermarche.models.Article;
import supermarche.models.Supermarche;

/**
 * Servlet implementation class Home
 */
@WebServlet("/Home")
public class Home extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#init(ServletConfig config)
	 */
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);	
		Map<Long, Article> articles = new HashMap<Long, Article>();
		articles.put(3000128651210l, new Article(3000128651210l, "351O", "Steak de petits pois végan", 2100, 1, "https://img.over-blog-kiwi.com/0/89/77/71/20170410/ob_4fa4c6_steack-vegetarien-pois-chiches-lenti.jpg"));
		articles.put(3000128651212l, new Article(3000128651212l, "777Z", "Daube de cheval bio", 1872, 1, "https://www.la-viande.fr/sites/default/files/styles/slider_recettes/public/recettes/images/i06it10.jpg?itok=jyEkGalO"));
		articles.put(3000128651214l, new Article(3000128651214l, "144R", "Pack de 6 Pommes rouges", 216, 1, "https://wordpress.potagercity.fr/wp-content/uploads/2019/02/tout-savoir-sur-pomme-gala.jpg"));
		articles.put(3000128651216l, new Article(3000128651216l, "542Y", "Big burger signature thekairi", 152, 1, "https://i.ytimg.com/vi/NfcRmeSDwDY/maxresdefault.jpg"));
		articles.put(3000128651218l, new Article(3000128651218l, "AAE2", "Jacquie et michel l'intégrale", 4899, 1, "https://jmcontact.fr/jacquieetmichel/images/portfolio/modals/m-soirees.jpg"));
		Supermarche supermarche = new Supermarche(articles);
		config.getServletContext().setAttribute("supermarche", supermarche);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		if (session!=null) {
			System.out.println("Création d'un panier vide");
			if (session.getAttribute("panier") == null) {
				session.setAttribute("panier", new ArrayList<Article>());
			}
		}
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/jsp/Home.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
