<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EventList</title>
<style>
     #goTop {
       position: fixed;
       right: 1%;
       bottom: 50px;
       display: none;
     }
</style>
</head>
<body>
 <main role="main">
 <section class="jumbotron text-center" style="background-color: #ECC5C0">
     <div class="container">
      <h1 class="mt-5">Event View</h1>
      <p class="lead text-muted">Look for Event</p>
      <p>
        <c:if test="${member.auth==1}">
    		<button type="button" id="btnEventInsertForm" class="btn btn-outline-dark btn-lg">Insert</button><br>
    	</c:if>
  		<c:if test="${member.auth==0}">
  			<input type="hidden" value="${member.username}" name="username" id="username">
  			<button id="btnDetalRev" class="btn btn-outline-dark">Check your Reservation</button>
  		</c:if>
        <button id="goTop" class="btn btn-outline-primary" >Top</button>
      </p>
   </div>
  </section>
  <hr class="featurette-divider">
   <div class="album py-5 bg-light" id="album">
    <div class="container">
      <div class="row" id="row">
      
      </div>
    </div>
  </div>
  <hr class="featurette-divider">
 </main>
<script src="/resources/js/events.js"></script>
<footer class="footer mt-auto py-3">
  <div class="container">
    <span class="text-muted">Place sticky footer content here.</span>
  </div>
</footer>
</body>
</html>