<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="assets/main.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCBAXbJMFOh-YI2DYnVhHJ18xPNRD3LO3A&callback=getLocation" type="text/javascript"></script>
<title>Избор на език</title>
</head>
<body>

<script type="text/javascript">
function checkboxlimit(checkgroup, limit){
    for (var i=0; i<checkgroup.length; i++){
        checkgroup[i].onclick=function(){
        var checkedcount=0
        for (var i=0; i<checkgroup.length; i++)
            checkedcount+=(checkgroup[i].checked)? 1 : 0
        if (checkedcount>limit){
            alert("You can check a maximum of "+limit+" boxes.")
            this.checked=false
            }
        }
    }
}

checkboxlimit(document.forms.checkform['language'], 1)
</script>

<form id="checkform" name="language" action="LanguageServlet">
<div id="buttons">
<div class="linkedin button">
	<img class="flag" src="https://lipis.github.io/flag-icon-css/flags/1x1/gb.svg">
	<div class="social-container tw">
		<div class="slide">
			<input type="checkbox" name="language" value="Варна">Избери Варна
		</div>
		 Английски
	</div>
</div>
<div class="facebook button">
	<img class="flag" src="https://lipis.github.io/flag-icon-css/flags/1x1/de.svg">
	<div class="social-container fb">
		<div class="slide">
     <input type="checkbox" name="language" value="Немски">Избери Немски
		</div>
		 Немски
	</div>
</div>
<div class="twitter button">
	<img class="flag" src="https://lipis.github.io/flag-icon-css/flags/1x1/es.svg">
	<div class="social-container tw">
		<div class="slide">
		<input type="checkbox" name="language" value="Испански">Избери Испански
		</div>
		 Испански
	</div>
</div>
<div class="google button">
	<img class="flag" src="https://lipis.github.io/flag-icon-css/flags/1x1/it.svg">
	<div class="social-container tw">
		<div class="slide">
			<input type="checkbox" name="language" value="Италиански">Избери Италиански
			<div class="g-plusone">
			</div>
		</div>
		 Италиански
	</div>
</div>
<div class="facebook button">
	<img class="flag" src="https://lipis.github.io/flag-icon-css/flags/1x1/fr.svg">
	<div class="social-container tw">
		<div class="slide">
			<input type="checkbox" name="language" value="Френски">Избери Френски
		</div>
		 Френски
	</div>
</div>
</div>
	
	<div id="map"></div>

    <style>
        #map {
            width: 800px;
            height: 500px;
            position: relative;
            margin: 0 auto;
            border: 3px solid #f44336;
        }

    </style>
    <script type="text/javascript">
        var myLatLng;
        var latit;
        var longit;

        var locations = [
            ['<h2 style="color:#324B88;">Viva Schools - Варна</h2>' + 'Нашата школа във Варна предлага голям избор от езици и </br>  групи в които да се включите. Материалната ни база е обширна и включва: <ul><li>ел. дъска </li><li>компютри във всяка от залите</li><li> голям аквариум на входа!</li></ul><input type="checkbox" name="center" value="Варна">Избери Варна', 43.215242, 27.906626, 1],
            ['<h2 style="color:#324B88;">Viva Schools - Бургас</h2>' + 'Нашата школа във Бургас предлага голям избор от езици </br>и групи в които да се включите. Материалната ни база е обширна и включва: <ul><li>ел. дъска </li><li>компютри във всяка от залите</li></ul><input type="checkbox" name="center" value="Бургас">Избери Бургас', 42.521958, 27.455579, 2],
            ['<h2 style="color:#324B88;">Viva Schools - София</h2>' + 'Нашата школа във София предлага голям избор от езици </br>и групи в които да се включите. Материалната ни база е обширна и включва: <ul><li>ел. дъска </li><li>компютри във всяка от залите</li></ul><input type="checkbox" name="center" value="София">Избери София', 42.697493, 23.324846, 3],
            ['<h2 style="color:#324B88;">Viva Schools - Пловдив</h2>' + 'Нашата школа във Пловдив предлага голям избор от езици </br>и групи в които да се включите. Материалната ни база е обширна и включва: <ul><li>ел. дъска </li><li>компютри във всяка от залите</li></ul><input type="checkbox" name="center" value="Пловдив">Избери Пловдив', 42.147996, 24.751063, 4],
            ['<h2 style="color:#324B88;">Viva Schools - Плевен</h2>' + 'Нашата школа във Плевен предлага голям избор от езици </br>и групи в които да се включите. Материалната ни база е обширна и включва: <ul><li>ел. дъска </li><li>компютри във всяка от залите</li><li>Имате хубава гледка към Панорамата.</li></ul><input type="checkbox" name="center" value="Плевен">Избери Плевен', 43.412244, 24.621114, 5],
            ['<h2 style="color:#324B88;">Viva Schools - Велико Търново</h2>' + 'Нашата школа във В. Търново предлага голям избор от езици и групи в които да се включите.</br> С хубав изглед към крепостта Царевец. </br>Материалната ни база е обширна и включва: <ul><li>ел. дъска </li><li>компютри във всяка от залите</li></ul><input type="checkbox" name="center" value="Велико Търново">Избери Велико Търново', 43.082261, 25.632392, 5]
        ];

        var image = "img/marker.png"

        var map = new google.maps.Map(document.getElementById('map'), {
            draggable: true,
            zoomControl: false,
            scrollwheel: false,
            disableDoubleClickZoom: true,
            streetViewControl: false,
            zoom: 7,
            center: new google.maps.LatLng(42.7339, 25.4858),
            mapTypeId: google.maps.MapTypeId.ROADMAP
        });

        var infowindow = new google.maps.InfoWindow();

        var marker, i;

        for (i = 0; i < locations.length; i++) {
            marker = new google.maps.Marker({
                position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                map: map,
                icon: image
            });

            google.maps.event.addListener(marker, 'click', (function(marker, i) {
                return function() {
                    infowindow.setContent(locations[i][0]);
                    infowindow.open(map, marker);
                }
            })(marker, i));

        }

        function geoError() {
            alert("Geocoder failed.");
        }

        function getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(geoSuccess, geoError);
                // alert("Geolocation is supported by this browser.");
            } else {
                alert("Geolocation is not supported by this browser.");
            }
        }

    </script>
    <div class="login-block">
    <button formaction="LanguageServlet" type="submit">Напред</button>
    </div>
   </form>
   
</body>
</html>