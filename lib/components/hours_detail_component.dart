

import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_models.dart';

import '../core/location_api.dart';
import '../l10n/app_localizations.dart';

class HoursDetail extends StatefulWidget{
  final Hourly hourly;
  final int offsetSec;
  const HoursDetail({super.key, required this.hourly,required  this.offsetSec});

  @override
  State<StatefulWidget> createState() => HoursDetailState();

}
class HoursDetailState extends State<HoursDetail>{

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final weather = widget.hourly.weather[0];
    final indicesWidget = [
      SizedBox(height: 20),
      Padding(padding: EdgeInsets.only(left: 10,right: 10),
          child:Column(children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(localization.pop,style: Theme.of(context).textTheme.titleLarge),
                  Text('${((widget.hourly.pop ?? 0.0) * 100).round()}%',style: Theme.of(context).textTheme.bodyLarge)
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
                  Text('${widget.hourly.rain1h ?? 0.0}mm/h',style: Theme.of(context).textTheme.bodyLarge)
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
                  Text('${widget.hourly.snow1h ?? 0.0}mm/h',style: Theme.of(context).textTheme.bodyLarge)
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
                  Text('${widget.hourly.pressure}',style: Theme.of(context).textTheme.bodyLarge)
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
                  Text('${widget.hourly.humidity}%',style: Theme.of(context).textTheme.bodyLarge)
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
                  Text('${widget.hourly.dewPoint}°C',style: Theme.of(context).textTheme.bodyLarge)
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
                  Text('${widget.hourly.uvi}',style: Theme.of(context).textTheme.bodyLarge)
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
                  Text('${widget.hourly.clouds}%',style: Theme.of(context).textTheme.bodyLarge)
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
                  Text('${widget.hourly.visibility}',style: Theme.of(context).textTheme.bodyLarge)
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
                  Text('${widget.hourly.windSpeed}m/s',style: Theme.of(context).textTheme.bodyLarge)
                ]
            ),
            Divider()
          ],)
      )
    ];

      return Column(
          children: [
            SizedBox(height: 20),
            Text(formatHM(widget.hourly.dt,widget.offsetSec),style:Theme.of(context).textTheme.titleLarge),
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
            Text('${widget.hourly.temp.round()}°C',style:Theme.of(context).textTheme.displayLarge),
            Text('${localization.feel}:${widget.hourly.feelsLike.round()}°C',style:Theme.of(context).textTheme.bodyLarge),
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