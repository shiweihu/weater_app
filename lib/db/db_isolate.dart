import 'dart:isolate';
import 'dart:ui';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/services.dart';
import 'package:drift/isolate.dart';
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'app_database.dart';

const _kDbIsoName = 'app_db_isolate_connect_port';


Future<AppDatabase> getDbInstance() async{
  final dbIso = await getOrCreateDbIsolate();
  final conn = await dbIso.connect();   // 同一个数据库 isolate
  return AppDatabase.connect(conn);
}


/// 获取或创建“唯一”的 DriftIsolate
Future<DriftIsolate> getOrCreateDbIsolate() async {
  // 先尝试复用
  final existed = IsolateNameServer.lookupPortByName(_kDbIsoName);
  if (existed != null) {
    return DriftIsolate.fromConnectPort(existed);
  }

  // 不存在则创建
  final receive = ReceivePort();
  var rootToken = RootIsolateToken.instance!;
  await Isolate.spawn<_IsoInitMessage>(_dbIsolateEntry,
      _IsoInitMessage(receive.sendPort, rootToken));

  // 取回连接端口
  final SendPort connectPort = await receive.first as SendPort;
  receive.close();

  // 注册到 IsolateNameServer 以便复用
  IsolateNameServer.registerPortWithName(connectPort, _kDbIsoName);

  return DriftIsolate.fromConnectPort(connectPort);
}

/// isolate 的入口：在该 isolate 内“唯一”地打开数据库连接
void _dbIsolateEntry(_IsoInitMessage msg) {
  BackgroundIsolateBinaryMessenger.ensureInitialized(msg.token);
  // 注意：这里需要 DatabaseConnection，而不是 QueryExecutor
  final executor = driftDatabase(
    name: 'my_database',
    native: const DriftNativeOptions(
      // By default, `driftDatabase` from `package:drift_flutter` stores the
      // database files in `getApplicationDocumentsDirectory()`.
      databaseDirectory: getApplicationSupportDirectory,
    ),
    // If you need web support, see https://drift.simonbinder.eu/platforms/web/
  );
  final iso = DriftIsolate.inCurrent(() => DatabaseConnection(executor));

  // 把 connectPort 发送回去
  msg.reply.send(iso.connectPort);
}

class _IsoInitMessage {
  final RootIsolateToken token;
  final SendPort reply;
  _IsoInitMessage(this.reply, this.token);
}