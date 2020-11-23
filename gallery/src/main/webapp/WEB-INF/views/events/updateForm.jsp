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
    <h1 class="mt-5">Update Event Contents Page</h1>
    <p class="lead"></p>
    	<form class="card p-2" method="post" enctype="multipart/form-data" id="eUpdateForm">
	    	<div class="mb-3">
	    		<input type="hidden" id="ecode" name="ecode" value="${event.ecode}" >
			   	<label for="ename" class="badge badge-danger">Event Title</label>
			    	<input type="text" class="form-control" id="uename" name="ename" value="${event.ename}">
			    <label for="ehost" class="badge badge-warning">Event Host</label>
			    	<input type="text" class="form-control" id="uehost" name="ehost" value="${event.ehost}">
			    <label for="estartD" class="badge badge-success">Event StartingDate</label>
			    	<input type="text" class="form-control" id="uestartD" name="estartD" value="${event.estartD}">
			    <label for="eendD" class="badge badge-success">Event EndingDate</label>
			    	<input type="text" class="form-control" id="ueendD" name="eendD" value="${event.eendD}">
			    <label for="eloca" class="badge badge-success">Event Location</label>
			    	<input type="text" class="form-control" id="ueloca" name="eloca" value="${event.eloca}">
			    <label for="edesc" class="badge badge-success">Event Description</label>
			    	<input type="text" class="form-control" id="uedesc" name="edesc" value="${event.edesc}">
			    <label for="uploadFile" class="badge badge-primary">Event FileName</label>
			    	<input type="file" class="form-control" id="uuploadFile" name="uploadFile"><!-- 파일업로드부분 -->
			    <button type="button" class="btn btn-outline-success" id="btnDoUpdate" style="margin-top: 20px;">Update</button>
			    <button type="button" class="btn btn-outline-danger" onclick="self.close()" style="margin-top: 20px;">Close</button>
	  		</div>
  		</form>
    <p>Back to <a href="#">the default sticky footer</a> minus the navbar.</p> 
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