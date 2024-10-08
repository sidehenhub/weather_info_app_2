import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Info App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _weatherData = '';
  String _forecastData = '';


  final Random _random = Random();

  void fetchWeather(String city) {
    if (city.isNotEmpty) {
      int temperature = _random.nextInt(16) + 15; 

      
      List<String> weatherConditions = ['Sunny', 'Cloudy', 'Rainy'];
      String weather = weatherConditions[_random.nextInt(weatherConditions.length)];

      setState(() {
        _weatherData = 'City: $city\nTemperature: $temperature °C\nWeather: $weather';
      });
    } else {
      setState(() {
        _weatherData = 'Please enter a city name';
      });
    }
  }

  void fetchForecast() {
    List<String> forecast = [];
    List<String> weatherConditions = ['Sunny', 'Cloudy', 'Rainy'];

    for (int i = 0; i < 7; i++) {
      int temperature = _random.nextInt(16) + 15; 
      String weather = weatherConditions[_random.nextInt(weatherConditions.length)];
      forecast.add('Day ${i + 1}: Temperature: $temperature °C, Weather: $weather');
    }

    setState(() {
      _forecastData = forecast.join('\n');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Info App Activity'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter city name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                fetchWeather(_controller.text.trim());
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.blue), 
              ),
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                fetchForecast();
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.blue), 
              ),
              child: Text('Fetch 7-Day Forecast'),
            ),
            SizedBox(height: 20),
            Text(
              _weatherData,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              _forecastData,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
