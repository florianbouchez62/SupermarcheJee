<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix= "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<%@ include file="/jsp/layout/head.jsp"%>
	<body>
		<%@ include file="/jsp/layout/nav.jsp"%>
		
		<div class="row">
			<div class="col s12">
				<h4>Votre panier</h4>
				
				<c:if test="${message != null}">
					<p style="color: darkred">ERREUR - Le code barre ne correspond à aucun article !</p>
				</c:if>
				
				<form method="post" action="Panier">
					<input type="hidden" name="method" value="addByCode">
					<input type="text" name="code" placeholder="Ajouter un article par code barre">
					<input type="submit" value="Ajouter l'article">
				</form>	
				
				<c:if test="${panier.size() > 0}">								
					<table>
						  <thead>
						    <tr>
						        <th>Libelle</th>
						        <th>Référence</th>
						        <th>Code barre</th>
						        <th>Prix HT</th>
						        <th>Prix TTC</th>
						        <th>Montant TVA</th>
						        <th>Actions</th>
						    </tr>
						  </thead>
					
						 <tbody>
						 	<c:set var="totalTTC" value="${0}" />
						 	<c:set var="totalHT" value="${0}" />
						 	<c:set var="totalTVA" value="${0}" />
						  	<c:forEach items="${panier}" var="article">
							    <tr>
							      <c:set var="totalTTC" value="${totalTTC + article.value.prixTTC}" />
							      <c:set var="totalHT" value="${totalHT + article.value.prixHT}" />
							      <c:set var="totalTVA" value="${totalTVA + article.value.montantTVA}" />
							      <td><c:out value="${article.value.libelle}" /></td>
							      <td><c:out value="${article.value.reference}" /></td>
							      <td><c:out value="${article.value.codeBarre}" /></td>
							      <td><fmt:formatNumber value="${article.value.prixHT / 100}" pattern="0.00"/> EUR</td>
							      <td><fmt:formatNumber value="${article.value.prixTTC / 100}" pattern="0.00"/> EUR</td>
							      <td><fmt:formatNumber value="${article.value.montantTVA / 100}" pattern="0.00"/> EUR</td>
							      <td>
							      	<form method="post" action="Panier">
							      		<input type="hidden" name="method" value="delete">
							      		<input type="hidden" name="index" value="${article.key}">
							      		<input type="submit" value="Retirer">
							      	</form>
							      </td>
							    </tr>
							</c:forEach>
						</tbody>
					</table>
					
					<h3>Total TTC : <fmt:formatNumber value="${totalTTC / 100 }" pattern = "0.00"/> EUR</h3>
					<p>dont TVA : <fmt:formatNumber value="${totalTVA / 100 }" pattern = "0.00"/> EUR</p>
					<p>Total HT : <fmt:formatNumber value="${totalHT / 100 }" pattern = "0.00"/> EUR</p>
				</c:if>
				<c:if test="${panier.size() == 0}">
					<p>Votre panier est vide</p>
				</c:if>
			</div>
		</div>
		
	</body>
</html>