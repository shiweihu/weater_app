



import 'package:weather_app/core/weather_api.dart';
import 'package:weather_app/model/geocoding_model.dart';

class GeocodingProvider{
  final WeatherService _weatherService = WeatherService();

  Future<PlaceResponse?> loadGeocoding(double lat,double lon) async {
    try {
      return await _weatherService.reverseGeocoding(lat, lon);
    } catch (e) {
      return null;
    }
  }
}