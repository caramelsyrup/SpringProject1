<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.1.1">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Latest compiled JavaScript -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<!-- 최상단 -->
<body class="d-flex flex-column h-100">
    <header>
  <!-- Fixed navbar -->
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark" style="opacity: 0.8;">
    <a class="navbar-brand" href="/">The Gallery</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <a class="nav-link" href="/">Home <!-- <span class="sr-only">(current)</span> --> </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/gallery/list">Gallery</a>
        </li>
        <c:choose>
	        <c:when test="${member.auth==0||member.auth==1}">
	        	<li class="nav-item">
		          <a class="nav-link" href="/events/elist">Events</a>
		        </li>
	        </c:when>
			<c:otherwise>
				<li class="nav-item">
		          <a class="nav-link disabled" href="/events/elist"  aria-disabled="true">Events</a>
		        </li>
			</c:otherwise>
        </c:choose>
        
	    <c:if test="${member.auth==0}">
	     <li class="nav-item">
	      <a class="nav-link" href="/member/memberInfo/${member.username}">Info</a>
	     </li>
	    </c:if>
	    <c:if test="${member.auth==1}">
	     <li class="nav-item">
	      <a class="nav-link" href="/member/allmember">All Member</a>
	     </li>
	     <li class="nav-item">
	      <a class="nav-link disabled" href="/member/allReser"  aria-disabled="true">All Reservation</a>
	     </li>
	    </c:if>  
       
      </ul>
       <c:choose>
       	<c:when test="${empty member.username}">
       		<a class="btn btn-outline-warning my-2 my-sm-0" href="/member/createMember" style="margin-right: 20px">Sign in</a>
      		<a class="btn btn-outline-success my-2 my-sm-0" href="/customLogin" style="margin-right: 20px">Sign up</a>
      	</c:when>
      	<c:otherwise>
        	<a class="btn btn-outline-success my-2 my-sm-0" href="/customLogout">Logout</a>
        </c:otherwise>
       </c:choose>
    </div>
  </nav>
</header>