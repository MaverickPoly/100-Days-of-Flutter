import "package:flutter/material.dart";
import "package:lottie/lottie.dart";
import "package:weather/weather_service.dart";


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cityController = TextEditingController();
  final WeatherService weatherService = WeatherService();
  final Map<String, String> lottiePaths = {
    "sun": "https://lottie.host/02b69ae5-3e70-4162-9ce0-14b46aef79f0/D9vhoiacNU.json",
    "rain": "https://lottie.host/51289174-fd9d-4814-acfa-a77b89bc80be/kny1KlJA9r.json",
    "cloud": "https://lottie.host/7305cd73-eab1-447b-a365-bc2898d21372/hiqaQfcvYl.json",
    "snow": "https://lottie.host/341cab54-e59e-42eb-bf72-3f3953fb1391/5FrCe6COad.json",
    "thunder": "https://lottie.host/d110331f-00dd-4abf-8d14-abe2127f9e1e/je2QLIijpF.json",
    "cloudy": "https://lottie.host/7daf421d-23dd-4508-a21f-69ede0ae3292/ftaQ0THJkL.json",
  };
  Map<String, String> weatherData = {
    "cityName": "City",
    "temperature": "0.0",
    "humidity": "0.0",
    "wind_speed": "0.0",
    "pressure": "0.0",
    "description": "Unknown"
  };


  void fetchWeather() async {
    if (cityController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please specify a city name!")
        )
      );
    }
    else {
      try {
        final result = await weatherService.fetchWeatherData(cityController.text);
        setState(() {
          weatherData = result;
        });
      } catch(error) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to fetch data: $error"),
          ),
        );
      }
    }
  }

  String? getWeatherIcon() {
    switch (weatherData["description"]) {
      case "clear sky":
        return lottiePaths["sun"];
      case "few clouds":
        return lottiePaths["cloudy"];
      case "scattered clouds":
      case "broken clouds":
        return lottiePaths["cloud"];
      case "shower rain":
      case "rain":
        return lottiePaths["rain"];
      case "thunderstorm":
        return lottiePaths["thunder"];
      case "snow":
        return lottiePaths["snow"];
      default:
        return lottiePaths["cloudy"];
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text("Weather app"),
          elevation: 0,
          backgroundColor: Colors.grey.shade400,
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchWeather,
          child: const Icon(Icons.send),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextField(
                  controller: cityController,
                  decoration: InputDecoration(
                    labelText: "City...",
                    labelStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 2,
                      )
                    )
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${weatherData["cityName"]}', style: const TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold)),
                      Lottie.network(getWeatherIcon() ?? "https://lottie.host/7daf421d-23dd-4508-a21f-69ede0ae3292/ftaQ0THJkL.json", width: 150, height: 150),
                      const SizedBox(height: 20),
                      Text("Temperature: ${weatherData['temperature']} °C", style: const TextStyle(color: Colors.black, fontSize: 18)),
                      Text("Humidity: ${weatherData['humidity']}", style: const TextStyle(color: Colors.black, fontSize: 18)),
                      Text("Wind Speed: ${weatherData['wind_speed']} km/h", style: const TextStyle(color: Colors.black, fontSize: 18)),
                      Text("Pressure: ${weatherData['pressure']}", style: const TextStyle(color: Colors.black, fontSize: 18)),

                      const SizedBox(height: 20),
                      Text("${weatherData['description']}", style: TextStyle(color: Colors.black.withOpacity(0.7
                      ), fontSize: 16),)
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
