import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/geocoding_model.dart';
import '../model/weather_models.dart';

class WeatherService {
  static const String apiKey = "d60b47b603250398b604e44c35be1f02";

  Future<WeatherResponse> fetchCurrentWeather(
    double lat,
    double lon, {
    String lang = 'en',
  }) async {
    // 定义参数
    final params = {
      'lat': lat.toString(),
      'lon': lon.toString(),
      'appid': apiKey,
      'units': 'metric',
      'lang': lang,
    };

    // 构建 Uri
    final uri = Uri.https(
      'api.openweathermap.org', // 域名
      '/data/3.0/onecall', // 路径
      params, // 查询参数
    );
    // 发起 GET 请求
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return WeatherResponse.fromJson(data);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<PlaceResponse> reverseGeocoding(double lat, double lon) async {
    // 定义参数
    final params = {
      'lat': lat.toString(),
      'lon': lon.toString(),
      'appid': apiKey,
      'limit': '1',
    };

    // 构建 Uri
    final uri = Uri.https(
      'api.openweathermap.org', // 域名
      '/geo/1.0/reverse', // 路径
      params, // 查询参数
    );
    // 发起 GET 请求
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final places = jsonData.map((e) => PlaceResponse.fromJson(e)).toList();
      return places[0];
    } else {
      throw Exception('Failed to reverse Geocoding');
    }
  }
}
