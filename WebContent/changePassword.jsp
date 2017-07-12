<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="assets/main.css">
    <title>Смяна на парола</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <!-- <script src="assets/function.js"></script> -->
    <script>
    $(document).ready(function () {
    	$('#button').attr('disabled', true);
        $('input').keyup(function () {
            var empty = false;
            $('input').each(function () {
                if ($(this).val().length == 0) {
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

    </script>
</head>

<body>
	<div class="login-block"> 
        <form action="ChangePasswordServlet">
			
			<input type="password" class="field" placeholder="Стара парола *" name="oldPass" />
            <input type="password" class="field" placeholder="Нова парола *" name="pass" />
            <input type="password" class="field" placeholder="Повтори новата парола *" name="pass2" />
            <button type="submit" id="button">Смяна на парола!</button>
        </form>
	</div>

</body>

</html>