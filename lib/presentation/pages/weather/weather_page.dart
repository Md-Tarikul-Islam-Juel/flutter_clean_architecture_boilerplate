import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../states/weather_state.dart';

class WeatherDisplay extends HookConsumerWidget {
  static const route = '/weatherPage';

  const WeatherDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(weatherProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Display Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            WeatherInfo(weather: weather),
            ElevatedButton(
              onPressed: () {
                ref.read(weatherProvider.notifier).fetchWeather();
              },
              child: const Text('Fetch Weather'),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherInfo extends StatelessWidget {
  final Weather weather;

  WeatherInfo({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('City: ${weather.cityName}'),
        Text('Main: ${weather.main}'),
        Text('Description: ${weather.description}'),
        Text('Icon Code: ${weather.iconCode}'),
        Text('Temperature: ${weather.temperature.toStringAsFixed(2)}°C'),
        Text('Pressure: ${weather.pressure} hPa'),
        Text('Humidity: ${weather.humidity}%'),
      ],
    );
  }
}
