import 'package:flutter/material.dart';
import 'package:weather_app/models/meteo.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({
    super.key,
    required this.dataSerie,
    required this.initDateTime,
  });

  final DataSerie dataSerie;
  final DateTime initDateTime;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = initDateTime.add(Duration(hours: dataSerie.timepoint));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                "Dia ${dateTime.day}",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                "${dateTime.hour.toString().padLeft(2, "0")}:${dateTime.minute.toString().padLeft(2, "0")}",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Icon(dataSerie.icon, size: 32, color: Colors.blue),
          Text(
            "${dataSerie.temp2M} ºC",
            style: const TextStyle(
              fontSize: 24,
            ),
          )
        ],
      ),
    );
  }
}
