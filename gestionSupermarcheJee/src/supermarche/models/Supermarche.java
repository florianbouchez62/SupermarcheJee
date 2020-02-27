package supermarche.models;

import java.util.Map;

public class Supermarche {

	private Map<Long, Article> articles;

	public Supermarche(Map<Long, Article> articles) {
		this.articles = articles;
	}
	
	
	
	public Map<Long, Article> getArticles() {
		return articles;
	}
	

	public void ajouterArticle(Article article) {
		this.articles.put(article.getCodeBarre(), article);
	}
	
	public void supprimerArticle(long key) {
		this.articles.remove(key);
	}
	
	public void modifierArticle(Article article) {
		this.articles.replace(article.getCodeBarre(), article);
	}
}
