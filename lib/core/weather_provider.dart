
import 'package:flutter/foundation.dart';
import 'package:weather_app/core/weather_api.dart';
import 'package:weather_app/model/weather_models.dart';
class WeatherProvider extends ChangeNotifier{
  final WeatherService _weatherService = WeatherService();
  bool _loading = false;
  WeatherResponse? _currentWeatherData;
  bool get loading => _loading;
  WeatherResponse? get currentWeatherData => _currentWeatherData;

  Future<void> loadCurrentWeatherData(double lat,double lon,{
    String lang = 'en',
  }) async {
    _loading = true;
    notifyListeners();

    try {
      final result = await _weatherService.fetchCurrentWeather(lat, lon,lang: lang);
      _currentWeatherData = result;
    } catch (e) {
      _currentWeatherData = null;
    }
    _loading = false;
    notifyListeners();
  }
}