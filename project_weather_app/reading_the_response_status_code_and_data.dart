import 'dart:convert';

// import 'package:http/http.dart' as http;

// // ver1
// class WeatherApiClient {
//   static const baseUrl = 'https://www.metaweather.com/api';

//   Future<int> getLocationId(String city) async {
//     final locationUrl = Uri.parse('$baseUrl/location/search/?query=$city');
//     final locationResponse = await http.get(locationUrl);
//     if (locationResponse.statusCode != 200) {
//       throw Exception('Error getting locationID for city: $city');
//     }
//     final locationJson = jsonDecode(locationResponse.body);
//     print(locationJson);
//     return 0;  // temporary code
//   }
// }

// ver1
// void main(List<String> arguments) {
//   if(arguments.length != 1){
//     print('Syntax: dart bin/main.dart <city>');
//     return;
//   }
//   final city = arguments.first;
//   final weatherApiClient = WeatherApiClient();
//   weatherApiClient.getLocationId(city);
// }


// // ver2
// class WeatherApiClient {
//   static const baseUrl = 'https://www.metaweather.com/api';

//   Future<int> getLocationId(String city) async {
//     final locationUrl = Uri.parse('$baseUrl/location/search/?query=$city');
//     final locationResponse = await http.get(locationUrl);
//     if (locationResponse.statusCode != 200) {
//       throw Exception('Error getting locationID for city: $city');
//     }
//     final locationJson = jsonDecode(locationResponse.body) as List; 
//     return locationJson.first['woeid'] as int; 
//   }
// }


// // ver2
// void main(List<String> arguments) async {
//   if(arguments.length != 1){
//     print('Syntax: dart bin/main.dart <city>');
//     return;
//   }
//   final city = arguments.first;
//   final weatherApiClient = WeatherApiClient();
//   final locationID = await weatherApiClient.getLocationId(city);
//   print('Location ID for $city is $locationID');
// }










// // --- WeatherApiClient 類別實作 ---
// class WeatherApiClient {
//   static const baseUrl = 'https://www.metaweather.com/api';

//   // 定義一個非同步方法，回傳型別為 Future<int>
//   Future<int> getLocationId(String city) async {
//     // 1. 解析網址
//     final locationUrl = Uri.parse('$baseUrl/location/search/?query=$city');
    
//     // 2. 發送 GET 請求，並等待回應
//     final locationResponse = await http.get(locationUrl);
    
//     // 3. 檢查狀態碼 (200 代表成功)
//     if (locationResponse.statusCode != 200) {
//       throw Exception('Error getting locationID for city: $city');
//     }
    
//     // 4. 解析 JSON 資料
//     // ver1: 僅解碼並列印
//     // ver2: 強制轉型為 List 並提取 woeid
//     final locationJson = jsonDecode(locationResponse.body) as List; 
    
//     if (locationJson.isEmpty) {
//       throw Exception('No location found for city: $city');
//     }

//     return locationJson.first['woeid'] as int; 
//   }
// }

// // --- Main 進入點 ---
// void main(List<String> arguments) async {
//   // 檢查命令列參數
//   if(arguments.length != 1){
//     print('Syntax: dart bin/main.dart <city>');
//     return;
//   }
  
//   final city = arguments.first;
//   final weatherApiClient = WeatherApiClient();
  
//   try {
//     // 使用 await 等待非同步結果
//     final locationID = await weatherApiClient.getLocationId(city);
//     print('Location ID for $city is $locationID');
//   } catch (e) {
//     print('Caught error: $e');
//   }
// }