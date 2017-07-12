<%@page import="examplePackage.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="assets/main.css">
<title>Успешно избран език и център!</title>
</head>
<body>

	<div class="success">
		<h1>
			Поздравления! <br>Вие успешно избрахте език и център за обучение!
		</h1>
		<p>Свържете се с центъра, за да запишете часове!</p>
	</div>
	
	<p>
		<a href="profile_.jsp">Профил</a>
	</p>
	
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>