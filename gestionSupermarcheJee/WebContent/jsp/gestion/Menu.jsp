<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix= "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<%@ include file="/jsp/layout/head.jsp"%>
	<body>
		<%@ include file="/jsp/layout/nav.jsp"%>
		<h3>Menu de gestion des articles</h3>
		
		<c:if test="${ supermarche.articles.size() > 0 }">
			<table>
				<thead>
					<tr>
						<th>Image</th>
						<th>Code Barre</th>
						<th>Reference</th>
						<th>Libelle</th>
						<th>Prix HT</th>
						<th>Taux TVA</th>
						<th>Action</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${supermarche.articles}" var="article">
						<tr>
							<td>
								<img src="${article.value.imageUri}" width=50 height=50 />
							</td>
							<td>${article.value.codeBarre}</td>
							<td>${article.value.reference}</td>
							<td>${article.value.libelle}</td>
							<td><fmt:formatNumber value="${article.value.prixHT / 100}" pattern="0.00"/> EUR</td>
							<td><fmt:formatNumber value="${article.value.tauxTVA / 100}" pattern="0.00"/> %</td>
							<td>
								<button id="${article.value.codeBarre}">Editer</button>
							</td>
							<td>
								<form method="post" action="Gestion">
									<input type="hidden" name="method" value="delete">
									<input type="hidden" name="index" value="${article.key}">
									<button type="submit"> Supprimer </button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				
			</table>
		</c:if>
		
		<c:if test="${ supermarche.articles.size() == 0 }">
			<p>Il n'y a pas d'articles</p>
		</c:if>
		
		<hr>
		
		<h4>Ajouter un article</h4>
		
		<c:if test="${addMessage != null}">
			<p style="color: darkred">ERREUR - <c:out value="${addMessage}"/></p>
		</c:if>
		
		<form method="post" action="Gestion">
			<input type="hidden" name="method" value="add">
			<label for="imageUri">Url de l'image</label>
			<input type="text" name="imageUri" placeholder="Url de l'image"> <br>
			<label for="codeBarre">Code barre</label>
			<input type="text" name="codeBarre" placeholder="Code Barre" maxlength="13"> <br>
			<label for="reference">Référence</label>
			<input type="text" name="reference" placeholder="Reference" maxlength="6"> <br>
			<label for="libelle">Libelle</label>
			<input type="text" name="libelle" placeholder="Nom du produit" maxlength="100"> <br>
			<label for="prixHT">Prix HT</label>
			<input type="number" step="any" name="prixHT"> EUR<br>
			<label for="tauxTVA">Taux de TVA</label>
			<select name="tauxTVA">
				<option value="0">5.5%</option>
				<option value="1">20.0%</option>
			</select><br>
			<input type="submit" value="Ajouter l'article">
		</form>
	</body>
</html>