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
  <div class="container" >
    <h1 class="mt-5">MemberInfo View Page</h1>
    <p class="lead">Please fill out this form.</p>
    <form  class="form-inline mt-2 mt-md-0" action="/member/doupdate" method="post" id="updateForm">
		<ul style="list-style: none;">
			<li>
				<h2><span class="badge badge-pill badge-warning" style="width: 300px">${member.username}</span></h2>
				<input type="hidden" name="username" id="username" value="${member.username}">
			</li>
			<li>
				<h3><span class="badge badge-pill badge-light">Password</span></h3>
				<!-- 회원 비밀번호 -->
				<input class="form-control mr-sm-2" type="password" name="password" id="password" value="${member.password}"/>
			</li>
			<li>
				<h3><span class="badge badge-pill badge-light">Name</span></h3>
				<!-- 회원 이름 -->
				<input class="form-control mr-sm-2" type="text" name="membername" id="membername" value="${member.membername}"/>
			</li>
			<li>
				<h3><span class="badge badge-pill badge-light">Age</span></h3>
				<!-- 회원 나이 -->
				<input class="form-control mr-sm-2" type="text" name="age" id="age" value="${member.age}"/>
			</li>
			<li>
				<h3><span class="badge badge-pill badge-light">Address</span></h3>
				<!-- 회원 주소 -->
				<input type="text" class="form-control" name="address" id="address" style="width: 150%; margin-bottom: 10px;" value="${member.address}">	
				<button class="btn btn-outline-danger my-2 my-sm-0" type="button" id="btnAddr">주소검색</button>
			</li>
			<li>
				<h3><span class="badge badge-pill badge-light">Email</span></h3>
				<!-- 회원 이메일주소 -->
				<input class="form-control mr-sm-2" type="email" name="email" id="email" placeholder="xxx@xxx.com" value="${member.email}"/>			
			</li>
			<li><br></li>
			<li>
				<input class="btn btn-primary" type="button" id="btndoUpdate" value="Update">
				<input class="btn btn-danger" type="button" id="btndoDelete" value="Delete">
				<input class="btn btn-dark" type="button" value="back" onclick="history.back()">
			</li>		
		</ul>
	</form>
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