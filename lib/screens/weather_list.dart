import 'package:flutter/material.dart';
import 'package:weather_app/models/meteo.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/widgets/forecast_widget.dart';

class WeatherList extends StatefulWidget {
  const WeatherList({super.key});

  @override
  State<WeatherList> createState() => _WeatherListState();
}

class _WeatherListState extends State<WeatherList> {
  WeatherService weatherService = WeatherService();
  Meteo? meteo;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    var localMeteo = meteo;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: (localMeteo == null)
          ? const CircularProgressIndicator()
          : ListView(
              children: [
                for (var dataSerie in localMeteo.dataseries)
                  ForecastWidget(
                    dataSerie: dataSerie,
                    initDateTime: localMeteo.initDateTime,
                  ),
              ],
            ),
    );
  }

  Future<void> init() async {
    meteo = await weatherService.fetchData();
    setState(() {});
  }
}
