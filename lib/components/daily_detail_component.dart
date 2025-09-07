

import '../model/weather_models.dart';
import 'package:flutter/material.dart';

class DailyDetail extends StatefulWidget{
  final Daily daily;
  final int offsetSec;
  const DailyDetail({super.key,required this.daily,required this.offsetSec});


  @override
  State<StatefulWidget> createState() => _DailyDetailState();

}

class _DailyDetailState extends State<DailyDetail>{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Modal BottomSheet'),
            ElevatedButton(
              child: const Text('Close BottomSheet'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}