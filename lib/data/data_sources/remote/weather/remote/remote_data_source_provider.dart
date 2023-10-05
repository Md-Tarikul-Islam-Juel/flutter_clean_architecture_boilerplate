import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:weather_clean_architecture_tdd/data/data_sources/remote/weather/remote/remote_data_source_impl.dart';

final httpProvider = Provider((ref) => http.Client());

final weatherRemoteDataSourceProvider = Provider<WeatherRemoteDataSourceImpl>(
  (ref) {
    final client = ref.watch(httpProvider);
    return WeatherRemoteDataSourceImpl(client: client);
  },
);
