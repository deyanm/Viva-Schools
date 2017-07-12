<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
body {margin: 0;
background-color:#E3EBFF;
}

ul.topnav {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #324B88;
}

body {
	font-family: "Gill Sans", "Gill Sans MT", sans-serif;
	font-style: normal;
	font-size: 20px;
}

img.style {
	height: auto;
	width: 40%;
	max-width: 100%;
}

ul.topnav li {float: left;
background-color: #324B88;
}

ul.topnav li a {
    display: block;
    color: #FF495C;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    font-size: 23px;
}

ul.topnav li a:hover:not(.active) {background-color: #a8cff3;}

ul.topnav li a.active {background-color: #547FAA;}

ul.topnav li.right {float: right;}

@media screen and (max-width: 600px){
    ul.topnav li.right, 
    ul.topnav li {float: none;}
}

.divStyle {
  max-width: 640px;
  width: 100%;
  padding: 0 16px;
}

.divStyle h1 {
  margin-top: 0;
}
</style>

</head>
<body>

<ul class="topnav">
    <li><a href="index.jsp">Начало</a></li>
  <li><a href="learningTypes.jsp">Типове на обучение</a></li>
  <li><a href="contacts.jsp">Контакти</a></li>
  <li><a href="learningCenters.jsp">Учебни центрове</a></li>
  <li class="right"><a href="signUp.jsp">Регистрация</a></li>
  <li class="right"><a href="aboutUs.jsp">За нас</a></li>
  <li class="right"><a href="login.jsp">Вход</a></li>
</ul>

<div class="divStyle">
   <h3>За връзка с нашата фирма:</h3>
	<p>* 0899187589- Георги Стефанов</p>
	<p>* 0988931791- Деян Маринов</p>

	<h3>Централен офис- град Правец:</h3>
	<p>Адрес: ул. Перуша №4</p>
	
</div>

<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>