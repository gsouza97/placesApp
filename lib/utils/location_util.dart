import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

const API_KEY =
    'pk.eyJ1IjoiZ3NvdXphOTciLCJhIjoiY2tsaWczNXF5MDg3eDJubzAxNzRnOXZ1MiJ9.Bdq_KtEPOXmJpvRHc6c6Dg';

class LocationUtil {
  static String generateLocationPreviewImage(
      {double latitude, double longitude}) {
    return 'https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/pin-l($longitude,$latitude)/$longitude,$latitude,14.25,0,0/600x300?access_token=$API_KEY';
  }

  static Future<String> getAddressFrom(LatLng position) async {
    final url =
        'https://api.mapbox.com/geocoding/v5/mapbox.places/${position.longitude},${position.latitude}.json?access_token=$API_KEY';
    final response = await http.get(url);
    return json.decode(response.body)['features'][0]['place_name'];
  }
}
