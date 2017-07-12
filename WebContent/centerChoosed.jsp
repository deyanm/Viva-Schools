<%@page import="examplePackage.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="assets/main.css">
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCBAXbJMFOh-YI2DYnVhHJ18xPNRD3LO3A&callback=getLocation" type="text/javascript"></script>
<title>Успешно избран център</title>
</head>
<body>
<center><h2></h2>
	</center>
	
	<div class="success">
		<h1>
			Вие сте успешно записан! <br> За обучение в център - ${center}
		</h1>
	</div>
	<p>
		<a href="profile_.jsp">Профил</a>
	</p>
	
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>