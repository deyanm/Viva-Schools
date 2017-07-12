<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>

ul.topnav {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #324B88;
}

body {
	margin: 0;
	background-color:#E3EBFF;
	font-family: "Gill Sans", "Gill Sans MT", sans-serif;
	font-style: normal;
	font-size: 20px;
}

img.smile {
	height: auto;
	width: 100%;
	position:relative;
	z-index: 0;
}

img.logo {
	position:absolute;
	width: 40%;
	heigth: auto;
	z-index: 3;
}

div.wrapper{
	float:left; /* important */
	position:relative; /* important(so we can absolutely position the description div */
}

div.description{
	position:absolute; /* absolute position (so we can position it where we want)*/
	left:0px;
	width: 100%;
	bottom:20px;
	/* styling bellow */
	background-color:black;
	color:white;
	opacity:0.6; /* transparency */
	filter:alpha(opacity=60); /* IE transparency */
}
p.description_content{
	padding:10px;
	margin:0px;
	font-size: 30px;
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

  <div class='wrapper'>
  <img class="logo" src="img/logo_banner.png">
  <img class="smile" alt="learn" src="img/smile.jpg" >
  <div class='description'>
		<!-- description content -->
		<p class='description_content'>Viva Schools предлага обучение за всички възрасти</p>
		<!-- end description content -->
	</div>
	</div> 

<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>
    