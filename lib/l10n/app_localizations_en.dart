// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get temp => 'Temperature';

  @override
  String get feel => 'Feels like';

  @override
  String get wind => 'Wind';

  @override
  String get humidity => 'Humidity';

  @override
  String get uv => 'UV index';

  @override
  String get pressure => 'Pressure';

  @override
  String get visibility => 'Visibility';

  @override
  String get dewPoint => 'Dew point';

  @override
  String get precipitation_notice => 'No precipitation within 1 hour';

  @override
  String get cloudiness => 'Cloudiness';

  @override
  String get pop => 'Probability of precipitation';

  @override
  String get precipitation => 'Precipitation';

  @override
  String get snow => 'Snow';

  @override
  String get tab1 => 'Weather';

  @override
  String get tab2 => 'Cities';
}
