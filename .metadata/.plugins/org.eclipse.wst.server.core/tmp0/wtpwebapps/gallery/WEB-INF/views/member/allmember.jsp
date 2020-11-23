<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberInfo</title>
</head>
<body>
<!-- Begin page content -->
<main role="main" class="flex-shrink-0">
<section class="jumbotron text-center" style="background-color: #D2FFD2">
     <div class="container">
     	 <h1 class="mt-5">All Members Info View Page</h1>
     	 <p class="lead">Only Administer.</p>
	 </div>
</section>
  <div class="container" >
		<table class="table">
		  <thead class="thead-dark">
		    <tr>
		      <th scope="col">Account</th>
		      <th scope="col">Name</th>
		      <th scope="col">Age</th>
		      <th scope="col">Address</th>
		      <th scope="col">Email</th>
		      <th scope="col">RegDate</th>
		      <th scope="col">Delete</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach items="${alist}" var="a">
			    <tr>
			      <th scope="row">${a.username}</th>
			      <td>${a.membername}</td>
			      <td>${a.age}</td>
			      <td>${a.address}</td>
			      <td>${a.email}</td>
			      <td>${a.regdate}</td>
			      <td><a href="javascript:void(0)" onclick="delmember('${a.username}')"><span class="badge-pill badge-warning">Delete</span></a></td>
			    </tr>
		    </c:forEach>
		  </tbody>
		</table>
	<input class="btn btn-dark" type="button" value="back" onclick="history.back()">
   <p>Back to <a href="/">Home</a></p>   
  </div>
  
</main>
<script src="/resources/js/member.js"></script>
<footer class="footer mt-auto py-3">
  <div class="container">
    <span class="text-muted">Place sticky footer content here.</span>
  </div>
</footer>
</body>
</html>