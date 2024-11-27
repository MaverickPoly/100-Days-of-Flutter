import "dart:convert";
import "package:http/http.dart" as http;

class WeatherService {
  final String apiKey = "";
  // https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=${API_KEY}
  Future<Map<String, String>> fetchWeatherData(String cityName) async {
    final url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        print(response.body);
        final data = json.decode(response.body);

        final Map<String, String> weatherData = {
          "temperature": (data["main"]["temp"] - 273.15).toStringAsFixed(1),
          "description": data["weather"][0]["description"],
          "humidity": data["main"]["humidity"].toString(),
          "wind_speed": data["wind"]["speed"].toString(),
          "pressure": data["main"]["pressure"].toString(),
          "cityName": data["name"].toString()
        };

        return weatherData;
      } else {
        throw Exception("Failed to load weather data");
      }
    } catch (error) {
      throw Exception("Error fetching weather data: $error");
    }
  }
}
