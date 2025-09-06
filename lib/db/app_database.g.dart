// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PlacesTable extends Places with TableInfo<$PlacesTable, Place> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlacesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lonMeta = const VerificationMeta('lon');
  @override
  late final GeneratedColumn<double> lon = GeneratedColumn<double>(
    'lon',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countryMeta = const VerificationMeta(
    'country',
  );
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
    'country',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localNamesJsonMeta = const VerificationMeta(
    'localNamesJson',
  );
  @override
  late final GeneratedColumn<String> localNamesJson = GeneratedColumn<String>(
    'local_names_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCurrentMeta = const VerificationMeta(
    'isCurrent',
  );
  @override
  late final GeneratedColumn<bool> isCurrent = GeneratedColumn<bool>(
    'is_current',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_current" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    lat,
    lon,
    country,
    localNamesJson,
    isCurrent,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'places';
  @override
  VerificationContext validateIntegrity(
    Insertable<Place> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lon')) {
      context.handle(
        _lonMeta,
        lon.isAcceptableOrUnknown(data['lon']!, _lonMeta),
      );
    } else if (isInserting) {
      context.missing(_lonMeta);
    }
    if (data.containsKey('country')) {
      context.handle(
        _countryMeta,
        country.isAcceptableOrUnknown(data['country']!, _countryMeta),
      );
    } else if (isInserting) {
      context.missing(_countryMeta);
    }
    if (data.containsKey('local_names_json')) {
      context.handle(
        _localNamesJsonMeta,
        localNamesJson.isAcceptableOrUnknown(
          data['local_names_json']!,
          _localNamesJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_localNamesJsonMeta);
    }
    if (data.containsKey('is_current')) {
      context.handle(
        _isCurrentMeta,
        isCurrent.isAcceptableOrUnknown(data['is_current']!, _isCurrentMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Place map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Place(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      )!,
      lon: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lon'],
      )!,
      country: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country'],
      )!,
      localNamesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_names_json'],
      )!,
      isCurrent: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_current'],
      )!,
    );
  }

  @override
  $PlacesTable createAlias(String alias) {
    return $PlacesTable(attachedDatabase, alias);
  }
}

class Place extends DataClass implements Insertable<Place> {
  final int id;
  final String name;
  final double lat;
  final double lon;
  final String country;
  final String localNamesJson;
  final bool isCurrent;
  const Place({
    required this.id,
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    required this.localNamesJson,
    required this.isCurrent,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['lat'] = Variable<double>(lat);
    map['lon'] = Variable<double>(lon);
    map['country'] = Variable<String>(country);
    map['local_names_json'] = Variable<String>(localNamesJson);
    map['is_current'] = Variable<bool>(isCurrent);
    return map;
  }

  PlacesCompanion toCompanion(bool nullToAbsent) {
    return PlacesCompanion(
      id: Value(id),
      name: Value(name),
      lat: Value(lat),
      lon: Value(lon),
      country: Value(country),
      localNamesJson: Value(localNamesJson),
      isCurrent: Value(isCurrent),
    );
  }

  factory Place.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Place(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      lat: serializer.fromJson<double>(json['lat']),
      lon: serializer.fromJson<double>(json['lon']),
      country: serializer.fromJson<String>(json['country']),
      localNamesJson: serializer.fromJson<String>(json['localNamesJson']),
      isCurrent: serializer.fromJson<bool>(json['isCurrent']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'lat': serializer.toJson<double>(lat),
      'lon': serializer.toJson<double>(lon),
      'country': serializer.toJson<String>(country),
      'localNamesJson': serializer.toJson<String>(localNamesJson),
      'isCurrent': serializer.toJson<bool>(isCurrent),
    };
  }

  Place copyWith({
    int? id,
    String? name,
    double? lat,
    double? lon,
    String? country,
    String? localNamesJson,
    bool? isCurrent,
  }) => Place(
    id: id ?? this.id,
    name: name ?? this.name,
    lat: lat ?? this.lat,
    lon: lon ?? this.lon,
    country: country ?? this.country,
    localNamesJson: localNamesJson ?? this.localNamesJson,
    isCurrent: isCurrent ?? this.isCurrent,
  );
  Place copyWithCompanion(PlacesCompanion data) {
    return Place(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      lat: data.lat.present ? data.lat.value : this.lat,
      lon: data.lon.present ? data.lon.value : this.lon,
      country: data.country.present ? data.country.value : this.country,
      localNamesJson: data.localNamesJson.present
          ? data.localNamesJson.value
          : this.localNamesJson,
      isCurrent: data.isCurrent.present ? data.isCurrent.value : this.isCurrent,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Place(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('country: $country, ')
          ..write('localNamesJson: $localNamesJson, ')
          ..write('isCurrent: $isCurrent')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, lat, lon, country, localNamesJson, isCurrent);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Place &&
          other.id == this.id &&
          other.name == this.name &&
          other.lat == this.lat &&
          other.lon == this.lon &&
          other.country == this.country &&
          other.localNamesJson == this.localNamesJson &&
          other.isCurrent == this.isCurrent);
}

class PlacesCompanion extends UpdateCompanion<Place> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> lat;
  final Value<double> lon;
  final Value<String> country;
  final Value<String> localNamesJson;
  final Value<bool> isCurrent;
  const PlacesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.lat = const Value.absent(),
    this.lon = const Value.absent(),
    this.country = const Value.absent(),
    this.localNamesJson = const Value.absent(),
    this.isCurrent = const Value.absent(),
  });
  PlacesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double lat,
    required double lon,
    required String country,
    required String localNamesJson,
    this.isCurrent = const Value.absent(),
  }) : name = Value(name),
       lat = Value(lat),
       lon = Value(lon),
       country = Value(country),
       localNamesJson = Value(localNamesJson);
  static Insertable<Place> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? lat,
    Expression<double>? lon,
    Expression<String>? country,
    Expression<String>? localNamesJson,
    Expression<bool>? isCurrent,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (lat != null) 'lat': lat,
      if (lon != null) 'lon': lon,
      if (country != null) 'country': country,
      if (localNamesJson != null) 'local_names_json': localNamesJson,
      if (isCurrent != null) 'is_current': isCurrent,
    });
  }

  PlacesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<double>? lat,
    Value<double>? lon,
    Value<String>? country,
    Value<String>? localNamesJson,
    Value<bool>? isCurrent,
  }) {
    return PlacesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      country: country ?? this.country,
      localNamesJson: localNamesJson ?? this.localNamesJson,
      isCurrent: isCurrent ?? this.isCurrent,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lon.present) {
      map['lon'] = Variable<double>(lon.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (localNamesJson.present) {
      map['local_names_json'] = Variable<String>(localNamesJson.value);
    }
    if (isCurrent.present) {
      map['is_current'] = Variable<bool>(isCurrent.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlacesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('country: $country, ')
          ..write('localNamesJson: $localNamesJson, ')
          ..write('isCurrent: $isCurrent')
          ..write(')'))
        .toString();
  }
}

class $WeatherResponsesTable extends WeatherResponses
    with TableInfo<$WeatherResponsesTable, WeatherRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeatherResponsesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _placeIdMeta = const VerificationMeta(
    'placeId',
  );
  @override
  late final GeneratedColumn<int> placeId = GeneratedColumn<int>(
    'place_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES places (id) ON UPDATE CASCADE ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _payloadJsonMeta = const VerificationMeta(
    'payloadJson',
  );
  @override
  late final GeneratedColumn<String> payloadJson = GeneratedColumn<String>(
    'payload_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dtMeta = const VerificationMeta('dt');
  @override
  late final GeneratedColumn<int> dt = GeneratedColumn<int>(
    'dt',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [placeId, payloadJson, dt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weather_responses';
  @override
  VerificationContext validateIntegrity(
    Insertable<WeatherRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('place_id')) {
      context.handle(
        _placeIdMeta,
        placeId.isAcceptableOrUnknown(data['place_id']!, _placeIdMeta),
      );
    }
    if (data.containsKey('payload_json')) {
      context.handle(
        _payloadJsonMeta,
        payloadJson.isAcceptableOrUnknown(
          data['payload_json']!,
          _payloadJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_payloadJsonMeta);
    }
    if (data.containsKey('dt')) {
      context.handle(_dtMeta, dt.isAcceptableOrUnknown(data['dt']!, _dtMeta));
    } else if (isInserting) {
      context.missing(_dtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {placeId};
  @override
  WeatherRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeatherRow(
      placeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}place_id'],
      )!,
      payloadJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload_json'],
      )!,
      dt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}dt'],
      )!,
    );
  }

  @override
  $WeatherResponsesTable createAlias(String alias) {
    return $WeatherResponsesTable(attachedDatabase, alias);
  }
}

class WeatherRow extends DataClass implements Insertable<WeatherRow> {
  final int placeId;
  final String payloadJson;
  final int dt;
  const WeatherRow({
    required this.placeId,
    required this.payloadJson,
    required this.dt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['place_id'] = Variable<int>(placeId);
    map['payload_json'] = Variable<String>(payloadJson);
    map['dt'] = Variable<int>(dt);
    return map;
  }

  WeatherResponsesCompanion toCompanion(bool nullToAbsent) {
    return WeatherResponsesCompanion(
      placeId: Value(placeId),
      payloadJson: Value(payloadJson),
      dt: Value(dt),
    );
  }

  factory WeatherRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeatherRow(
      placeId: serializer.fromJson<int>(json['placeId']),
      payloadJson: serializer.fromJson<String>(json['payloadJson']),
      dt: serializer.fromJson<int>(json['dt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'placeId': serializer.toJson<int>(placeId),
      'payloadJson': serializer.toJson<String>(payloadJson),
      'dt': serializer.toJson<int>(dt),
    };
  }

  WeatherRow copyWith({int? placeId, String? payloadJson, int? dt}) =>
      WeatherRow(
        placeId: placeId ?? this.placeId,
        payloadJson: payloadJson ?? this.payloadJson,
        dt: dt ?? this.dt,
      );
  WeatherRow copyWithCompanion(WeatherResponsesCompanion data) {
    return WeatherRow(
      placeId: data.placeId.present ? data.placeId.value : this.placeId,
      payloadJson: data.payloadJson.present
          ? data.payloadJson.value
          : this.payloadJson,
      dt: data.dt.present ? data.dt.value : this.dt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeatherRow(')
          ..write('placeId: $placeId, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('dt: $dt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(placeId, payloadJson, dt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeatherRow &&
          other.placeId == this.placeId &&
          other.payloadJson == this.payloadJson &&
          other.dt == this.dt);
}

class WeatherResponsesCompanion extends UpdateCompanion<WeatherRow> {
  final Value<int> placeId;
  final Value<String> payloadJson;
  final Value<int> dt;
  const WeatherResponsesCompanion({
    this.placeId = const Value.absent(),
    this.payloadJson = const Value.absent(),
    this.dt = const Value.absent(),
  });
  WeatherResponsesCompanion.insert({
    this.placeId = const Value.absent(),
    required String payloadJson,
    required int dt,
  }) : payloadJson = Value(payloadJson),
       dt = Value(dt);
  static Insertable<WeatherRow> custom({
    Expression<int>? placeId,
    Expression<String>? payloadJson,
    Expression<int>? dt,
  }) {
    return RawValuesInsertable({
      if (placeId != null) 'place_id': placeId,
      if (payloadJson != null) 'payload_json': payloadJson,
      if (dt != null) 'dt': dt,
    });
  }

  WeatherResponsesCompanion copyWith({
    Value<int>? placeId,
    Value<String>? payloadJson,
    Value<int>? dt,
  }) {
    return WeatherResponsesCompanion(
      placeId: placeId ?? this.placeId,
      payloadJson: payloadJson ?? this.payloadJson,
      dt: dt ?? this.dt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (placeId.present) {
      map['place_id'] = Variable<int>(placeId.value);
    }
    if (payloadJson.present) {
      map['payload_json'] = Variable<String>(payloadJson.value);
    }
    if (dt.present) {
      map['dt'] = Variable<int>(dt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeatherResponsesCompanion(')
          ..write('placeId: $placeId, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('dt: $dt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PlacesTable places = $PlacesTable(this);
  late final $WeatherResponsesTable weatherResponses = $WeatherResponsesTable(
    this,
  );
  late final PlacesDao placesDao = PlacesDao(this as AppDatabase);
  late final WeatherDao weatherDao = WeatherDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    places,
    weatherResponses,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'places',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('weather_responses', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'places',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('weather_responses', kind: UpdateKind.update)],
    ),
  ]);
}

typedef $$PlacesTableCreateCompanionBuilder =
    PlacesCompanion Function({
      Value<int> id,
      required String name,
      required double lat,
      required double lon,
      required String country,
      required String localNamesJson,
      Value<bool> isCurrent,
    });
typedef $$PlacesTableUpdateCompanionBuilder =
    PlacesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<double> lat,
      Value<double> lon,
      Value<String> country,
      Value<String> localNamesJson,
      Value<bool> isCurrent,
    });

final class $$PlacesTableReferences
    extends BaseReferences<_$AppDatabase, $PlacesTable, Place> {
  $$PlacesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$WeatherResponsesTable, List<WeatherRow>>
  _weatherResponsesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.weatherResponses,
    aliasName: $_aliasNameGenerator(db.places.id, db.weatherResponses.placeId),
  );

  $$WeatherResponsesTableProcessedTableManager get weatherResponsesRefs {
    final manager = $$WeatherResponsesTableTableManager(
      $_db,
      $_db.weatherResponses,
    ).filter((f) => f.placeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _weatherResponsesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PlacesTableFilterComposer
    extends Composer<_$AppDatabase, $PlacesTable> {
  $$PlacesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lon => $composableBuilder(
    column: $table.lon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localNamesJson => $composableBuilder(
    column: $table.localNamesJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCurrent => $composableBuilder(
    column: $table.isCurrent,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> weatherResponsesRefs(
    Expression<bool> Function($$WeatherResponsesTableFilterComposer f) f,
  ) {
    final $$WeatherResponsesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.weatherResponses,
      getReferencedColumn: (t) => t.placeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeatherResponsesTableFilterComposer(
            $db: $db,
            $table: $db.weatherResponses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PlacesTableOrderingComposer
    extends Composer<_$AppDatabase, $PlacesTable> {
  $$PlacesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lon => $composableBuilder(
    column: $table.lon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localNamesJson => $composableBuilder(
    column: $table.localNamesJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCurrent => $composableBuilder(
    column: $table.isCurrent,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlacesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlacesTable> {
  $$PlacesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lon =>
      $composableBuilder(column: $table.lon, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<String> get localNamesJson => $composableBuilder(
    column: $table.localNamesJson,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCurrent =>
      $composableBuilder(column: $table.isCurrent, builder: (column) => column);

  Expression<T> weatherResponsesRefs<T extends Object>(
    Expression<T> Function($$WeatherResponsesTableAnnotationComposer a) f,
  ) {
    final $$WeatherResponsesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.weatherResponses,
      getReferencedColumn: (t) => t.placeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeatherResponsesTableAnnotationComposer(
            $db: $db,
            $table: $db.weatherResponses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PlacesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlacesTable,
          Place,
          $$PlacesTableFilterComposer,
          $$PlacesTableOrderingComposer,
          $$PlacesTableAnnotationComposer,
          $$PlacesTableCreateCompanionBuilder,
          $$PlacesTableUpdateCompanionBuilder,
          (Place, $$PlacesTableReferences),
          Place,
          PrefetchHooks Function({bool weatherResponsesRefs})
        > {
  $$PlacesTableTableManager(_$AppDatabase db, $PlacesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlacesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlacesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlacesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> lat = const Value.absent(),
                Value<double> lon = const Value.absent(),
                Value<String> country = const Value.absent(),
                Value<String> localNamesJson = const Value.absent(),
                Value<bool> isCurrent = const Value.absent(),
              }) => PlacesCompanion(
                id: id,
                name: name,
                lat: lat,
                lon: lon,
                country: country,
                localNamesJson: localNamesJson,
                isCurrent: isCurrent,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required double lat,
                required double lon,
                required String country,
                required String localNamesJson,
                Value<bool> isCurrent = const Value.absent(),
              }) => PlacesCompanion.insert(
                id: id,
                name: name,
                lat: lat,
                lon: lon,
                country: country,
                localNamesJson: localNamesJson,
                isCurrent: isCurrent,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$PlacesTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({weatherResponsesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (weatherResponsesRefs) db.weatherResponses,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (weatherResponsesRefs)
                    await $_getPrefetchedData<Place, $PlacesTable, WeatherRow>(
                      currentTable: table,
                      referencedTable: $$PlacesTableReferences
                          ._weatherResponsesRefsTable(db),
                      managerFromTypedResult: (p0) => $$PlacesTableReferences(
                        db,
                        table,
                        p0,
                      ).weatherResponsesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.placeId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$PlacesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlacesTable,
      Place,
      $$PlacesTableFilterComposer,
      $$PlacesTableOrderingComposer,
      $$PlacesTableAnnotationComposer,
      $$PlacesTableCreateCompanionBuilder,
      $$PlacesTableUpdateCompanionBuilder,
      (Place, $$PlacesTableReferences),
      Place,
      PrefetchHooks Function({bool weatherResponsesRefs})
    >;
typedef $$WeatherResponsesTableCreateCompanionBuilder =
    WeatherResponsesCompanion Function({
      Value<int> placeId,
      required String payloadJson,
      required int dt,
    });
typedef $$WeatherResponsesTableUpdateCompanionBuilder =
    WeatherResponsesCompanion Function({
      Value<int> placeId,
      Value<String> payloadJson,
      Value<int> dt,
    });

final class $$WeatherResponsesTableReferences
    extends BaseReferences<_$AppDatabase, $WeatherResponsesTable, WeatherRow> {
  $$WeatherResponsesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PlacesTable _placeIdTable(_$AppDatabase db) => db.places.createAlias(
    $_aliasNameGenerator(db.weatherResponses.placeId, db.places.id),
  );

  $$PlacesTableProcessedTableManager get placeId {
    final $_column = $_itemColumn<int>('place_id')!;

    final manager = $$PlacesTableTableManager(
      $_db,
      $_db.places,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_placeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WeatherResponsesTableFilterComposer
    extends Composer<_$AppDatabase, $WeatherResponsesTable> {
  $$WeatherResponsesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dt => $composableBuilder(
    column: $table.dt,
    builder: (column) => ColumnFilters(column),
  );

  $$PlacesTableFilterComposer get placeId {
    final $$PlacesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.placeId,
      referencedTable: $db.places,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlacesTableFilterComposer(
            $db: $db,
            $table: $db.places,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WeatherResponsesTableOrderingComposer
    extends Composer<_$AppDatabase, $WeatherResponsesTable> {
  $$WeatherResponsesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dt => $composableBuilder(
    column: $table.dt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlacesTableOrderingComposer get placeId {
    final $$PlacesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.placeId,
      referencedTable: $db.places,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlacesTableOrderingComposer(
            $db: $db,
            $table: $db.places,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WeatherResponsesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WeatherResponsesTable> {
  $$WeatherResponsesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dt =>
      $composableBuilder(column: $table.dt, builder: (column) => column);

  $$PlacesTableAnnotationComposer get placeId {
    final $$PlacesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.placeId,
      referencedTable: $db.places,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlacesTableAnnotationComposer(
            $db: $db,
            $table: $db.places,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WeatherResponsesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WeatherResponsesTable,
          WeatherRow,
          $$WeatherResponsesTableFilterComposer,
          $$WeatherResponsesTableOrderingComposer,
          $$WeatherResponsesTableAnnotationComposer,
          $$WeatherResponsesTableCreateCompanionBuilder,
          $$WeatherResponsesTableUpdateCompanionBuilder,
          (WeatherRow, $$WeatherResponsesTableReferences),
          WeatherRow,
          PrefetchHooks Function({bool placeId})
        > {
  $$WeatherResponsesTableTableManager(
    _$AppDatabase db,
    $WeatherResponsesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeatherResponsesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeatherResponsesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeatherResponsesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> placeId = const Value.absent(),
                Value<String> payloadJson = const Value.absent(),
                Value<int> dt = const Value.absent(),
              }) => WeatherResponsesCompanion(
                placeId: placeId,
                payloadJson: payloadJson,
                dt: dt,
              ),
          createCompanionCallback:
              ({
                Value<int> placeId = const Value.absent(),
                required String payloadJson,
                required int dt,
              }) => WeatherResponsesCompanion.insert(
                placeId: placeId,
                payloadJson: payloadJson,
                dt: dt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WeatherResponsesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({placeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (placeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.placeId,
                                referencedTable:
                                    $$WeatherResponsesTableReferences
                                        ._placeIdTable(db),
                                referencedColumn:
                                    $$WeatherResponsesTableReferences
                                        ._placeIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$WeatherResponsesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WeatherResponsesTable,
      WeatherRow,
      $$WeatherResponsesTableFilterComposer,
      $$WeatherResponsesTableOrderingComposer,
      $$WeatherResponsesTableAnnotationComposer,
      $$WeatherResponsesTableCreateCompanionBuilder,
      $$WeatherResponsesTableUpdateCompanionBuilder,
      (WeatherRow, $$WeatherResponsesTableReferences),
      WeatherRow,
      PrefetchHooks Function({bool placeId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PlacesTableTableManager get places =>
      $$PlacesTableTableManager(_db, _db.places);
  $$WeatherResponsesTableTableManager get weatherResponses =>
      $$WeatherResponsesTableTableManager(_db, _db.weatherResponses);
}
