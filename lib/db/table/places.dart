import 'package:drift/drift.dart';


@DataClassName('Place')
class Places extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  RealColumn get lat => real()();
  RealColumn get lon => real()();
  TextColumn get country => text()();
  TextColumn get localNamesJson => text()();
  BoolColumn get isCurrent => boolean().withDefault(const Constant(false))();
}