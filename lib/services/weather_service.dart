import 'package:http/http.dart' as http;
import 'package:weather_app/models/meteo.dart';

class WeatherService {
  Future<Meteo> fetchData() async {
    http.Response data = await http.get(Uri.parse(
        "https://www.7timer.info/bin/civil.php?lon=2.0991666666667&lat=41.358888888889&ac=0&unit=metric&output=json"));

    Meteo meteo = meteoFromJson(data.body);

    return meteo;
  }
}
