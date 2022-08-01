import 'package:flutter/material.dart';
import 'package:flutter_pogoda_test/weather_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'icon_map.dart';

class Small extends StatelessWidget {
  const Small({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQ = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          LimitedBox(
              maxHeight: mediaQ.size.height * 0.2, // previusly was 125
              child: Provider.of<WeatherProvider>(context).forecast != null
                  ? ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: Provider.of<WeatherProvider>(context)
                          .forecast!
                          .length,
                      itemBuilder: (context, index) {
                        return miniCard(
                            Provider.of<WeatherProvider>(context)
                                .forecast![index]
                                .temperature!
                                .celsius!,
                            Provider.of<WeatherProvider>(context)
                                .forecast![index]
                                .date!,
                            Provider.of<WeatherProvider>(context)
                                .forecast![index]
                                .weatherIcon!);
                      },
                    )
                  : Container())
        ],
      ),
    );
  }
}

Widget miniCard(double temp, DateTime date, String icon) {
  var tempOwnFontSize = 80;
  var svg = getWeatherImage(icon) ?? "assets/svgs/sun-solid.svg";
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 9),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.white.withAlpha(40),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
        child: Column(
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
