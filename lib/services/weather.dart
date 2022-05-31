import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '703352defe557d914eeb9ae20b12a8cf';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
var WDescContainer = {
  'Thunderstorm': 11,
  'Drizzle': 11,
  'Rain': 11,
  'Snow' : 08,
  'Mist' : 01,
  'Smoke': 09,
  'Haze': 02,
  'Dust': 07,
  'Fog': 05,
  'Ash': 02,
  'Sand': 07,
  'Squall': 04,
  'Tornado': 07,
  'Clear': 06,
  'Clouds': 05,
};

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 30) {
      return 'It\'s 🍦 time';
    } else if (temp > 15 && temp <=30) {
      return 'Time for shorts and 👕';
    } else if (temp <= 15 && temp >=5) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
