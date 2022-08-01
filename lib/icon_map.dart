import 'package:weather/weather.dart';

const weatherCodes = {
  "01d": "clear sky day",
  "01n": "clear sky night",
  "02d": "few clouds day",
  "02n": "few clouds night",
  "03d": "scattered clouds day",
  "03n": "scattered clouds night",
  "04d": "broken clouds day",
  "04n": "broken clouds night",
  "09d": "shower rain day",
  "09n": "shower rain night",
  "10d": "rain day",
  "10n": "rain night",
  "11d": "thunderstorm day",
  "11n": "thunderstorm night",
  "13d": "snow day",
  "13n": "snow night",
  "50d": "mist day",
  "50n": "mist night",
};
const weatherImages = {
  "01d": "assets/svgs/sun-solid.svg",
  "01n": "assets/svgs/moon-solid.svg",
  "02d": "assets/svgs/cloud-sun-solid.svg",
  "02n": "assets/svgs/cloud-moon-solid.svg",
  "03d": "assets/svgs/cloud-solid.svg",
  "03n": "assets/svgs/cloud-solid.svg",
  "04d": "assets/svgs/cloud-solid.svg", // darker
  "04n": "assets/svgs/cloud-solid.svg", // darker
  "09d": "assets/svgs/cloud-showers-heavy-solid.svg",
  "09n": "assets/svgs/cloud-showers-heavy-solid.svg",
  "10d": "assets/svgs/cloud-sun-rain-solid.svg",
  "10n": "assets/svgs/cloud-moon-rain-solid.svg",
  "11d": "assets/svgs/cloud-bolt-solid.svg",
  "11n": "assets/svgs/cloud-bolt-solid.svg",
  "13d": "assets/svgs/snowflake-solid.svg",
  "13n": "assets/svgs/snowflake-solid.svg",
  "50d": "assets/svgs/water-solid.svg",
  "50n": "assets/svgs/water-solid.svg",
};

const weatherLottie = {
  "01d": "assets/animated_icons/4804-weather-sunny.json",
  "01n": "assets/animated_icons/4799-weather-night.json",
  "02d": "assets/animated_icons/4800-weather-partly-cloudy.json",
  "02n": "assets/animated_icons/4796-weather-cloudynight.json",
  "03d": "assets/animated_icons/4806-weather-windy.json",
  "03n": "assets/animated_icons/4806-weather-windy.json",
  "04d": "assets/animated_icons/4806-weather-windy.json",
  "04n": "assets/animated_icons/4806-weather-windy.json",
  "09d": "assets/animated_icons/4801-weather-partly-shower.json",
  "09n": "assets/animated_icons/4797-weather-rainynight.json",
  "10d": "assets/animated_icons/4801-weather-partly-shower.json",
  "10n": "assets/animated_icons/4797-weather-rainynight.json",
  "11d": "assets/animated_icons/4803-weather-storm.json",
  "11n": "assets/animated_icons/4803-weather-storm.json",
  "13d": "assets/animated_icons/4802-weather-snow-sunny.json",
  "13n": "assets/animated_icons/4798-weather-snownight.json",
  "50d": "assets/animated_icons/4795-weather-mist.json",
  "50n": "assets/animated_icons/4795-weather-mist.json",
};

String getWeatherLottie(Weather? code) {
  return weatherLottie[code?.weatherIcon ?? "01d"] ??
      "assets/animated_icons/4804-weather-sunny.json";
}

String? getWeatherImage(String weatherCode) {
  return weatherImages[weatherCode];
}

String? getWeatherIcon(String code) {
  return weatherCodes[code];
}
