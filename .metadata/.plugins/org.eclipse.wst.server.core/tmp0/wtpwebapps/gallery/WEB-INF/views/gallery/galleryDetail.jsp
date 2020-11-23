<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PictureView</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Latest compiled JavaScript -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body class="d-flex flex-column h-100">
	<main role="main">
	 <div class="row featurette" style="margin: 10px;">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading"><span class="text-muted">${pic.arttitle}</span></h2>
        <p class="lead">
        	<input type="hidden" value="${pic.gnum}" id="gnum" name="gnum">
        	<hr class="featurette-divider">
        	You can write the description for this picture.
        	<hr class="featurette-divider">
        <p>
         <c:if test="${member.auth==1}">
		 	<button type="button" id="btnUpdatePic" class="btn btn-outline-warning">Go update</button>
		 	<button type="button" id="btnDeletePic" class="btn btn-outline-danger">Go Delete</button>
		 </c:if>
			<button type="button" class="btn btn-outline-dark" onclick="self.close()">Close</button>
        </p>
      </div>
      <div class="col-md-5 order-md-1">
      	<figure class="figure">
      		<img src="/resources/img/${pic.artfilename}" class="figure-img img-fluid rounded" alt="${pic.artdate}" width="500" height="500">
  			<figcaption class="figure-caption text-right">${pic.artwriter} at ${pic.artdate}</figcaption>
		</figure>
      	
      </div>
    </div>
    <hr class="featurette-divider">
   </main>
<script src="/resources/js/gallery.js"></script>

<footer class="footer mt-auto py-3">
  <div class="container">
    <span class="text-muted">Place sticky footer content here.</span>
  </div>
</footer>
</body>
</html>