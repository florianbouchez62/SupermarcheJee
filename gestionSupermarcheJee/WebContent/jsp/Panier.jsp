<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix= "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<%@ include file="/jsp/layout/head.jsp"%>
	<style><%@include file="/jsp/static/Home.css"%></style>
	<script><%@include file="/jsp/static/Script.js"%></script>
	<body>
		<%@ include file="/jsp/layout/nav.jsp"%>
		
		<div class="row">
			<div class="col s12">
				
				<c:if test="${message != null}">
					<div class="alert alert-danger" style="width:80%;height:30%;margin-left:10%;margin-top:1em;" role="alert">
						<i class="fa fa-exclamation-triangle" aria-hidden="true"> </i>
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    	<span aria-hidden="true">&times;</span>
					  	 </button>
					    Le code barre ne correspond à aucun article !
					</div>
					
				</c:if>
				
				<form class="form-inline" method="post" action="Panier" style="margin-left:8em;margin-top:2em;">
				  <div class="form-group mx-sm-3 mb-2">
					<input type="hidden" name="method" value="addByCode">
					<input type="text" name="code" class="form-control" placeholder="Code Barre">
				  </div>
					<button type="submit" class="btn btn-dark mb-2">Ajouter l'article</i></button>
					
				</form>
				
				
				<c:if test="${panier.size() > 0}">		
				
					<table class="table" align="center" style="width:80%;">
					  <thead>
					    <tr>
					    	<th></th>
					        <th></th>
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
							      <td class="align-middle"><img style="height:7%;" src="${article.value.imageUri}" alt="Img" class="product-grid__img" /></td>
							      <td class="align-middle">
							      	<span style="font-weight: bold;" ><c:out value="${article.value.libelle}"/></br></span>
							      	<span style="font-size:10px;">Réf: <c:out value="${article.value.reference}" /></span>
							      </td>
							      <td class="align-middle"><c:out value="${article.value.codeBarre}" /></td>
							      <td class="align-middle"><fmt:formatNumber value="${article.value.prixHT / 100}" pattern="0.00"/> EUR</td>
							      <td class="align-middle"><fmt:formatNumber value="${article.value.prixTTC / 100}" pattern="0.00"/> EUR</td>
							      <td class="align-middle"><fmt:formatNumber value="${article.value.montantTVA / 100}" pattern="0.00"/> EUR</td>
							      <td class="align-middle" style="padding-top:2%;">
							      	<form method="post" action="Panier">
							      		<input type="hidden" name="method" value="delete">
							      		<input type="hidden" name="index" value="${article.key}">
							      		<button type="submit" class="btn btn-dark btn-sm">Retirer <i class="fas fa-trash"></i></button>
							      	</form>
							      </td>
							    </tr>
							</c:forEach>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td>Total TTC </br> TVA </br> Total Ht </td>
							<td>
								<fmt:formatNumber value="${totalTTC / 100 }" pattern = "0.00"/> EUR </br>
								<fmt:formatNumber value="${totalTVA / 100 }" pattern = "0.00"/> EUR </br>
								<fmt:formatNumber value="${totalHT / 100 }" pattern = "0.00"/> EUR </br>
							</td>
						</tbody>
					  </tbody>
					</table>
				</c:if>
				<c:if test="${panier.size() == 0}">
					<center><p>Votre panier est vide</p>
				</c:if>
			</div>
		</div>
		
	</body>
</html>