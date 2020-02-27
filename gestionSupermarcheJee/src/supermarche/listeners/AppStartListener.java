package supermarche.listeners;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import supermarche.models.Article;
import supermarche.models.Supermarche;

/**
 * Application Lifecycle Listener implementation class AppStartListener
 *
 */
@WebListener
public class AppStartListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public AppStartListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
    	Map<Long, Article> articles = new HashMap<Long, Article>();
		articles.put(3000128651210l, new Article(3000128651210l, "351O", "Garbolino carnassier", 2100, 1, "https://www.pacificpeche.com/media/catalog/product/c/a/canne-mort-manie-carnassier-garbolino-tradition-mort-manie-3m-20-60g-152469-a.jpg"));
		articles.put(3000128651212l, new Article(3000128651212l, "777Z", "Daiwa megaforce big fish", 1872, 1, "https://www.pacificpeche.com/imgs/1/canne-daiwa-megaforce-big-fish-362xxxh-3-60m-250-500g-135955-a.jpg"));
		articles.put(3000128651214l, new Article(3000128651214l, "144R", "Tenryu furray racing", 216, 1, "https://www.pacificpeche.com/imgs/1/canne-lancer-tenryu-furrary-racing-2-47m-80lb-40-130g-109757-a.jpg"));
		articles.put(3000128651216l, new Article(3000128651216l, "542Y", "Tenryu furrary travel quatro", 152, 1, "https://www.pacificpeche.com/imgs/1/canne-lancer-tenryu-furrary-travel-quatro-2-70m-60-180g-60lb-125253-a.jpg"));
		articles.put(3000128651218l, new Article(3000128651218l, "AAE2", "Spinerbait sakura micro 5g", 4899, 1, "https://www.pacificpeche.com/imgs/1/leurre-metallique-spinenrbait-carnassier-sakura-monarc-micro-5g-121473-5.jpg"));
		Supermarche supermarche = new Supermarche(articles);
		sce.getServletContext().setAttribute("supermarche", supermarche);
    }
	
}
