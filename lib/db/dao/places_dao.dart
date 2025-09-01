import 'package:drift/drift.dart';
import '../app_database.dart';
import '../table/places.dart';


part 'places_dao.g.dart';

@DriftAccessor(tables: [Places])
class PlacesDao extends DatabaseAccessor<AppDatabase> with _$PlacesDaoMixin {
  PlacesDao(super.db);

  Future<List<Place>> getAllPlaces() => select(places).get();

  Future<bool> isEmpty() async {
    final row = await (select(places)..limit(1)).getSingleOrNull();
    return row == null;
  }


  Future<Place> getCurrentPlace() => (select(places)..where((t) => t.isCurrent.equals(true))).getSingle();

  // 全部列表（名字升序）
  Stream<List<Place>> watchAll() =>
      (select(places)..orderBy([(t) => OrderingTerm.asc(t.name)])).watch();

  // 当前城市（isCurrent == true）
  Stream<Place?> watchCurrent() =>
      (select(places)..where((t) => t.isCurrent.equals(true))).watchSingleOrNull();

  /// 插入前确保 isCurrent 唯一
  Future<int> insertPlaceEnforcingCurrent(PlacesCompanion entry) {
    return transaction(() async {
      final wantCurrent = entry.isCurrent.present && entry.isCurrent.value == true;

      if (wantCurrent) {
        // 将其他已是 current 的行全部置为 false
        await (update(places)..where((t) => t.isCurrent.equals(true)))
            .write(const PlacesCompanion(isCurrent: Value(false)));
      }
      // 再插入
      return into(places).insert(entry, mode: InsertMode.insertOrReplace);
    });
  }
}