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
String? getWeatherImage(String weatherCode) {
  return weatherImages[weatherCode];
}

String? getWeatherIcon(String code) {
  return weatherCodes[code];
}
