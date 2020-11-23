<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>createMember Page</title>
</head>
<main role="main" class="flex-shrink-1" style="margin-top: 20px">
  <div class="container">
    <h1 class="mt-5">CreateMember View Page</h1>
    <p class="lead">Please fill out this form.</p>
    <form  class="form-inline mt-2 mt-md-0" action="/member/createMember" method="post" id="createForm">
		<ul style="list-style: none;">
			<li>
				<h3><span class="badge badge-pill badge-light">Account</span></h3>
				<!-- 회원 아이디, 시큐리티 떄문에 username으로 정함 -->
				<input class="form-control mr-sm-2" type="text" name="username" id="username"/>
				<button class="btn btn-outline-success my-2 my-sm-0" type="button" id="btnIDchk">중복검사</button>
			</li>
			<li>
				<h3><span class="badge badge-pill badge-light">Password</span></h3>
				<!-- 회원 비밀번호 -->
				<input class="form-control mr-sm-2" type="password" name="password" id="password"/>
			</li>
			<li>
				<h3><span class="badge badge-pill badge-light">Name</span></h3>
				<!-- 회원 이름 -->
				<input class="form-control mr-sm-2" type="text" name="membername" id="membername"/>
			</li>
			<li>
				<h3><span class="badge badge-pill badge-light">Age</span></h3>
				<!-- 회원 나이 -->
				<input class="form-control mr-sm-2" type="text" name="age" id="age"/>
			</li>
			<li>
				<h3><span class="badge badge-pill badge-light">Address</span></h3>
				<!-- 회원 주소 -->
				<input class="form-control mr-sm-2" type="text" name="address" id="address"/>
				<button class="btn btn-outline-danger my-2 my-sm-0" type="button" id="btnAddr">주소검색</button>
			</li>
			<li>
				<h3><span class="badge badge-pill badge-light">Email</span></h3>
				<!-- 회원 이메일주소 -->
				<input class="form-control mr-sm-2" type="email" name="email" id="email" placeholder="xxx@xxx.com"/>			
			</li>
			<li>
				<input class="btn btn-primary" type="button" id="btndoCreate" value="회원가입">
				<input class="btn btn-dark" type="reset" value="취소">
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