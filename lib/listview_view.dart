import 'package:flutter/material.dart';
import 'package:flutter_pogoda_test/blue_screen.dart';
import 'package:flutter_pogoda_test/dark_screen.dart';
import 'package:flutter_pogoda_test/provider.dart';
import 'package:flutter_pogoda_test/weather_provider.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Blue extends StatefulWidget {
  const Blue({Key? key}) : super(key: key);

  @override
  State<Blue> createState() => _BlueState();
}

class _BlueState extends State<Blue> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<WeatherProvider>(context, listen: false).aio();
  }

  @override
  Widget build(BuildContext context) {
    // PageController pageController =
    //     PageController(initialPage: 0, viewportFraction: 0.8);
    var mediaQ = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        color: Colors.black.withOpacity(0.95),
        child: RefreshIndicator(
          onRefresh: Provider.of<WeatherProvider>(context, listen: false).aio,
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            clipBehavior: Clip.hardEdge,
            // controller: pageController,
            children: [
              Container(
                // height: (mediaQ.size.height * 0.76) + mediaQ.padding.top,
                decoration: const BoxDecoration(
                  // color: Color.fromARGB(255, 60, 167, 255),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 38, 107, 250),
                      Color(0xff5ce3ff)
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(100, 60, 167, 255),
                      // blurRadius: 10,
                      spreadRadius: -23,
                      offset: Offset(0, 32),
                    ),
                    BoxShadow(
                      color: Color.fromARGB(150, 60, 167, 255),
                      blurRadius: 40,
                      spreadRadius: -23,
                      offset: Offset(0, 32),
                    ),
                  ],
                ),
                child: const DataBlue(),
              ),
              VisibilityDetector(
                  onVisibilityChanged: (info) {
                    // if (info.visibleFraction == 0.3) {

                    // }
                    print(info.visibleFraction);
                    Provider.of<MyProvider>(context, listen: false)
                        .setVisibility(info.visibleFraction);
                  },
                  key: const Key("dark"),
                  // child: SizedBox(
                  //   height: mediaQ.size.height,
                  //   child: const Dark(),
                  // ),
                  child: SizedBox(
                    height: mediaQ.size.height * 0.9,
                    child: const Dark(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
