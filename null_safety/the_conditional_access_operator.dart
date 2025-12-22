void main(){
  const cities = <String?>['London','Paris', null];
  for (var city in cities) {
    print(city?.toUpperCase()); //conditional access operator
  }
}

// // 程式的進入點，Dart 執行時會從這裡開始
// void main() {
  
//   // [ const cities ]：宣告一個編譯時常數（不可修改）的清單。
//   // [ <String?> ]：明確指定內容物型別為「可為空的字串」。
//   // 這裡放入了 'London'、'Paris' 以及一個實際的 null (空值)。
//   const cities = <String?>['London', 'Paris', null];

//   // [ for (var city in cities) ]：使用 for-in 迴圈遍歷清單。
//   // 此時 city 的型別被推斷為 String?，代表它隨時可能是 null。
//   for (var city in cities) {
    
//     // [ print(...) ]：將結果印在螢幕上。
//     // [ city?.toUpperCase() ]：這是本課的主角「條件存取操作符」。
//     // 運作邏輯：
//     // 1. 如果 city 不是 null，則執行 .toUpperCase() 方法並回傳結果（如 'LONDON'）。
//     // 2. 如果 city 是 null，則「停止前進」，不執行方法，直接回傳一個 null。
//     // 這樣做的好處是：程式不會因為對 null 呼叫方法而閃退。
//     print(city?.toUpperCase()); 
//   }
// }