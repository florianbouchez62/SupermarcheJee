<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarText">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="Home">
        	<img src="Images/logo.png" style="width:30px;"/>
        		Home <span class="sr-only">(current)</span>
        </a>
      </li>
    </ul>
    <c:if test="${loggedAs != null}">
    	<a href="Logout" class="nav-link deconnexion">Déconnexion</a>
    	<a href="Gestion" class="nav-link gestion"><i class="fas fa-cog"></i></a>
    </c:if>
    <c:if test="${loggedAs == null}">
    	<a href="Login" class="nav-link connexion">Connexion</a>
    </c:if>
    
    
    <a href="Panier" class="nav-link panier">
	    <c:if test="${panier != null && panier.size() > 0}">
	    	${panier.size()}
	    </c:if>	
    	<i class="fas fa-shopping-basket"></i>
    </a>
  </div>
</nav>