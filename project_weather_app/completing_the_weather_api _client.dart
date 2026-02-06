// import 'dart:convert';
// import 'package:http/http.dart' as http;


// class Weather {
//   factory Weather.fromJson(Map<String, Object?> json){
//     throw UnimplementedError(); // temporary code
//   }
// }



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

//   Future<Weather> fetchWeather(int locationId) async {
//     final weatherUrl = Uri.parse('$baseUrl/location/$locationId/');
//     final weatherResponse = await http.get(weatherUrl);
//     if (weatherResponse.statusCode != 200) {
//       throw Exception('Error getting weather for locationID: $locationId');
//     }
//     print(weatherResponse.body);
//     final weatherJson = jsonDecode(weatherResponse.body);
//     return Weather.fromJson(weatherJson);
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
//   final weather = await api.getWeather(city);
// }










// 1. 套件引入與資料模型 (Packages & Models)
// // 1. 引入內建的轉換庫，用來處理 JSON (jsonDecode)
// import 'dart:convert';

// // 2. 引入第三方的 http 套件，並取一個別名叫做 'http'
// // 這樣我們呼叫時就可以寫 http.get()，比較不會跟其他名稱衝突
// import 'package:http/http.dart' as http;

// // 3. 定義天氣資料模型
// class Weather {
//   // 工廠建構子 (Factory Constructor)
//   // 負責接收一個 Map (JSON 物件)，並產出一個 Weather 實例
//   factory Weather.fromJson(Map<String, Object?> json){
//     // 目前還沒實作轉換邏輯，所以先拋出一個「未實作錯誤」
//     // 這在開發初期很常見，先佔位，之後再補上
//     throw UnimplementedError(); 
//   }
// }



// 2. API 客戶端邏輯 (Async/Await & HTTP)
// class WeatherApiClient {
//   // 定義 API 的基礎網址，設為 static const 節省記憶體
//   // (註: metaweather 網站目前已停止服務，但我們以此學習邏輯)
//   static const baseUrl = 'https://www.metaweather.com/api';

//   // [功能 A] 取得城市 ID
//   // 回傳 Future<int>，代表「未來會拿到一個整數」
//   Future<int> getLocationId(String city) async {
//     // 1. 組合網址：將字串轉為 Uri 物件
//     final locationUrl = Uri.parse('$baseUrl/location/search/?query=$city');
    
//     // 2. 發送請求：使用 await 等待網路回應
//     final locationResponse = await http.get(locationUrl);
    
//     // 3. 檢查狀態碼：200 代表成功 (OK)
//     if (locationResponse.statusCode != 200) {
//       throw Exception('Error getting locationID for city: $city');
//     }
    
//     // 4. 解析 JSON：將回應的文字 (body) 轉成 Dart 物件 (這裡是 List)
//     final locationJson = jsonDecode(locationResponse.body) as List; 
    
//     // 5. 提取資料：拿清單的第一個項目，取出 'woeid' 欄位，並強制轉型為 int
//     return locationJson.first['woeid'] as int; 
//   }

//   // [功能 B] 取得天氣資訊
//   Future<Weather> fetchWeather(int locationId) async {
//     final weatherUrl = Uri.parse('$baseUrl/location/$locationId/');
//     final weatherResponse = await http.get(weatherUrl);

//     if (weatherResponse.statusCode != 200) {
//       throw Exception('Error getting weather for locationID: $locationId');
//     }
    
//     // 這裡把 API 回傳的原始文字印出來看看
//     print(weatherResponse.body);

//     // 解析 JSON 並呼叫我們剛剛定義的工廠建構子
//     final weatherJson = jsonDecode(weatherResponse.body);
//     return Weather.fromJson(weatherJson);
//   }

//   // [功能 C] 整合函式
//   // 把上面兩個步驟串起來：先拿 ID -> 再拿天氣
//   Future<Weather> getWeather(String city) async {
//     final locationId = await getLocationId(city);
//     return fetchWeather(locationId);
//   }
// }




// 3. 主程式流程 (Main Execution)
// // main 也是 async，因為它需要等待 API 回傳
// Future<void> main(List<String> arguments) async {
//   // 1. 檢查使用者有沒有輸入城市名稱
//   // arguments 是從命令列傳進來的參數，例如: dart main.dart London
//   if(arguments.length != 1){
//     print('Syntax: dart bin/main.dart <city>');
//     return;
//   }
  
//   final city = arguments.first;
  
//   // 2. 實例化 API 客戶端
//   final api = WeatherApiClient();
  
//   // 3. 呼叫整合函式，並等待結果
//   // 這裡的 await 很重要，沒有它程式會直接結束，你就拿不到天氣了
//   final weather = await api.getWeather(city);
// }