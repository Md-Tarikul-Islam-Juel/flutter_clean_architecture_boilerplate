

import 'package:weather_clean_architecture_tdd/data/models/weather/weather_model.dart';





abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String cityName);
}

