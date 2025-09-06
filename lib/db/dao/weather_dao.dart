
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:weather_app/model/weather_models.dart';
import '../app_database.dart';
import '../table/weather_row.dart';


part 'weather_dao.g.dart';

@DriftAccessor(tables: [WeatherResponses])
class WeatherDao extends DatabaseAccessor<AppDatabase> with _$WeatherDaoMixin {
  WeatherDao(super.db);

  Future<int> insertPlaceEnforcingCurrent(int placeId,WeatherResponse data) {

    final companion = WeatherResponsesCompanion.insert(
      placeId: Value(placeId),
      dt: data.current.dt,
      payloadJson: jsonEncode(data.toJson()),
    );
    //
    return into(weatherResponses).insert(
      companion,
      mode: InsertMode.insertOrReplace, // 命中主键/唯一键则覆盖
    );
  }

  Future<WeatherRow?> getWeatherByPlaceId(int placeId){
    return (select(weatherResponses)..where((tbl) => tbl.placeId.equals(placeId))).getSingleOrNull();
  }

  Stream<WeatherRow?> watchWeatherByPlaceId(int placeId)=>
        (select(weatherResponses)
          ..where((t) => t.placeId.equals(placeId))).watchSingleOrNull();





}