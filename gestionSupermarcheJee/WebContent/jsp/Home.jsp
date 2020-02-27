<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix= "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<%@ include file="/jsp/layout/head.jsp"%>
	<%@ include file="/jsp/layout/nav.jsp"%>
	<head>
		<style><%@include file="/jsp/static/Home.css"%></style>
		<script><%@include file="/jsp/static/Script.js"%></script>
	</head>
	<body>

		<div id="carousel" class="carousel slide" data-ride="carousel" data-interval="3500">
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		    	<img src="https://images.unsplash.com/photo-1493787039806-2edcbe808750?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80" class="d-block w-100">
		    </div>
		    <div class="carousel-item">
		      <img src="https://cdn.hipwallpaper.com/i/30/10/yDKwlN.jpg" class="d-block w-100">
		    </div>
		    <div class="carousel-item">
		      <img src="https://i.pinimg.com/originals/33/ee/96/33ee96c7f97c1737dcb8c01370ea84bf.jpg" class="d-block w-100">
		    </div>
		    <div class="carousel-item">
		      <img src="https://cdn.wallpapersafari.com/35/88/OswbGy.jpg" class="d-block w-100">
		    </div>
		    <div class="carousel-item">
		    	<img src="https://cdn.wallpapersafari.com/41/91/ShciPy.jpg" class="d-block w-100">
		    </div>
		  </div>
		</div>
		
		
		<div class="product-grid product-grid--flexbox">
			<div class="product-grid__wrapper">	
			
				<c:forEach items="${supermarche.articles}" var="article">
					<div class="product-grid__product-wrapper">
						<div class="product-grid__product">
							<div class="product-grid__img-wrapper">			
								<img src="${article.value.imageUri}" alt="Img" class="product-grid__img" />
							</div>
							<span class="product-grid__title"><c:out value="${article.value.libelle}" /></span>				
							<span class="product-grid__price"><fmt:formatNumber value="${article.value.prixTTC / 100}" pattern=".00"/> EUR</span>
							<form action="Panier" method="post">
		                     	<input type="hidden" name="method" value="add">
		                     	<input type="hidden" name="article" value="${article.value.codeBarre }">
		                     	<button type="submit" class="btn btn-dark btn-sm">Ajouter <i class="fas fa-shopping-basket"></i></button>
		                   	</form>
						</div>
					</div>
				</c:forEach>
		
			</div>
		</div>
		<%@ include file="/jsp/layout/footer.jsp"%>		
	</body>
</html>