import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_app/db/table/places.dart';
import 'package:weather_app/db/table/weather_row.dart';

import 'dao/places_dao.dart';
import 'dao/weather_dao.dart';



part 'app_database.g.dart'; // 只在数据库文件里写这一行

@DriftDatabase(tables: [Places,WeatherResponses],daos: [PlacesDao,WeatherDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }

}
