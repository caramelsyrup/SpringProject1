<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<%@ include file="/resources/includes/header.jsp" %>
<html>
<head>
	<title>Home</title>
</head>
<!-- jumbotron -->
<div class="jumbotron" style="background-color:#f9d400;">
  <h1 class="display-2 font-italic">Welcome Gallery!</h1>
  <c:choose>
  	<c:when test="${empty member.username}">
  		<p class="lead">This is simple gallery.</p>
  	</c:when>
  	 <c:otherwise>
  	 	<c:if test="${member.auth==0}">
  	 		<h5 class="display-5 font-italic"><span class="badge badge-pill badge-dark">Greeting! ${member.username}</span></h5>
  	 	</c:if>
   		<c:if test="${member.auth==1}">
  	 		<p class="lead"></p>
  	 		<h5 class="display-5 font-italic"><span class="badge badge-pill badge-dark">Greeting! Administer</span></h5>
  	 	</c:if>
  	</c:otherwise>
  </c:choose>   
  <hr class="my-4">
  <p class="lead my-3"><i>The time on the server is ${serverTime}</i></p>
  <button class="btn btn-outline-dark btn-lg" id="btnHomeinfo" type="button">Info</button>
  <button class="btn btn-outline-dark btn-lg" id="btnHomeinfo" type="button">Info</button>
  <button class="btn btn-outline-dark btn-lg" id="btnHomeinfo" type="button">Info</button>
</div>
<main role="main">
<!-- carousel -->
<div id="carouselExampleControls" class="carousel slide" data-ride="carousel" data-interval="2000">
  <div class="carousel-inner">
    <div class="carousel-item active" align="center">
      <img src="/resources/img/philadelphia-5149807_1280.jpg" class="img-thumbnail" style="height:400px; width: 65%; " alt="home">
    </div>
    <c:forEach items="${glist}" var="gd">
	    <div class="carousel-item" align="center">
	      <img src="/resources/img/${gd.artfilename}" class="img-thumbnail" style="height:400px; width: 65%; " alt="first">
	    </div>
    </c:forEach>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<hr class="featurette-divider">
</main>
<!-- footer -->
<footer class="footer mt-auto py-3">
  <div class="container">
    <span class="text-muted">Place sticky footer content here.</span>
  </div>
</footer>
</body>
</html>