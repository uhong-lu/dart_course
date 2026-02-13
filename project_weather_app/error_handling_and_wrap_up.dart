// // GOAL : Add error handling

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'weather.dart';

// class WeatherApiException implements Exception {
//   const WeatherApiException(this.message);
//   final String message;
// }

// class Weather {
//   const Weather({
//     required this.weatherState,
//     required this.minTemp,
//     required this.maxTemp,
//     required this.temp,
//   });
//   final String weatherState;
//   final double minTemp;
//   final double maxTemp;
//   final double temp;
//   factory Weather.fromJson(Map<String, Object?> json) => Weather(
//     weatherState: json['weather_state_name'] as String,
//     minTemp: json['min_temp'] as double,
//     maxTemp: json['max_temp'] as double,
//     temp: json['the_temp'] as double,
//   );

//   @override
//   String toString() => '''
// Weather State: $weatherState
// Min Temp: ${minTemp.toStringAsFixed(1)}°C
// Max Temp: ${maxTemp.toStringAsFixed(1)}°C
// Current Temp: ${temp.toStringAsFixed(1)}°C
// ''';
// }



// class WeatherApiClient {
//   static const baseUrl = 'https://www.metaweather.com/api';

//   Future<int> getLocationId(String city) async {
//     final locationUrl = Uri.parse('$baseUrl/location/search/?query=$city');
//     final locationResponse = await http.get(locationUrl);
//     if (locationResponse.statusCode != 200) {
//       throw WeatherApiException('Error getting locationID for city: $city');
//     }
//     final locationJson = jsonDecode(locationResponse.body) as List; 
//     if(locationJson.isEmpty){
//       throw WeatherApiException('No location found for city: $city');
//     }
//     return locationJson.first['woeid'] as int; 
//   }

//   Future<Weather> fetchWeather(int locationId) async {
//     final weatherUrl = Uri.parse('$baseUrl/location/$locationId/');
//     final weatherResponse = await http.get(weatherUrl);
//     if (weatherResponse.statusCode != 200) {
//       throw WeatherApiException('Error getting weather for locationID: $locationId');
//     }
//     final weatherJson = jsonDecode(weatherResponse.body);
//     final consolidatedWeather = weatherJson['consolidated_weather'] as List;
//     if (consolidatedWeather.isEmpty) {
//       throw WeatherApiException('No weather data found for locationID: $locationId');
//     }
//     return Weather.fromJson(consolidatedWeather[0]);
//   }

//   Future<Weather> getWeather(String city) async {
//     final locationId = await getLocationId(city);
//     return fetchWeather(locationId);
//   }
// }



// Future<void> main(List<String> arguments) async {
//   if(arguments.length != 1){
//     print('Syntax: dart bin/main.dart <city>');
//     return;
//   }
//   final city = arguments.first;
//   final api = WeatherApiClient();
//   try {
//     final weather = await api.getWeather(city);
//     print(weather);
//   } on WeatherApiException catch (e) {
//     print('Error: ${e.message}');
//   } on SocketException catch (_) {
//     print(' Could not fetch data. Check your connection. ');
//   } catch (e) {
//     print('An unexpected error occurred: $e');
//   }
// }