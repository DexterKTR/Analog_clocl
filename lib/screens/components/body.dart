import 'dart:async';
import 'dart:math';

import 'package:analog_clock/constants.dart';
import 'package:analog_clock/models/my_theme_prvider.dart';
import 'package:analog_clock/screens/clock_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import './time_and_hour_and_minute.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'New Port Beach | PST',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          TimeInHourAndMinute(),
          Clock()
        ],
      ),
    );
  }
}

class Clock extends StatefulWidget {
  Clock({Key key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 0),
                        color: kShadowColor.withOpacity(0.14),
                        blurRadius: 64)
                  ]),
              child: Transform.rotate(
                angle: -pi / 2,
                child: CustomPaint(
                  painter: ClockPainter(context, _dateTime),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          child: Consumer<MyThemeModel>(
            builder: (context, theme, child) => GestureDetector(
              onTap: () => theme.changeTheme(),
              child: SvgPicture.asset(
                theme.isLigthTheme
                    ? "assets/icons/Sun.svg"
                    : "assets/icons/Moon.svg",
                height: 24.0,
                width: 24.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          top: 50,
          left: 0,
          right: 0,
        )
      ],
    );
  }
}
