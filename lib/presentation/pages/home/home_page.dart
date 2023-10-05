import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_clean_architecture_tdd/presentation/pages/counterHive/counterHive_page.dart';
import 'package:weather_clean_architecture_tdd/presentation/pages/weather/weather_page.dart';

import '../Counter/counter_page.dart';

class HomePage extends StatelessWidget {
  static const route = '/HomePage';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                context.push(WeatherDisplay.route);
              },
              child: const Text('weather'),
            ),
            const SizedBox(height: 20), // Add some spacing between the buttons
            ElevatedButton(
              onPressed: () {
                context.push(CounterPage.route);
              },
              child: const Text('counter'),
            ),
            const SizedBox(height: 20), // Add some spacing between the buttons
            ElevatedButton(
              onPressed: () {
                context.push(CounterHivePage.route);
              },
              child: const Text('counter hive'),
            ),
          ],
        ),
      ),
    );
  }
}
