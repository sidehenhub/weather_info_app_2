import 'package:flutter/material.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
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


  Map<String, String> mockWeatherData = {
    'Paris': 'Temperature: 35 °C\nWeather: Clear Sky',
    'Dallas': 'Temperature: 20 °C\nWeather: Light Rain',
    'Houston': 'Temperature: 45 °C\nWeather: Sunny',
    'Cupertino': 'Temperature: 15 °C\nWeather: Light Rain',
  };

  void fetchWeather(String city) {
    
    if (mockWeatherData.containsKey(city)) {
      setState(() {
        _weatherData = mockWeatherData[city]!;
      });
    } else {
      setState(() {
        _weatherData = 'City not found';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
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
            ElevatedButton(
              onPressed: () {
                fetchWeather(_controller.text.trim());
              },
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 20),
            Text(
              _weatherData,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
