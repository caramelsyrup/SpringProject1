<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InsertForm</title>
</head>
<body class="d-flex flex-column h-100">
<main role="main" class="flex-shrink-0">
  <div class="container">
    <h1 class="mt-5">Insert Gallery Contents Page</h1>
    <p class="lead"></p>
    	<form class="card p-2" method="post" enctype="multipart/form-data" id="insertForm">
	    	<div class="mb-3">
			   	<label for="arttitle" class="badge badge-danger">Art Title</label>
			    <input type="text" class="form-control" id="arttitle" name="arttitle">
			    <label for="artwriter" class="badge badge-warning">Art Writer</label>
			    <input type="text" class="form-control" id="artwriter" name="artwriter">
			    <label for="artdate" class="badge badge-success">Art Date</label>
			    <input type="text" class="form-control" id="artdate" name="artdate" placeholder="yyy or yyyy">
			    <label for="artfilename" class="badge badge-primary">Art FileName</label>
			    <input type="file" class="form-control" id="uploadFile" name="uploadFile"><!-- 파일업로드부분 -->
			    <button type="button" class="btn btn-outline-success" id="btnUpload" style="margin-top: 20px;">Insert</button>
			    <input type="reset" class="btn btn-outline-secondary" value="Reset" style="margin-top: 20px;">
			    <button type="button" class="btn btn-outline-warning" onclick="history.back()" style="margin-top: 20px;">Back</button>
	  		</div>
  		</form>
    <p>Back to <a href="#">the default sticky footer</a> minus the navbar.</p> 
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