import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/db/dao/weather_dao.dart';

import '../components/hours_detail_component.dart';
import '../components/line_chart_component.dart';
import '../core/utils.dart';
import '../core/weather_provider.dart';
import '../db/app_database.dart';
import '../db/dao/places_dao.dart';
import '../l10n/app_localizations.dart';

class CurrentWeatherComponent extends StatelessWidget {
  const CurrentWeatherComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<Place?>(
          create: (ctx) => ctx.read<PlacesDao>().watchCurrent(),
          // 返回 Stream<Place?>
          initialData: null,
        ),
        Provider<WeatherProvider>(
          create: (ctx) => WeatherProvider(ctx.read<WeatherDao>()),

        ),
      ],
      child: CurrentWeatherWidget(),
    );
  }
}

class CurrentWeatherWidget extends StatefulWidget {
  const CurrentWeatherWidget({super.key});

  @override
  State<StatefulWidget> createState() => CurrentWeatherState();
}

class CurrentWeatherState extends State<CurrentWeatherWidget> {
  int? _lastId;

  @override
  initState() {
    super.initState();
  }

  void requestCurrentWeather(Place? currentPlace, String lang) {
    if (currentPlace != null) {
      if (currentPlace.id != _lastId) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          context.read<WeatherProvider>().loadCurrentWeatherData(
              currentPlace, lang: lang);// 防止重复触发
        });
        _lastId = currentPlace.id;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final localization = AppLocalizations.of(context)!;
    final currentPlace = context.watch<Place?>(); // 合法：build 阶段
    requestCurrentWeather(currentPlace, locale.languageCode);

    final weatherProvider = context.read<WeatherProvider>();

    if (currentPlace == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return StreamBuilder<WeatherRow?>(
      stream:context.read<WeatherDao>().watchWeatherByPlaceId(currentPlace.id),
      builder: (BuildContext context, AsyncSnapshot<WeatherRow?> snapshot) {
        final weatherRow = snapshot.data;
        if (snapshot.connectionState == ConnectionState.waiting || weatherRow == null) {
          return const Center(child: CircularProgressIndicator());
        }

        final weatherData = weatherProvider.convertJsonToWeatherResponse(weatherRow.payloadJson);
        final weather = weatherData.current.weather[0];
        final topBar = Container(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: NetworkImage(
                      'https://openweathermap.org/img/wn/${weather.icon}@2x.png',
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        weather.main,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        weather.description,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                '${weatherData.current.temp.round()}°C',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                '${localization.feel}:${weatherData.current.feelsLike.round()}°C',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        );

        final chartWidget = weatherData.minutely.any((e) => e.precipitation > 0)
            ? SliverToBoxAdapter(
          child: Padding(padding: EdgeInsets.only(left: 10,right: 10),
              child: LineChartPrecipitation(
                minutely: weatherData.minutely,
                offsetSec: weatherData.timezoneOffset,
              )),
        )
            : SliverToBoxAdapter(
          child: Center(
            child: Text(
              localization.precipitation_notice,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        );

        final indices = weatherData.current;
        final indicesWidget = [
          Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Padding(padding: EdgeInsets.all(10),child:Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.air),
                  Text(
                    localization.wind,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    "${indices.windSpeed}m/s",
                    style: Theme.of(context).textTheme.bodyMedium,
                  )

                ],
              ) )
          ),
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(padding: EdgeInsets.all(10),child:Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.water_drop_outlined),
                Text(
                  localization.humidity,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "${indices.humidity}%",
                  style: Theme.of(context).textTheme.bodyMedium,
                )

              ],
            )),
          ),
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(padding: EdgeInsets.all(10),child:Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.speed),
                Text(
                  localization.pressure,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "${indices.pressure}",
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            )),
          ),
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(padding: EdgeInsets.all(10),child:Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.visibility_outlined),
                Text(
                  localization.visibility,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "${indices.visibility}m",
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            )),
          ),
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(padding: EdgeInsets.all(10),child:Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.device_thermostat),
                Text(
                  localization.dewPoint,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "${indices.dewPoint}°C",
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            )),
          ),
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(padding: EdgeInsets.all(10),child:Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.wb_sunny_outlined),
                Text(
                  localization.uv,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "${indices.uvi}",
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            )),
          )
        ];
        final indicesBody = SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150.0,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            childAspectRatio: 1.5,
          ),
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return indicesWidget[index];
            },
            childCount: indicesWidget.length,
          ),
        );

        final hoursWidget = weatherData.hourly.map((hourly) {
          return SizedBox(
            width: 100,
            height: 150,
            child: Card(
              color: Theme.of(context).colorScheme.surfaceContainer,
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  Scaffold.of(context).showBottomSheet((BuildContext context) {
                    return SizedBox(
                      height: 700,
                      child: HoursDetail(
                        hourly: hourly,
                        offsetSec: weatherData.timezoneOffset,
                      ),
                    );
                  });
                },
                child: Padding(
                  padding: EdgeInsetsGeometry.directional(
                    start: 0,
                    end: 0,
                    top: 5,
                    bottom: 0,
                  ),
                  child: Column(
                    spacing: 0,
                    children: [
                      Text(
                        formatHM(hourly.dt, weatherData.timezoneOffset),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Image(
                        fit: BoxFit.scaleDown,
                        width: 60,
                        height: 60,
                        image: NetworkImage(
                          'https://openweathermap.org/img/wn/${hourly.weather[0].icon}@2x.png',
                        ),
                      ),
                      Text(
                        hourly.weather[0].main,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        '${hourly.temp.round()}°C',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList();
        final hoursBody = SliverToBoxAdapter(
            child: Column(
              children: [
                Divider(),
                SizedBox(
                  height: 150,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    // 横向
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemBuilder: (_, i) => hoursWidget[i],
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemCount: hoursWidget.length,
                  ),
                ),
                Divider(),
              ],
            )
        );

        final dailyList = weatherData.daily;
        final dailyBody = SliverList(
          delegate: SliverChildBuilderDelegate(childCount: dailyList.length, (
              context,
              index,
              ) {
            final daily = dailyList[index];
            return Card(
              color: Theme.of(context).colorScheme.surfaceContainer,
              elevation: 1,
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 30,
                    bottom: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        weekdayFromDt(
                          daily.dt,
                          offsetSec: weatherData.timezoneOffset,
                        ),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        '${daily.temp.min.round()}°C-${daily.temp.max.round()}°C',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        );

        return CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text(
                currentPlace.name,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              centerTitle: true,
              pinned: true,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(background: topBar),
            ),
            chartWidget,
            indicesBody,
            hoursBody,
            dailyBody,
          ],
        );
    },);
  }
}
