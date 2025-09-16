
/// 顶层模型
class WeatherResponse {
  final double lat;
  final double lon;
  final String timezone;
  final int timezoneOffset;
  final Current current;
  final List<Minutely> minutely;
  final List<Hourly> hourly;
  final List<Daily> daily;
  final List<Alert> alerts;

  WeatherResponse({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.minutely,
    required this.hourly,
    required this.daily,
    required this.alerts,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) => WeatherResponse(
    lat: (json['lat'] as num).toDouble(),
    lon: (json['lon'] as num).toDouble(),
    timezone: json['timezone'],
    timezoneOffset: json['timezone_offset'],
    current: Current.fromJson(json['current']),
    minutely: (json['minutely'] as List?)
          ?.map((e) => Minutely.fromJson(e as Map<String, dynamic>))
          .toList()
          ?? const <Minutely>[],
    hourly: (json['hourly'] as List<dynamic>)
        .map((e) => Hourly.fromJson(e))
        .toList(),
    daily: (json['daily'] as List<dynamic>)
        .map((e) => Daily.fromJson(e))
        .toList(),
    alerts: json['alerts'] == null
        ? []
        : (json['alerts'] as List<dynamic>)
        .map((e) => Alert.fromJson(e))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'lat': lat,
    'lon': lon,
    'timezone': timezone,
    'timezone_offset': timezoneOffset,
    'current': current.toJson(),
    'minutely': minutely.map((e) => e.toJson()).toList(),
    'hourly': hourly.map((e) => e.toJson()).toList(),
    'daily': daily.map((e) => e.toJson()).toList(),
    'alerts': alerts.map((e) => e.toJson()).toList(),
  };
}

class Current {
  final int dt;
  final int sunrise;
  final int sunset;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final double windGust;
  final List<Weather> weather;

  Current({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    dt: json['dt'],
    sunrise: json['sunrise'],
    sunset: json['sunset'],
    temp: (json['temp'] as num).toDouble(),
    feelsLike: (json['feels_like'] as num).toDouble(),
    pressure: json['pressure'],
    humidity: json['humidity'],
    dewPoint: (json['dew_point'] as num).toDouble(),
    uvi: (json['uvi'] as num).toDouble(),
    clouds: json['clouds'],
    visibility: json['visibility'],
    windSpeed: (json['wind_speed'] as num).toDouble(),
    windDeg: json['wind_deg'],
    windGust: (json['wind_gust'] as num).toDouble(),
    weather: (json['weather'] as List<dynamic>)
        .map((e) => Weather.fromJson(e))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'dt': dt,
    'sunrise': sunrise,
    'sunset': sunset,
    'temp': temp,
    'feels_like': feelsLike,
    'pressure': pressure,
    'humidity': humidity,
    'dew_point': dewPoint,
    'uvi': uvi,
    'clouds': clouds,
    'visibility': visibility,
    'wind_speed': windSpeed,
    'wind_deg': windDeg,
    'wind_gust': windGust,
    'weather': weather.map((e) => e.toJson()).toList(),
  };
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    id: json['id'],
    main: json['main'],
    description: json['description'],
    icon: json['icon'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'main': main,
    'description': description,
    'icon': icon,
  };
}

class Minutely {
  final int dt;
  final double precipitation;

  Minutely({
    required this.dt,
    required this.precipitation,
  });

  factory Minutely.fromJson(Map<String, dynamic> json) => Minutely(
    dt: json['dt'],
    precipitation: (json['precipitation'] as num).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'dt': dt,
    'precipitation': precipitation,
  };
}

class Hourly {
  final int dt;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final double windGust;
  final List<Weather> weather;
  final double? pop;          // 降水概率 0~1
  final double? rain1h;       // 可选：雨量（过去 1h），来自 rain['1h']
  final double? snow1h;

  Hourly({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.pop,
    required this.rain1h,
    required this.snow1h
  });

  factory Hourly.fromJson(Map<String, dynamic> json) {
    final rain = json['rain'] as Map<String, dynamic>?;
    final snow = json['snow'] as Map<String, dynamic>?;
    return Hourly(
      dt: json['dt'],
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: (json['dew_point'] as num).toDouble(),
      uvi: (json['uvi'] as num).toDouble(),
      clouds: json['clouds'],
      visibility: json['visibility'],
      windSpeed: (json['wind_speed'] as num).toDouble(),
      windDeg: json['wind_deg'],
      windGust: (json['wind_gust'] as num).toDouble(),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e))
          .toList(),
      pop: (json['pop'] as num?)?.toDouble(),
      rain1h: (rain?['1h'] as num?)?.toDouble(),
      snow1h: (snow?['1h'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'dt': dt,
      'temp': temp,
      'feels_like': feelsLike,
      'pressure': pressure,
      'humidity': humidity,
      'dew_point': dewPoint,
      'uvi': uvi,
      'clouds': clouds,
      'visibility': visibility,
      'wind_speed': windSpeed,
      'wind_deg': windDeg,
      'wind_gust': windGust, // 你这里是 non-nullable，如果可能缺失可改成可空并做条件加入
      'weather': weather.map((e) => e.toJson()).toList(),
    };

    if (pop != null) {
      map['pop'] = pop;
    }
    if (rain1h != null) {
      map['rain'] = {'1h': rain1h};
    }
    if (snow1h != null) {
      map['snow'] = {'1h': snow1h};
    }
    return map;
  }

}

class Daily {
  final int dt;
  final int sunrise;
  final int sunset;
  final int moonrise;
  final int moonset;
  final double moonPhase;
  final String summary;
  final Temp temp;
  final FeelsLike feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double windSpeed;
  final int windDeg;
  final double windGust;
  final List<Weather> weather;
  final int clouds;
  final double pop;
  final double? rain;
  final double? snow;
  final double uvi;

  Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.summary,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    this.rain,
    this.snow,
    required this.uvi,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
    dt: json['dt'],
    sunrise: json['sunrise'],
    sunset: json['sunset'],
    moonrise: json['moonrise'],
    moonset: json['moonset'],
    moonPhase: (json['moon_phase'] as num).toDouble(),
    summary: json['summary'],
    temp: Temp.fromJson(json['temp']),
    feelsLike: FeelsLike.fromJson(json['feels_like']),
    pressure: json['pressure'],
    humidity: json['humidity'],
    dewPoint: (json['dew_point'] as num).toDouble(),
    windSpeed: (json['wind_speed'] as num).toDouble(),
    windDeg: json['wind_deg'],
    windGust: (json['wind_gust'] as num).toDouble(),
    weather: (json['weather'] as List<dynamic>)
        .map((e) => Weather.fromJson(e))
        .toList(),
    clouds: json['clouds'],
    pop: (json['pop'] as num).toDouble(),
    rain: json['rain'] != null ? (json['rain'] as num).toDouble() : null,
    snow: json['snow'] != null ? (json['snow'] as num).toDouble() : null,
    uvi: (json['uvi'] as num).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'dt': dt,
    'sunrise': sunrise,
    'sunset': sunset,
    'moonrise': moonrise,
    'moonset': moonset,
    'moon_phase': moonPhase,
    'summary': summary,
    'temp': temp.toJson(),
    'feels_like': feelsLike.toJson(),
    'pressure': pressure,
    'humidity': humidity,
    'dew_point': dewPoint,
    'wind_speed': windSpeed,
    'wind_deg': windDeg,
    'wind_gust': windGust,
    'weather': weather.map((e) => e.toJson()).toList(),
    'clouds': clouds,
    'pop': pop,
    'rain': rain,
    'snow':snow,
    'uvi': uvi,
  };
}

class Temp {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
    day: (json['day'] as num).toDouble(),
    min: (json['min'] as num).toDouble(),
    max: (json['max'] as num).toDouble(),
    night: (json['night'] as num).toDouble(),
    eve: (json['eve'] as num).toDouble(),
    morn: (json['morn'] as num).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'day': day,
    'min': min,
    'max': max,
    'night': night,
    'eve': eve,
    'morn': morn,
  };
}

class FeelsLike {
  final double day;
  final double night;
  final double eve;
  final double morn;

  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
    day: (json['day'] as num).toDouble(),
    night: (json['night'] as num).toDouble(),
    eve: (json['eve'] as num).toDouble(),
    morn: (json['morn'] as num).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'day': day,
    'night': night,
    'eve': eve,
    'morn': morn,
  };
}

class Alert {
  final String senderName;
  final String event;
  final int start;
  final int end;
  final String description;
  final List<dynamic> tags;

  Alert({
    required this.senderName,
    required this.event,
    required this.start,
    required this.end,
    required this.description,
    required this.tags,
  });

  factory Alert.fromJson(Map<String, dynamic> json) => Alert(
    senderName: json['sender_name'],
    event: json['event'],
    start: json['start'],
    end: json['end'],
    description: json['description'],
    tags: json['tags'],
  );

  Map<String, dynamic> toJson() => {
    'sender_name': senderName,
    'event': event,
    'start': start,
    'end': end,
    'description': description,
    'tags': tags,
  };
}
