import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:flutter_pogoda_test/icon_map.dart';
import 'package:flutter_pogoda_test/weather_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:intl/intl.dart';

class DataBlue extends StatefulWidget {
  const DataBlue({Key? key}) : super(key: key);

  @override
  State<DataBlue> createState() => _DataBlueState();
}

class _DataBlueState extends State<DataBlue> {
  bool animation = true;
  @override
  Widget build(BuildContext context) {
    var mediaQ = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: mediaQ.size.height * 0.71,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: VisibilityDetector(
                  key: const Key("animated-cloudy-sun"),
                  child: Lottie.asset(
                      width: mediaQ.size.width * 0.75,
                      frameRate: FrameRate(kDebugMode ? 1 : 30),
                      animate: animation,
                      getWeatherLottie(
                          Provider.of<WeatherProvider>(context).weather)),
                  onVisibilityChanged: (v) {
                    setState(() {
                      animation = v.visibleFraction > 0.5;
                    });
                  }),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(mediaQ.size.width * 0.04, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      Provider.of<WeatherProvider>(context)
                              .weather
                              ?.temperature
                              ?.celsius
                              ?.toStringAsFixed(2) ??
                          'IDK',
                      style: TextStyle(
                          fontSize: mediaQ.size.width * 0.30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Text("°",
                      style: TextStyle(
                          fontSize: mediaQ.size.width * 0.12,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(172, 255, 255, 255))),
                ],
              ),
            ),
            Text(
                (getWeatherIcon(Provider.of<WeatherProvider>(context)
                                .weather
                                ?.weatherIcon ??
                            "") ??
                        "Maybe it's raining")
                    .replaceAll(" day", "")
                    .replaceAll(" night", ""),
                style: TextStyle(
                    height: 0.3,
                    fontSize: mediaQ.size.width * 0.08,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(172, 255, 255, 255))),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Text(
                  getDate(Provider.of<WeatherProvider>(context).weather?.date),
                  style: TextStyle(
                      // height: 1.3,
                      fontSize: mediaQ.size.width * 0.030,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(100, 255, 255, 255))),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(40, 5, 40, 0),
              child: Divider(
                color: Color.fromARGB(40, 91, 181, 255),
                thickness: 1.4,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  mediaQ.size.width * 0.12, 5, mediaQ.size.width * 0.12, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  detailedData(
                      Icons.air,
                      "${Provider.of<WeatherProvider>(context).weather?.windSpeed ?? '?'} km/h",
                      "Wind",
                      mediaQ.size.width),
                  detailedData(
                      Icons.water_drop,
                      "${Provider.of<WeatherProvider>(context).weather?.humidity ?? '?'} %",
                      "Humidity",
                      mediaQ.size.width),
                  detailedData(
                      Icons.compress,
                      "${Provider.of<WeatherProvider>(context).weather?.pressure ?? '?'} hPa",
                      "Pressure",
                      mediaQ.size.width),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget detailedData(IconData icon, String value, String text, double width) {
  return SizedBox(
    width: (width * 0.3) - 20,
    child: Column(
      children: [
        Icon(
          icon,
          size: width * 0.055,
          color: const Color.fromARGB(140, 255, 255, 255),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 4, 0, 2),
          child: Text(value,
              style: TextStyle(
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(190, 255, 255, 255))),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: width * 0.035,
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(140, 255, 255, 255),
          ),
        ),
      ],
    ),
  );
}

String getDate(DateTime? date) {
  if (date == null) return "";
  // return named day month year
  return "${DateFormat.EEEE().format(date)} ${DateFormat.d().format(date)} ${DateFormat.MMMM().format(date)} ${DateFormat.y().format(date)}";
}
