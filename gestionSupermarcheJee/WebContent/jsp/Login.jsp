<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix= "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<%@ include file="/jsp/layout/head.jsp"%>
	<head>
		<style><%@include file="/jsp/static/Home.css"%></style>
		<script><%@include file="/jsp/static/Script.js"%></script>
	</head>
	<body>
		<%@ include file="/jsp/layout/nav.jsp"%>
		
		<h3 class="col-4 offset-md-1" style="margin-top:2em;">Connexion</h3>
		
		<form class="col-4 offset-md-1" method="Post" action="Login">
		
		  <div class="form-group">
		    <label for="username">Username</label>
   		  	<input type="text" class="validate form-control" id="username" name="login">
   		  	<small id="usernameHelp" class="form-text text-muted">Le username est : admin</small>
		  </div>
		  
		  <div class="form-group">		    
		    <label for="password">Mot de passe</label>
		    <input id="password" type="password" class="validate form-control" name="password">
		    <small id="usernameHelp" class="form-text text-muted">Le password est : password</small>
		  </div>
		  
		  <button type="submit" class="btn btn-dark">Se connecter</button>
		</form>
	</body>
</html>