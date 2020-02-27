<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix= "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<%@ include file="/jsp/layout/head.jsp"%>
	<head>
		<style><%@include file="/jsp/static/Home.css"%></style>
	</head>
	<body>
		<%@ include file="/jsp/layout/nav.jsp"%>
		
		<c:if test="${addMessage != null}">
			<div class="alert alert-danger" style="width:80%;margin-left:10%;margin-top:1em;" role="alert">
				<i class="fa fa-exclamation-triangle" aria-hidden="true"> </i>
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    	<span aria-hidden="true">&times;</span>
			  	 </button>
			    <c:out value="${addMessage}"/>
			</div>
		</c:if>
		
		<h3 style="margin-left:5em;margin-top:2em;">Gestion des articles</h3>
		
		<c:if test="${ supermarche.articles.size() > 0 }">
		
					<table class="table" align="center" style="width:80%;">
					  <thead>
					    <tr>
					    	<th></th>
					        <th></th>
					        <th>Code barre</th>
					        <th>Prix HT</th>
					        <th>Taux TVA</th>
					        <th>Actions</th>
					    </tr>
					  </thead>
						 <tbody>
						 	<c:set var="totalTTC" value="${0}" />
						 	<c:set var="totalHT" value="${0}" />
						 	<c:set var="totalTVA" value="${0}" />
						  	<c:forEach items="${supermarche.articles}" var="article">
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
							      <td class="align-middle"><fmt:formatNumber value="${article.value.tauxTVA / 100}" pattern="0.00"/> %</td>
							      <td class="align-middle" style="padding-top:2%;">
							      
							      <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
									  <div class="btn-group mr-2" role="group" aria-label="First group">
									    <button class="btn btn-dark btn-sm" style="max-height:2.2em;" 
									    id="${article.value.codeBarre}" 
									    onclick="updateEditForm(${article.value.codeBarre},'${article.value.reference}', '${article.value.libelle}', '${article.value.imageUri}', ${article.value.prixHT / 100}, ${article.value.tauxTVA / 100})">
									    	Editer
									    </button>
									  </div>
									  <div class="btn-group mr-2" role="group" aria-label="Second group">
									  	<form method="post" action="Gestion">
									      	<input type="hidden" name="method" value="delete">
									      	<input type="hidden" name="index" value="${article.key}">
									      	<button type="submit" style="max-height:2.2em;" class="btn btn-dark btn-sm">Supprimer</button>
									    </form>
									 </div>
								</div>
							      
																      
							      </td>
							    </tr>
							</c:forEach>
						</tbody>
					  </tbody>
					</table>

		</c:if>
		
		<c:if test="${ supermarche.articles.size() == 0 }">
			<div class="alert alert-danger" style="width:80%;height:30%;margin-left:10%;margin-top:1em;" role="alert">
				<i class="fa fa-exclamation-triangle" aria-hidden="true"> </i>
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    	<span aria-hidden="true">&times;</span>
			  	 </button>
			    Aucun articles !
			</div>
		</c:if>
		
		<hr>
		
		<div class="row" style="margin-top:2em;">
		
			<div class="col-4 offset-md-1">
				<h3>Ajouter un article</h3>
				<form method="post" style="margin-top: 1em;" action="Gestion">
					<div class="form-row">
					    <div class="form-group col-md-6">
						  	<label for="reference">Référence</label>
							<input type="text" class="form-control" name="reference" placeholder="Ex 73F2" maxlength="6">
					    </div>
					    <div class="form-group col-md-6">
							<label for="codeBarre">Code barre</label>
							<input type="text" class="form-control" name="codeBarre" placeholder="Ex 3000128651210" maxlength="13">
					  	</div>
					</div>
					
				  <div class="form-group">
				      <label for="libelle">Nom du produit</label>
					  <input type="text" class="form-control" name="libelle" placeholder="Ex courgette" maxlength="100">
			  	  </div>
				
				  <div class="form-group">
					<input type="hidden" name="method" value="add">
					<label for="imageUri">Image url</label>
					<input type="text" class="form-control" name="imageUri" placeholder="Ex www.google.com/courgette.png">
				  </div>
	
				  <div class="form-group">
				  	<label for="prixHT">Prix HT</label>
					<input type="number" class="form-control" step="any" name="prixHT" placeholder="Ex 773.72"><br>
				  </div>
				  
				  <div class="form-group">
				  	<label for="tauxTVA">Taux de TVA</label>
				  	<select class="form-control" name="tauxTVA">
						<option value="0">5.5%</option>
						<option value="1">20.0%</option>
					</select><br>
				  </div>
				  <button type="submit" class="btn btn-dark">Ajouter l'article</button>
				</form>
			</div>
			
			<div class="col-4 offset-md-2" id="modifArticle" style="display: none">
				<h3>Modification de l'article <span aria-hidden="true" onclick="hideEditForm()">&times;</span></h3>
				<form method="post" style="margin-top: 1em" action="Gestion" id="editForm">
					<input type="hidden" name="method" value="edit">
					<input type="hidden" name="index" id="indexModif" value="">
					<div class="form-row">
					    <div class="form-group col-md-6">
						  	<label for="reference">Référence</label>
							<input type="text" class="form-control" id="referenceModif" readonly="readonly">
					    </div>
					    <div class="form-group col-md-6">
							<label for="codeBarre">Code barre</label>
							<input type="text" class="form-control" id="codeBarreModif" name="codeBarreModif" readonly="readonly">
					  	</div>
					</div>
					
					<div class="form-group">
				      	<label for="libelle">Nom du produit</label>
					  	<input type="text" class="form-control" name="libelleModif" id="libelleModif" maxlength="100">
			  	  	</div>
				
				  	<div class="form-group">
						<input type="hidden" name="method" value="add">
						<label for="imageUri">Image url</label>
						<input type="text" class="form-control" name="imageUriModif" id="imageUriModif">
				  	</div>
	
				  	<div class="form-group">
				  		<label for="prixHT">Prix HT</label>
						<input type="number" class="form-control" step="any" name="prixHTModif" id="prixHTModif"><br>
				  	</div>
					
					<div class="form-group">
				  		<label for="tauxTVA">Taux TVA</label>
						<input type="text" class="form-control" id="tvaModif" readonly="readonly"><br>
				  	</div>
				  	
					<button type="submit" id="editFormSubmit" class="btn btn-dark">Modifier l'article</button>
				</form>
			</div>
		</div>
		<%@ include file="/jsp/layout/footer.jsp"%>
	</body>
	
	<script>
		function updateEditForm(id, ref, nom, uri, prix, tva){
			document.getElementById("modifArticle").style.display = "inline";
			document.getElementById("indexModif").value = id;
			document.getElementById("codeBarreModif").value = id;
			document.getElementById("referenceModif").value = ref;
			document.getElementById("libelleModif").value = nom;
			document.getElementById("imageUriModif").value = uri;
			document.getElementById("prixHTModif").value = prix;
			document.getElementById("tvaModif").value = (tva + "%");
			window.scrollTo(0,document.body.scrollHeight);
		}
		
		function hideEditForm(){
			document.getElementById("modifArticle").style.display = "none";
		}
		
	</script>
</html>