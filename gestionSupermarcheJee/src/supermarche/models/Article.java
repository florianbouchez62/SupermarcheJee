package supermarche.models;

public class Article {

	private final static int[] TVA = {550, 2000};
	private long codeBarre;
	private String reference;
	private String libelle;
	private int prixHT;
	private int tauxTVA;
	private String imageUri;
	
	
	public Article(long codeBarre, String reference, String libelle, int prixHT, int tauxTVA, String imageUri) {
		this.codeBarre = codeBarre;
		this.reference = reference;
		this.libelle = libelle;
		this.prixHT = prixHT;
		this.tauxTVA = TVA[tauxTVA];
		this.imageUri = imageUri;
	}

	public long getCodeBarre() {
		return codeBarre;
	}

	public static int[] getTva() {
		return TVA;
	}

	public String getImageUri() {
		return imageUri;
	}

	public String getReference() {
		return reference;
	}

	public String getLibelle() {
		return libelle;
	}

	public int getPrixHT() {
		return prixHT;
	}
	
	public int getPrixTTC() {
		return prixHT + (prixHT * (tauxTVA/100)/100);
	}

	public int getTauxTVA() {
		return tauxTVA;
	}

	@Override
	public String toString() {
		return "Article [codeBarre=" + codeBarre + ", reference=" + reference + ", libelle=" + libelle + ", prixHT="
				+ prixHT + ", tauxTVA=" + tauxTVA + "]";
	}	
	
	
}
