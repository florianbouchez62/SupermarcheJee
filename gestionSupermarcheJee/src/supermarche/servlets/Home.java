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
		articles.put(3000128651210l, new Article(3000128651210l, "351O", "Garbolino carnassier", 2100, 1, "https://www.pacificpeche.com/media/catalog/product/c/a/canne-mort-manie-carnassier-garbolino-tradition-mort-manie-3m-20-60g-152469-a.jpg"));
		articles.put(3000128651212l, new Article(3000128651212l, "777Z", "Daiwa megaforce big fish", 1872, 1, "https://www.pacificpeche.com/imgs/1/canne-daiwa-megaforce-big-fish-362xxxh-3-60m-250-500g-135955-a.jpg"));
		articles.put(3000128651214l, new Article(3000128651214l, "144R", "Tenryu furray racing", 216, 1, "https://www.pacificpeche.com/imgs/1/canne-lancer-tenryu-furrary-racing-2-47m-80lb-40-130g-109757-a.jpg"));
		articles.put(3000128651216l, new Article(3000128651216l, "542Y", "Tenryu furrary travel quatro", 152, 1, "https://www.pacificpeche.com/imgs/1/canne-lancer-tenryu-furrary-travel-quatro-2-70m-60-180g-60lb-125253-a.jpg"));
		articles.put(3000128651218l, new Article(3000128651218l, "AAE2", "Spinerbait sakura micro 5g", 4899, 1, "https://www.pacificpeche.com/imgs/1/leurre-metallique-spinenrbait-carnassier-sakura-monarc-micro-5g-121473-5.jpg"));
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
