// weather_tables.dart
import 'package:drift/drift.dart';
import 'package:weather_app/db/table/places.dart';


@DataClassName('WeatherRow')
class WeatherResponses extends Table {
  //IntColumn get id => integer().autoIncrement()();

  // 外键 -> Places.id
  IntColumn get placeId => integer().references(
    Places,
    #id,
    onUpdate: KeyAction.cascade,
    onDelete: KeyAction.cascade,
  )();

  // 整个 WeatherResponse 的 JSON 串
  TextColumn get payloadJson => text()();

  IntColumn get dt =>integer()();

  // ✅ placeId 同时作为主键
  @override
  Set<Column> get primaryKey => {placeId};

}