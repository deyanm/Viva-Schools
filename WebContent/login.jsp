<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="assets/main.css">
    <title>Вход</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="assets/function.js"></script>
</head>

<body>
    <div class="login-block">
        <img src="img/logo_login.png" class="viva-logo">
        <form action="LoginServlet">
        
        <input type="text" class="field" placeholder="Потребителско име *" name="username" />
        <input type="password" class="field" placeholder="Парола *" name="pass" />
        <button type="submit" id="button" >Вход</button>
        </form>
        <p>Все още нямате регистрация? <a href="signUp.jsp">Регистрация</a></p>
    </div>

</body>

</html>