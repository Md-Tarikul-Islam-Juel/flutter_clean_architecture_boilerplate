import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_clean_architecture_tdd/data/data_sources/remote/weather/remote/remote_data_source.dart';

import '../../../../../core/error/exception.dart';

import '../../../../../server/api_routes.dart';
import '../../../../models/weather/weather_model.dart';


class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {
  final http.Client client;

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    final response =
        await client.get(Uri.parse(Urls.currentWeatherByName(cityName)));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
