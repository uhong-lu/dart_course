

Future<void> main() async{
  final stream = Stream.fromIterable([1, 2, 3]);
  // final value = await stream.first;
  // print(value);
  // await stream.forEach((element) => print(element));
  final doubles = stream.map((value) => value * 2).where((value) => value > 3);
  print(doubles);  // output : Instance of '_WhereStream<int>'
  await doubles.forEach(print);
}





// // main 函式標記為 async，因為我們需要等待 Stream 處理完畢
// Future<void> main() async {
  
//   // 1. 建立 Stream (資料源)
//   // 將 List [1, 2, 3] 轉成一個會依序吐出數字的 Stream
//   final stream = Stream.fromIterable([1, 2, 3]);

//   // --- 比較區塊 (已註解) ---
//   // A. 只取第一個值
//   // final value = await stream.first;
//   // print(value);

//   // B. 單純印出所有值
//   // await stream.forEach((element) => print(element));
//   // -----------------------

//   // 2. 定義資料處理流程 (轉換 + 過濾)
//   // 這行程式碼像是在接水管，定義資料流動的規則，但還沒開始流動
//   final doubles = stream
//       .map((value) => value * 2)      // 第一關：把每個數字乘以 2
//       .where((value) => value > 3);   // 第二關：只留下大於 3 的數字

//   // 3. 印出 Stream 物件本身 (常見誤區)
//   print(doubles);  // output : Instance of '_WhereStream<int>'

//   // 4. 實際啟動並等待結果
//   // 使用 await 等待 forEach 把處理好的資料全部印出來
//   await doubles.forEach(print);
// }