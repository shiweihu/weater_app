import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

bool isOverHalfHours(int dt,{Duration maxAge = const Duration(seconds: 10)}){
  final dtUtc = DateTime.fromMillisecondsSinceEpoch(dt * 1000, isUtc: true);
  final nowUtc = DateTime.now().toUtc();
  return nowUtc.difference(dtUtc) > maxAge;
}

String weekdayFromDt(
  int dt, {
  int? offsetSec,
  bool full = false,
  String? locale,
}) {
  final DateTime t = (offsetSec == null)
      ? DateTime.fromMillisecondsSinceEpoch(dt * 1000) // 设备本地时区
      : DateTime.fromMillisecondsSinceEpoch(
          (dt + offsetSec) * 1000,
          isUtc: true,
        ); // 目标时区

  final pattern = full ? 'EEEE' : 'EEE';
  return DateFormat(pattern, locale).format(t);
}

String formatHM(int tsSec, int offsetSec) {
  final dt = DateTime.fromMillisecondsSinceEpoch(
    tsSec * 1000,
    isUtc: true,
  ).add(Duration(seconds: offsetSec));
  return DateFormat('HH:mm').format(dt); // 例如 12:06
}

Future<Position> getCurrentPosition() async {
  // 1) 先确认系统定位开关
  final serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // 可引导用户打开定位开关
    await Geolocator.openLocationSettings();
    throw Exception('定位服务未开启');
  }

  // 2) 检查并请求权限
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }
  if (permission == LocationPermission.denied) {
    throw Exception('定位权限被拒绝');
  }
  if (permission == LocationPermission.deniedForever) {
    // 用户永久拒绝：只能去系统设置里改
    await Geolocator.openAppSettings();
    throw Exception('定位权限被永久拒绝');
  }

  // 3) 拿当前位置（accuracy 可根据需求调整）
  return Geolocator.getCurrentPosition(
    locationSettings: LocationSettings(timeLimit: Duration(seconds: 10)),
  );
}
