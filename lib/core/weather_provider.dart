
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:weather_app/core/utils.dart';
import 'package:weather_app/core/weather_api.dart';
import 'package:weather_app/db/dao/weather_dao.dart';
import 'package:weather_app/model/weather_models.dart';

import '../db/app_database.dart';
class WeatherProvider{

  final WeatherDao weatherDao;
  WeatherProvider(this.weatherDao);

  //final WeatherService _weatherService = WeatherService();


  WeatherResponse convertJsonToWeatherResponse(String json) {
     final map = jsonDecode(json) as Map<String, dynamic>;
     return WeatherResponse.fromJson(map);
  }


  Future<void> loadCurrentWeatherData(Place place,{String lang = 'en'}) async {


    Future<void> requestCurrentWeatherData() async {
      final result = await WeatherService.fetchCurrentWeather(place.lat, place.lon,lang: lang);
      weatherDao.insertPlaceEnforcingCurrent(place.id,result);
    }

    try {
      final weatherData = await weatherDao.getWeatherByPlaceId(place.id);
      if(weatherData!=null){
        if(isOverHalfHours(weatherData.dt)){
          requestCurrentWeatherData();
        }
      }else{
        requestCurrentWeatherData();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

  }
}