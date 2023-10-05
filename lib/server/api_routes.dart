class APIRoute {
  static const String dummyPerosn = 'https://i.pravatar.cc/300';
  static const String webURL = "";
  static const String baseURL = "";
  static const String apiV1 = "api/";

  static const String home = "${apiV1}home";
}

class Urls {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String apiKey = 'cc95d932d5a45d33a9527d5019475f2c';
  static String currentWeatherByName(String city) =>
      '$baseUrl/weather?q=$city&appid=$apiKey';
  static String weatherIcon(String iconCode) =>
      'http://openweathermap.org/img/wn/$iconCode@2x.png';
}