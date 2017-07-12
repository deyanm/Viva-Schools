<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<link rel="stylesheet" href="assets/main.css">
<title>Регистрация</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<!-- <script src="assets/function.js"></script> -->
<!-- <script>
	$(document).ready(function() {
		$('#button').attr('disabled', true);
		$('input').keyup(function() {
			var fileName = $("#upload-photo").val();
			var empty = false;
			$('input').each(function() {
				if ($(this).val().length == 0 && fileName.length == 0) {
					empty = true;
				}
			});
			if (empty) {
				$('#button').attr('disabled', 'disabled');
			} else {
				$('#button').removeAttr('disabled');
			}
		});
	});
</script> -->
</head>

<body>
	<div class="login-block">
		<img src="img/logo_register.png" class="viva-logo"
			style="width: 100%; height: 100%; margin-left: -2%;">
		<form method="post" action="RegistrationServlet" enctype="multipart/form-data">

			<input type="text" class="field" placeholder="Име и фамилия *"
				name="name" /> <input type="text" class="field"
				placeholder="Потребителско име *" name="username" /> <input
				type="password" class="field" placeholder="Парола *" name="pass" />
			<input type="password" class="field" placeholder="Повтори паролата *"
				name="pass2" /> 
			<input type="email" class="field" placeholder="Имейл *" name="email" /> 
			<label for="upload-photo">Профилна снимка...</label>
			<input type="file" name="photo" id="upload-photo" />

			<button type="submit" id="button">Регистрация</button>
		</form>
		<p>
			Имаш регистрация? <a href="login.jsp">Вход</a>
		</p>
		<p>
			Към началната страница <a href="index.jsp">Начало</a>
		</p>
	</div>

</body>

</html>
