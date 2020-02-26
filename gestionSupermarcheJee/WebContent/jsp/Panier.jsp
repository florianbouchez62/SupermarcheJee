<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix= "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<%@ include file="/jsp/layout/head.jsp"%>
	<body>
		<%@ include file="/jsp/layout/nav.jsp"%>
		
		<div class="row">
			<div class="col s10">									
				<table>
					  <thead>
					    <tr>
					        <th>Libelle</th>
					        <th>Référence</th>
					        <th>Prix HT</th>
					        <th>Prix TTC</th>
					        <th>Taux TVA</th>
					    </tr>
					  </thead>
				
					 <tbody>
					  	<c:forEach items="${panier}" var="article">
						    <tr>
						      <td><c:out value="${article.libelle}" /></td>
						      <td><c:out value="${article.reference}" /></td>
						      <td><fmt:formatNumber value="${article.prixHT / 100}" pattern=".00"/> EUR</td>
						      <td><fmt:formatNumber value="${article.prixTTC / 100}" pattern=".00"/> EUR</td>
						      <td><fmt:formatNumber value="${article.tauxTVA / 100}" pattern=".00"/> %</td>
						    </tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
	</body>
</html>