<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Google Maps APIs</title>

    <link href="style.css" rel="stylesheet" />
    <style type="text/css">
      html,body {
      height: 100%;
      margin: 0;
      padding: 0;
    }
    #map {
      height: 100%;
    }
    </style>
  </head>

  <body>
    <div id="map">

<script src="script.js"></script>
 <script
  async
  defer
  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC0dA1veZiTkpfneIDt-ikKOCbs9MBqCco&callback=initMap">
 </script>
 <script type="text/javascript">
   var map
function initMap() {

  /*var broadway = {
    info:
      '<strong>pankaj kumar</strong><br>\
      Sector 15, Noida, Uttar Pradesh<br>\
      <a href="https://goo.gl/maps/jKNEDz4SyyH2">Get Directions</a>',
    lat: 41.976816,
    long: -87.659916,
  }*/
var broadway0= { info: '<strong>Nicholas Lindman Port,<\/strong><br>\u00a0Indiana University,Bloomington,Bloomington,IN United States\u00a0<br>',lat: 39.1691002,long: -86.5197898} 

 
  var locations = [
    [broadway0.info, broadway0.lat, broadway0.long, 0],
   
    
  ]

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 16,
    center: new google.maps.LatLng(39.1691002, -86.5197898),
    mapTypeId: google.maps.MapTypeId.ROADMAP,

  })
var data="Pankaj Gupta";
  var infowindow = new google.maps.InfoWindow({
    content: data
  })

  var marker, i

  for (i = 0; i < locations.length; i++) {
    //alert(locations[i][1]); exit;
    marker = new google.maps.Marker({
      position: new google.maps.LatLng(locations[i][1], locations[i][2]),
      map: map,
    })
infowindow.open(map, marker);
    google.maps.event.addListener(marker,'mouseover',(function(marker, i) {return function() {
          infowindow.setContent(locations[i][0])
          infowindow.open(map, marker)
          var pos = map.getZoom();
          map.setZoom(19);
          map.setCenter(marker.getPosition());
          window.setTimeout(function() {map.setZoom(pos);},3000);

        }
      })(marker, i)
    )
  }
}

 </script>