import 'package:flutter/material.dart';
import 'package:flutter_pogoda_test/weather_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:weather/weather.dart';

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
                      Provider.of<WeatherProvider>(context).forecast![i],
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

Widget miniCard(Weather data, DateTime date, String icon) {
  var tempOwnFontSize = 80;
  var svg = getWeatherImage(icon) ?? "assets/svgs/sun-solid.svg";
  bool isTheSame = true;
  if (data.tempMax!.celsius == data.tempMin!.celsius) {
    isTheSame = false;
  }
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
            Column(
              children: [
                Container(
                  decoration: isTheSame
                      ? const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.white54)))
                      : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (r) {
                          return isTheSame
                              ? const LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    Color.fromARGB(255, 192, 0, 0),
                                    Color.fromARGB(255, 231, 68, 68),
                                  ],
                                ).createShader(r)
                              : const LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    Color.fromARGB(255, 199, 199, 199),
                                    Color.fromARGB(255, 255, 255, 255),
                                  ],
                                ).createShader(r);
                        },
                        child: Text(
                          data.tempMax!.celsius!.toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: tempOwnFontSize * 0.32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text("°",
                          style: TextStyle(
                              fontSize: tempOwnFontSize * 0.18,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(172, 255, 255, 255))),
                    ],
                  ),
                ),
                isTheSame
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (r) {
                              return const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 38, 107, 250),
                                  Color(0xff5ce3ff)
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ).createShader(r);
                            },
                            child:
                                Text(data.tempMin!.celsius!.toStringAsFixed(2),
                                    style: TextStyle(
                                      fontSize: tempOwnFontSize * 0.32,
                                      fontWeight: FontWeight.bold,
                                    )),
                          ),
                          Text("°",
                              style: TextStyle(
                                fontSize: tempOwnFontSize * 0.18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 38, 107, 250),
                              )),
                        ],
                      )
                    : Container(),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Icon(
                        Icons.air,
                        color: Colors.white,
                        size: tempOwnFontSize * 0.18,
                      ),
                    ),
                    Text(
                      "${data.windSpeed!.toStringAsFixed(2)}m/s",
                      style: TextStyle(
                          fontSize: tempOwnFontSize * 0.18,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(172, 255, 255, 255)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Icon(
                        Icons.water_drop_outlined,
                        color: Colors.white,
                        size: tempOwnFontSize * 0.18,
                      ),
                    ),
                    Text(
                      "${data.humidity!.toStringAsFixed(2)}%",
                      style: TextStyle(
                          fontSize: tempOwnFontSize * 0.18,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(172, 255, 255, 255)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Icon(
                        Icons.compress,
                        color: Colors.white,
                        size: tempOwnFontSize * 0.18,
                      ),
                    ),
                    Text(
                      "${data.pressure!.toStringAsFixed(0)}hPa",
                      style: TextStyle(
                          fontSize: tempOwnFontSize * 0.18,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(172, 255, 255, 255)),
                    ),
                  ],
                ),
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
            Text(
                "${date.hour < 10 ? '0${date.hour}' : date.hour}:${date.minute < 10 ? '0${date.minute}' : date.minute}",
                style: TextStyle(
                    fontSize: tempOwnFontSize * 0.2,
                    color: Colors.white.withAlpha(120))),
          ],
        ),
      ),
    ),
  );
}
