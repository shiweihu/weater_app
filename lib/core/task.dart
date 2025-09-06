
import 'package:flutter/foundation.dart';
import 'package:weather_app/core/utils.dart';
import 'package:weather_app/core/weather_api.dart';

import '../db/app_database.dart';





Future<bool> syncWeatherForLocations(AppDatabase appDatabase) async {


   Future<void> updateWeather(Place place) async {
      final weatherData = await WeatherService.fetchCurrentWeather(place.lat, place.lon);
      await appDatabase.weatherDao.insertPlaceEnforcingCurrent(place.id, weatherData);
   }

   try{
      final list = await appDatabase.placesDao.getAllPlaces();
      for (var place in list) {
         final weatherRow = await appDatabase.weatherDao.getWeatherByPlaceId(place.id);
         if(weatherRow != null){
            if(isOverHalfHours(weatherRow.dt)){
               updateWeather(place);
            }
         }else{
            updateWeather(place);
         }
      }
      return Future.value(true);
   }on Exception catch (_, e){
      if (kDebugMode) {
        print(e.toString());
      }
      return Future.value(false);
   }
}