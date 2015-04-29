
# map = null

initialize = ->
  center = new google.maps.LatLng(52.127343, 5.050522)

  options = 
    zoom: 15
    center: center

  $('.main-map').each ->
    map = new google.maps.Map(this, options)
    marker = new google.maps.Marker
      position: center,
      map: map,
      title: 'De Fabrique'

    content = '<p>De Fabrique<br>Westkanaaldijk 7<br>3542 DA Utrecht</p><p>Dichtsbijzijnde treinstation is station Maarssen. Dit is ongeveer <a href="https://www.google.nl/maps/dir/Maarssen,+Maarssenbroek/DeFabrique%C2%AE+Evenementenlocatie,+Westkanaaldijk+7,+3542+DA+Utrecht,+Netherlands/@52.1325121,5.0359618,16z/data=!3m1!4b1!4m14!4m13!1m5!1m1!1s0x47c671d7393183bf:0xddf60d389b27ca9c!2m2!1d5.033152!2d52.135589!1m5!1m1!1s0x47c66e2da3e8e503:0x20858205e3ce9f5d!2m2!1d5.048621!2d52.12893!3e2" target="_blank">1,5 km lopen</a>.';

    infowindow = new google.maps.InfoWindow
      content: content

    google.maps.event.addListener marker, 'click', ->
      infowindow.open map, marker
      return

    return
  return

google.maps.event.addDomListener(window, 'load', initialize);