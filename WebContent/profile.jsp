<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
body {margin: 0;}

ul.topnav {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #324B88;
}

body {
	font-family: "Gill Sans";
	font-style: normal;
	font-size: 20px;
}

ul.topnav li {float: left;}

ul.topnav li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

ul.topnav li a:hover:not(.active) {background-color: #547FCB;}

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
  <li><a href="index.jsp">Home</a></li>
  <li><a href="learningTypes.jsp">Learning Types</a></li>
  <li><a href="#contact">Contacts</a></li>
  <li><a href="#centers">Learning Centers</a></li>
  <li class="right"><a href="loginView.jsp">Sign-Up</a></li>
  <li class="right"><a href="aboutUs.jsp">About us</a></li>
</ul>

<div style="padding:0 16px;">
  <p>Добре дошли!</p>
</div>
<footer>Viva Schools &copy; 2017</footer>
</body>
</html>
    