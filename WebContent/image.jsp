<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <jsp:include page = 'partials/commonlink.jsp' flush = "false"/>
</head>
<body>
<div class="cursor" id="cursor"></div>
<jsp:include page = 'partials/nav.jsp' flush = "false"/>
	<form action="/upload" enctype="multipart/form-data" method="post">
		<label for="upload">Upload Image</label>
		<input id="img_upload" name="uploaded_file" type="file">
		<button type="submit">Upload</button>
	</form>
<jsp:include page = 'partials/footer.jsp' flush = "false"/>