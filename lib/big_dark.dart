import 'package:flutter/material.dart';
import 'package:flutter_pogoda_test/weather_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'icon_map.dart';

class BigDark extends StatelessWidget {
  const BigDark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Provider.of<WeatherProvider>(context).forecast != null
          ? ListView(
              // shrinkWrap: true,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                for (var i = 0;
                    i < Provider.of<WeatherProvider>(context).forecast!.length;
                    i++)
                  miniCard(
                      Provider.of<WeatherProvider>(context)
                          .forecast![i]
                          .temperature!
                          .celsius!,
                      Provider.of<WeatherProvider>(context).forecast![i].date!,
                      Provider.of<WeatherProvider>(context)
                          .forecast![i]
                          .weatherIcon!)
              ],
            )
          : Container(),
    );
  }
}

Widget miniCard(double temp, DateTime date, String icon) {
  var tempOwnFontSize = 80;
  var svg = getWeatherImage(icon) ?? "assets/svgs/sun-solid.svg";
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.white.withAlpha(40),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(temp.toStringAsFixed(2),
                    style: TextStyle(
                        fontSize: tempOwnFontSize * 0.32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                Text("°",
                    style: TextStyle(
                        fontSize: tempOwnFontSize * 0.18,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(172, 255, 255, 255))),
              ],
            ),
            SvgPicture.asset(
              svg,
              height: tempOwnFontSize * 0.32,
              color: Colors.white,
            ),
            // Icon(
            //   Icons.wb_sunny,
            //   color: const Color.fromARGB(230, 252, 229, 112),
            //   size: tempOwnFontSize * 0.6,
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 9, 0, 0),
              child: Text(
                  "${date.hour < 10 ? '0${date.hour}' : date.hour}:${date.minute < 10 ? '0${date.minute}' : date.minute}",
                  style: TextStyle(
                      fontSize: tempOwnFontSize * 0.2,
                      color: Colors.white.withAlpha(120))),
            ),
          ],
        ),
      ),
    ),
  );
}
