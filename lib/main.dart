import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/cities_list.dart';
import 'package:weather_app/pages/current_weather.dart';

import 'core/geocoding _provide.dart';
import 'core/location_api.dart';
import 'db/app_database.dart';
import 'db/dao/places_dao.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => GeocodingProvider()),
        Provider(create: (_) => AppDatabase(), dispose: (_, db) => db.close()),
        ProxyProvider<AppDatabase, PlacesDao>(
          update: (_, db, __) => PlacesDao(db),
          //dispose: (_,dao)=>dao.close()
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        // 自动推导[en, zh, ...]
        // locale: const Locale('zh'), // 如需强制指定语言（而非跟随系统），解开注释
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0x00f59e0b), // ← 你的品牌主色/想要的主题色
            brightness: Brightness.light,
          ),
          textTheme: GoogleFonts.interTextTheme(),
          fontFamilyFallback: const ['Noto Sans SC'], // CJK 回退
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF6750A4),
            brightness: Brightness.dark,
          ),
          textTheme: GoogleFonts.interTextTheme(),
          fontFamilyFallback: const ['Noto Sans SC'], // CJK 回退
        ),
        themeMode: ThemeMode.system,
        // 跟随系统(或改 ThemeMode.light/dark)
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  Future<void> _fetchLocation() async {
    try {
      final position = await getCurrentPosition();
      if (!mounted) return;
      final geoProvider = context.read<GeocodingProvider>();
      final placesDao = context.read<PlacesDao>();
      final data = await geoProvider.loadGeocoding(
        position.latitude,
        position.longitude,
      );
      if (data != null) {
        final result = await placesDao.insertPlaceEnforcingCurrent(
          PlacesCompanion.insert(
            name: data.name,
            lat: data.lat,
            lon: data.lon,
            country: data.country,
            localNamesJson: data.localNameToJson(),
            isCurrent: const Value(true),
          ),
        );
        if (kDebugMode) {
          print(result);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      final placesDao = context.read<PlacesDao>();
      placesDao.isEmpty().then(
        (isEmpty) async => {if (isEmpty) await _fetchLocation()},
      );
    });

    //WidgetsBinding.instance.addPostFrameCallback((_) => _fetchLocation());
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    final List<Widget> pages = <Widget>[
      CurrentWeatherComponent(), // 对应索引 0
      CitiesListComponent(), // 对应索引 1
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: const Icon(Icons.cloud),
            icon: const Icon(Icons.cloud_outlined),
            label: localization.tab1,
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.location_city),
            icon: Badge(child: Icon(Icons.location_city_outlined)),
            label: localization.tab2,
          ),
        ],
      ),
      body: pages[currentPageIndex],
    );
  }
}
