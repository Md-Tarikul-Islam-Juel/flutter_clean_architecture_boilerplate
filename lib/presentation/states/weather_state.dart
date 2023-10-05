import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/usecases/weather_usecase/get/get_current_weather_provider.dart';
import '../../domain/usecases/weather_usecase/get/get_current_weather_usecase.dart';

class Weather {
  final String cityName;
  final String main;
  final String description;
  final String iconCode;
  final double temperature;
  final int pressure;
  final int humidity;

  Weather({
    required this.cityName,
    required this.main,
    required this.description,
    required this.iconCode,
    required this.temperature,
    required this.pressure,
    required this.humidity,
  });
}

class WeatherNotifier extends StateNotifier<Weather> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;

  WeatherNotifier({
    required this.getCurrentWeatherUseCase,
  }) : super(Weather(
          cityName: '',
          main: '',
          description: '',
          iconCode: '',
          temperature: 0.0,
          pressure: 0,
          humidity: 0,
        ));

  Future<void> fetchWeather() async {
    try {
      // Fetch weather data using the use case
      final weatherDataResult =
          await getCurrentWeatherUseCase.execute("New York");

      // Check if the result is a success
      weatherDataResult.fold(
        (failure) {
          // Handle the failure here (e.g., show an error message)
          print("Error fetching weather: $failure");
        },
        (weatherData) {
          // Map the fetched data to your Weather model
          final weather = Weather(
            cityName: weatherData.cityName,
            main: weatherData.main,
            description: weatherData.description,
            iconCode: weatherData.iconCode,
            temperature: weatherData.temperature,
            pressure: weatherData.pressure,
            humidity: weatherData.humidity,
          );

          // Update the state with the fetched weather data
          state = weather;
        },
      );
    } catch (e) {
      // Handle any other errors that may occur
      print("Error: $e");
    }
  }
}



final weatherProvider = StateNotifierProvider<WeatherNotifier, Weather>(
  (ref) {
    return WeatherNotifier(
      getCurrentWeatherUseCase: ref.watch(getCurrentWeatherUseCaseProvider),
    );
  },
);
