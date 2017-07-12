<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="assets/main.css">
    <title>Профил</title>
</head>

<body>
    <div class="login-block" style="width: 400px;">

        <h1 class="profile"><img src="img/active-now.png"> ${name}</h1>
        <h3 class="profile" align="left">Потребителско име:</h3>
        <h3 style="display: inline;"> ${username}</h3>
        <br>
        <h3 class="profile" align="left">Име:</h3>
        <h3 style="display: inline;"> ${name}</h3>
        <br>
        <br>

        <form action="chooseLanguage.jsp" class="profile">
            <input type="submit" style="font-size: 20px;" value="Избор на език">
        </form>

        <form action="changePassword.jsp" class="profile">
            <input type="submit" value="Смяна на парола">
        </form>

        <form action="LogoutServlet" class="profile">
            <input style="background: red; color:#F7CA18" type="submit" value="Изход">
        </form>

    </div>

</body>

</html>
