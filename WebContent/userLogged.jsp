<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Успешно влизане</title>
</head>
<body>
	
	<form action = "profile_.jsp">
		<input align  = "left" type = "submit" value = "Информация за профила">
	</form>
	<br>

	<form action = "chooseLanguage.jsp">
		<input align  = "left" type = "submit" value = "Избор на език">
	</form>
	<br>
	
	<form action = "LogoutServlet">
		<input align  = "right" type = "submit" value = "Изход">
	</form>
	
<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>