import 'location.dart';
import 'networking.dart';

const KEY = '721d8eb6ecf67b61c2c2e1ca8527b07a';
const baseURL = 'https://api.openweathermap.org/data/2.5/weather';

class OpenWeather {
  Future<dynamic> getLocationWeather() async {
    Location loc = Location();
    await loc.getLocation();
    Networking http = Networking();
    return await http.request(
        '$baseURL?lat=${loc.lat}&lon=${loc.lon}&appid=$KEY&units=metric');
  }

  Future<dynamic> getCityWeather(String city) async {
    Networking http = Networking();
    return await http.request('$baseURL?q=$city&appid=$KEY&units=metric');
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
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
