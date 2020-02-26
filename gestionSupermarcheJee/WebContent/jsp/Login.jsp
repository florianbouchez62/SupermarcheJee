<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix= "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<%@ include file="/jsp/layout/head.jsp"%>
	<body>
		<%@ include file="/jsp/layout/nav.jsp"%>
		<div class="row" style="padding: 1em">
			<h4>Connexion</h4>
			<form method="post" action="Login">
				<div class="row">
			        <div class="input-field col s12">
			          <input type="text" class="validate" name="login">
			          <label for="disabled">Nom d'utilisateur</label>
			        </div>
			      </div>
			      <div class="row">
			        <div class="input-field col s12">
			          <input id="password" type="password" class="validate" name="password">
			          <label for="password">Mot de passe</label>
			        </div>
			      </div>
				<button class="btn waves-effect waves-light" type="submit" name="action">Se connecter
				    <i class="material-icons right">send</i>
				</button>
			</form>
		</div>
	</body>
</html>