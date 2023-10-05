import 'package:go_router/go_router.dart';

import '../presentation/pages/Counter/counter_page.dart';
import '../presentation/pages/Home/home_page.dart';
import '../presentation/pages/counterHive/counterHive_page.dart';
import '../presentation/pages/weather/weather_page.dart';

// GoRouter configuration
final router_ = GoRouter(
  initialLocation: HomePage.route,
  routes: [
    GoRoute(
      name: 'home',
      path: HomePage.route,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: 'weather',
      path: WeatherDisplay.route,
      builder: (context, state) => const WeatherDisplay(),
    ),
    GoRoute(
      name: 'counter',
      path: CounterPage.route,
      builder: (context, state) => const CounterPage(),
    ),
    GoRoute(
      name: 'counter hive',
      path: CounterHivePage.route,
      builder: (context, state) => const CounterHivePage(),
    ),
  ],
);
