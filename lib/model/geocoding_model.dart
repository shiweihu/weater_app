import 'dart:convert';
class PlaceResponse {
  final String name;
  final Map<String, String> localNames;
  final double lat;
  final double lon;
  final String country;

  PlaceResponse({
    required this.name,
    required this.localNames,
    required this.lat,
    required this.lon,
    required this.country,
  });

  String localNameToJson(){
    return jsonEncode(localNames);
  }

  /// 从 JSON 创建对象
  factory PlaceResponse.fromJson(Map<String, dynamic> json) {
    return PlaceResponse(
      name: json['name'] as String,
      localNames: Map<String, String>.from(
        json['local_names'] ?? {},
      ),
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      country: json['country'] as String,
    );
  }

  /// 转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'local_names': localNames,
      'lat': lat,
      'lon': lon,
      'country': country,
    };
  }
}