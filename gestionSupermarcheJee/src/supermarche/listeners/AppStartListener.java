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
		articles.put(3000128651210l, new Article(3000128651210l, "351O", "Steak de petits pois végan", 2100, 1, "https://img.over-blog-kiwi.com/0/89/77/71/20170410/ob_4fa4c6_steack-vegetarien-pois-chiches-lenti.jpg"));
		articles.put(3000128651212l, new Article(3000128651212l, "777Z", "Daube de cheval bio", 1872, 1, "https://www.la-viande.fr/sites/default/files/styles/slider_recettes/public/recettes/images/i06it10.jpg?itok=jyEkGalO"));
		articles.put(3000128651214l, new Article(3000128651214l, "144R", "Pack de 6 Pommes rouges", 216, 1, "https://wordpress.potagercity.fr/wp-content/uploads/2019/02/tout-savoir-sur-pomme-gala.jpg"));
		articles.put(3000128651216l, new Article(3000128651216l, "542Y", "Big burger signature thekairi", 152, 1, "https://i.ytimg.com/vi/NfcRmeSDwDY/maxresdefault.jpg"));
		articles.put(3000128651218l, new Article(3000128651218l, "AAE2", "Jacquie et michel l'intégrale", 4899, 1, "https://jmcontact.fr/jacquieetmichel/images/portfolio/modals/m-soirees.jpg"));
		Supermarche supermarche = new Supermarche(articles);
		sce.getServletContext().setAttribute("supermarche", supermarche);
    }
	
}
