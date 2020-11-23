<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/includes/header.jsp" %>
<title>로그인화면</title>
</head>
<main role="main" class="flex-shrink-1" style="margin-top: 20px">
  <div class="container" align="center">
    <h1 class="mt-5">Login View Page</h1>
    <p class="lead">Please fill out this form.</p>
    <form class="form-inline mt-2 mt-md-0">
    	<ul style="list-style: none; margin-left: auto; margin-right: auto;">
    		<li>
    			<h3><span class="badge badge-pill badge-light">Account</span></h3>
        		<input class="form-control mr-sm-2" type="text" placeholder="Account" aria-label="Search" name="username" id="username">
    		</li>
    		<li>
    			<h3><span class="badge badge-pill badge-light">Password</span></h3>
	    		<input class="form-control mr-sm-2" type="password" placeholder="Password" aria-label="Search" name="password" id="password">
    		</li>
    		<li style="margin-top: 10px; margin-bottom: 10px;">
    			<input class="btn btn-outline-success my-2 my-sm-0" type="button" id="btnLogin" value="Login" style="width: 200px; height: 50px;">
    		</li>
    		<li><input class="btn btn-outline-dark my-2 my-sm-0" type="reset" value="Reset" style="width: 200px; height: 50px;" ></li>
    	</ul>
      </form>
   <p>Back to <a href="/">Home</a></p>   
  </div>
  <hr class="featurette-divider">
</main>
<script type="text/javascript" src="/resources/js/login.js"></script>
<footer class="footer mt-auto py-3">
  <div class="container">
    <span class="text-muted">Place sticky footer content here.</span>
  </div>
</footer>
</body>
</html>