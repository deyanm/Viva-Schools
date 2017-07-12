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
