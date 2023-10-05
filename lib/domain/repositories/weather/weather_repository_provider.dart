import 'package:hooks_riverpod/hooks_riverpod.dart';


import '../../../data/data_sources/remote/weather/remote/remote_data_source_provider.dart';
import '../../../data/repositories/weather/weather_repository_impl.dart';
import 'weather_repository.dart';

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return WeatherRepositoryImpl(
      weatherRemoteDataSource: ref.watch(weatherRemoteDataSourceProvider));
});
