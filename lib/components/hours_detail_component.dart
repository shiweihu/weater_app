

import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_models.dart';

import '../core/utils.dart';
import '../l10n/app_localizations.dart';

class HoursDetail extends StatelessWidget{
  final Hourly hourly;
  final int offsetSec;
  const HoursDetail({super.key, required this.hourly,required  this.offsetSec});



  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final weather = hourly.weather[0];

    Map<String, String> dataMap = {
      localization.pop:'${hourly.pop ?? 0.0}%',
      localization.precipitation:'${hourly.rain1h ?? 0.0}mm/h',
      localization.snow:'${hourly.snow1h ?? 0.0}mm/h',
      localization.pressure:'${hourly.pressure}',
      localization.humidity:'${hourly.humidity}%',
      localization.dewPoint:'${hourly.dewPoint}°C',
      localization.uv:'${hourly.uvi}',
      localization.cloudiness:'${hourly.clouds}%',
      localization.visibility:'${hourly.visibility}',
      localization.wind:'${hourly.windSpeed}m/s',
    };

    final List<Widget> indicesWidgets = dataMap.entries.map((e) {
      return Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 1),child: Card(
          elevation: 0.1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(e.key, style: Theme.of(context).textTheme.titleLarge),
                Text(e.value, style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          )));
    }).toList();


    //

    return Column(
      children: [
        Text(formatHM(hourly.dt,offsetSec),style:Theme.of(context).textTheme.titleLarge),
        Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: NetworkImage('https://openweathermap.org/img/wn/${weather.icon}@2x.png'),
              ),
              Column(children: [
                Text(weather.main,style:Theme.of(context).textTheme.titleLarge),
                Text(weather.description,style:Theme.of(context).textTheme.titleMedium)
              ])
            ]),
        Text('${hourly.temp.round()}°C',style:Theme.of(context).textTheme.displayLarge),
        Text('${localization.feel}:${hourly.feelsLike.round()}°C',style:Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: 10,),
        Expanded(child: SingleChildScrollView(child:Column(children: [
          ...indicesWidgets
        ]))),
        SizedBox(height: 50,),
      ],
    );
  }
}

// Center(
// child: Column(
//
// mainAxisAlignment: MainAxisAlignment.center,
// mainAxisSize: MainAxisSize.min,
// children: <Widget>[
// const Text('BottomSheet'),
// ElevatedButton(
// child: const Text('Close'),
// onPressed: () {
// Navigator.pop(context);
// },
// ),
// ],
// ),
// )