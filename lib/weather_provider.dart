import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

class WeatherProvider with ChangeNotifier {
  Position? _position;
  static const String key = "42b94f42fb0f719455189f7854d0705b";
  WeatherFactory wf = WeatherFactory(key);
  Weather? _weather;
  List<Weather>? _forecast;

// write getters for _weather and forecast
  Weather? get weather => _weather;
  List<Weather>? get forecast => _forecast;

  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    _position = await Geolocator.getCurrentPosition();
    notifyListeners();
  }

  Future<void> getWeather() async {
    if (_position == null) {
      await determinePosition();
    }
    _weather = await wf.currentWeatherByLocation(
        _position!.latitude, _position!.longitude);
    notifyListeners();
  }

  Future<void> getForecast() async {
    if (_position == null) {
      await determinePosition();
    }
    _forecast = await wf.fiveDayForecastByLocation(
        _position!.latitude, _position!.longitude);

    notifyListeners();
  }

  Future<void> aio() async {
    await determinePosition();
    await getWeather();
    await getForecast();
  }
}
