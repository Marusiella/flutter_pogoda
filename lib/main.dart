import 'package:flutter/material.dart';
import 'package:flutter_pogoda_test/listview_view.dart';
import 'package:flutter_pogoda_test/provider.dart';
import 'package:flutter_pogoda_test/weather_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
      ], child: const Blue()),
    );
  }
}
