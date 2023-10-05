import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../repositories/weather/weather_repository_provider.dart';
import 'get_current_weather_usecase.dart';

final getCurrentWeatherUseCaseProvider = Provider<GetCurrentWeatherUseCase>(
      (ref) {
    final weatherRepository = ref.watch(weatherRepositoryProvider);
    return GetCurrentWeatherUseCase(weatherRepository);
  },
);
