

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
    final indicesWidget = [
      SizedBox(height: 20),
      Padding(padding: EdgeInsets.only(left: 10,right: 10),
          child:Column(children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(localization.pop,style: Theme.of(context).textTheme.titleLarge),
                  Text('${((hourly.pop ?? 0.0) * 100).round()}%',style: Theme.of(context).textTheme.bodyLarge)
                ]
            ),
            Divider()
          ],)
      ),
      Padding(padding: EdgeInsets.only(left: 10,right: 10),
          child:Column(children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(localization.precipitation,style: Theme.of(context).textTheme.titleLarge),
                  Text('${hourly.rain1h ?? 0.0}mm/h',style: Theme.of(context).textTheme.bodyLarge)
                ]
            ),
            Divider()
          ],)
      ),
      Padding(padding: EdgeInsets.only(left: 10,right: 10),
          child:Column(children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(localization.snow,style: Theme.of(context).textTheme.titleLarge),
                  Text('${hourly.snow1h ?? 0.0}mm/h',style: Theme.of(context).textTheme.bodyLarge)
                ]
            ),
            Divider()
          ],)
      ),
      Padding(padding: EdgeInsets.only(left: 10,right: 10),
          child:Column(children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(localization.pressure,style: Theme.of(context).textTheme.titleLarge),
                  Text('${hourly.pressure}',style: Theme.of(context).textTheme.bodyLarge)
                ]
            ),
            Divider()
          ],)
      ),
      Padding(padding: EdgeInsets.only(left: 10,right: 10),
          child:Column(children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(localization.humidity ,style: Theme.of(context).textTheme.titleLarge),
                  Text('${hourly.humidity}%',style: Theme.of(context).textTheme.bodyLarge)
                ]
            ),
            Divider()
          ],)
      ),
      Padding(padding: EdgeInsets.only(left: 10,right: 10),
          child:Column(children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(localization.dewPoint ,style: Theme.of(context).textTheme.titleLarge),
                  Text('${hourly.dewPoint}°C',style: Theme.of(context).textTheme.bodyLarge)
                ]
            ),
            Divider()
          ],)
      ),
      Padding(padding: EdgeInsets.only(left: 10,right: 10),
          child:Column(children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(localization.uv ,style: Theme.of(context).textTheme.titleLarge),
                  Text('${hourly.uvi}',style: Theme.of(context).textTheme.bodyLarge)
                ]
            ),
            Divider()
          ],)
      ),
      Padding(padding: EdgeInsets.only(left: 10,right: 10),
          child:Column(children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(localization.cloudiness ,style: Theme.of(context).textTheme.titleLarge),
                  Text('${hourly.clouds}%',style: Theme.of(context).textTheme.bodyLarge)
                ]
            ),
            Divider()
          ],)
      ),
      Padding(padding: EdgeInsets.only(left: 10,right: 10),
          child:Column(children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(localization.visibility ,style: Theme.of(context).textTheme.titleLarge),
                  Text('${hourly.visibility}',style: Theme.of(context).textTheme.bodyLarge)
                ]
            ),
            Divider()
          ],)
      ),
      Padding(padding: EdgeInsets.only(left: 10,right: 10),
          child:Column(children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(localization.wind ,style: Theme.of(context).textTheme.titleLarge),
                  Text('${hourly.windSpeed}m/s',style: Theme.of(context).textTheme.bodyLarge)
                ]
            ),
            Divider()
          ],)
      )
    ];

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
        ...indicesWidget
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