<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix= "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<%@ include file="/jsp/layout/head.jsp"%>
	<body>
		<%@ include file="/jsp/layout/nav.jsp"%>
		<table>
		
			<div class="row" style="margin-top:2em;">
		
				<c:forEach items="${supermarche.articles}" var="article">
				
	                    <div class="col s3">
	                        <div class="card small">	                        
	                            <div class="card-image">
	                            	<img src="${article.value.imageUri}"/>
	                            </div>
	                            <div class="card-content">
	                                <span class="text-black"><c:out value="${article.value.libelle}" /></span>
	                            </div>
	                            <div class="card-action">
		                            <span style="color:#ffab40;">
		                            	<fmt:formatNumber value="${article.value.prixTTC / 100}" pattern=".00"/> EUR
		                            	<form action="Panier" method="post">
			                            	<input type="hidden" name="method" value="add">
			                            	<input type="hidden" name="article" value="${article.value.codeBarre }">
			                            	<input type="submit" value="Ajouter au panier">
			                          	</form>
		                            </span>
	                            </div>
	                        </div>
	                    </div>
					        
				</c:forEach>
				
			</div>

		</table>
	</body>
</html>