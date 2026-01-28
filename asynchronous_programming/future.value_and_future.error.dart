// why should use a 'Future' if we want to return a value or throw an error immediately?
// sometimes this is useful when you're designing a Future based API but you're not ready to write the final code
// this case you can use 'Future.error' and use 'UnimplementedError' as a placeholder
// also 'Future.value' is useful when you want to return a value immediately without any delay

Future<String> fetchUserOrder() => Future.delayed(
  Duration(seconds: 2),
  () => 'Cappuccino',
);

// Future.value // Use Future.value if you want to create a 'Future' that completes immediately
Future<String> fetchUserOrder2() => Future.value('Espresso');

// Future.error //get an exception immediately
Future<String> fetchUserOrder3() => Future.error(Exception('Out of milk'));



Future<void> main()async{
  print('Program started');
  try{
    final order = await fetchUserOrder();
    print(order);
    final order2 = await fetchUserOrder2();
    print(order2);
    final order3 = await fetchUserOrder3();
    print(order3);
  } catch(e){
    print(e);
  } print('Done');
}









// 1. 為什麼需要「立即」回傳 Future？
// 在我們寫程式時，通常 Future 是用來處理「慢」的事情（如下載檔案）。但有時候我們需要一個 Future，卻不需要等待。這常見於以下兩種情況：

// 快取 (Caching)：資料已經下載過了，存在記憶體裡，可以直接拿出來，不需要再去網路撈。

// 佔位 (Placeholder) / 測試：你還沒寫好複雜的邏輯，但為了讓程式能跑起來，先隨便回傳一個假資料或假錯誤。

// 2. 程式碼功能解析
// 程式碼區塊
// Dart
// // 1. 標準做法：模擬耗時任務 (等待 2 秒)
// Future<String> fetchUserOrder() => Future.delayed(
//   Duration(seconds: 2),
//   () => 'Cappuccino',
// );

// // 2. Future.value：建立一個立即完成並成功的 Future
// Future<String> fetchUserOrder2() => Future.value('Espresso');

// // 3. Future.error：建立一個立即拋出異常的 Future
// Future<String> fetchUserOrder3() => Future.error(Exception('Out of milk'));
// 重點觀念解析
// fetchUserOrder (標準版)：

// 這是我們熟悉的 Future.delayed。

// 特點：它會真的暫停（非阻塞式），直到 Duration 設定的時間到了才回傳結果。

// fetchUserOrder2 (立即成功版)：

// 語法：Future.value('Espresso')。

// 運作：它是一個 工廠建構子 (Factory Constructor)。它不需要等待時間，會建立一個已經包裝好字串 'Espresso' 的 Future 物件。

// 意義：這就像你走進咖啡店，老闆直接把現成的濃縮咖啡遞給你，不用等沖泡。

// fetchUserOrder3 (立即失敗版)：

// 語法：Future.error(...)。

// 運作：它建立一個狀態為「失敗」的 Future。

// Exception：這是一個代表「例外狀況」的物件。這裡用來描述具體的錯誤原因（沒牛奶了）。

// 3. 主程式流程控制 (Main Flow)
// 程式碼區塊
// Dart
// Future<void> main() async {
//   print('Program started'); // 步驟 A
//   try {
//     // 步驟 B: 等待一般任務
//     final order = await fetchUserOrder();
//     print(order);

//     // 步驟 C: 等待立即成功的任務
//     final order2 = await fetchUserOrder2();
//     print(order2);

//     // 步驟 D: 等待立即失敗的任務
//     final order3 = await fetchUserOrder3();
//     print(order3); // 這行不會被執行！

//   } catch(e) {
//     // 步驟 E: 捕捉錯誤
//     print(e);
//   }
//   print('Done'); // 步驟 F
// }
// 重點觀念解析
// async 與 await 的順序性：

// 程式碼雖然看起來是一整塊，但 await 會確保「上面做完，才做下面」。

// 所以 fetchUserOrder2 雖然是「立即完成」，但它必須乖乖排隊，等 fetchUserOrder 那個 2 秒結束後，才輪得到它登場。

// try-catch 的保護網：

// 當程式跑到 await fetchUserOrder3() 時，因為這個 Future 帶著錯誤，它會立刻**「引爆」**。

// 流程中斷：引爆點之後的程式碼（print(order3)）會直接被跳過。

// 捕捉：控制權會瞬間轉移到 catch(e) 區塊，變數 e 就是那個 'Out of milk' 的錯誤物件。

// 4. 執行結果分析 (Output Analysis)
// 執行這段程式碼，你會依序看到以下結果：

// Plaintext
// Program started
// (停頓約 2 秒...)
// Cappuccino
// Espresso
// Exception: Out of milk
// Done
// 為什麼是這個順序？
// Program started：程式一啟動立刻印出。

// Cappuccino：

// 程式在 await fetchUserOrder() 暫停了 2 秒。

// 2 秒後拿到卡布奇諾，印出。

// Espresso：

// 緊接著執行 await fetchUserOrder2()。

// 因為是用 Future.value，幾乎沒有等待（微任務等級的瞬間），馬上拿到濃縮咖啡並印出。

// Exception: Out of milk：

// 執行 await fetchUserOrder3()。

// 這個 Future 是一個錯誤炸彈。

// await 拆開包裹發現是炸彈，拋出異常，直接跳進 catch 區塊把錯誤印出來。

// Done：

// try-catch 結束後，程式繼續往下走，印出結束訊號。

// 導師的小叮嚀
// 比較：你看，Future.value 和 Future.delayed 在 await 的使用上語法完全一樣！這就是 Dart 設計的高明之處——不管背後是快是慢，使用者的寫法都是統一的。

// 注意：Future.error 非常好用，特別是在寫 API 時。如果你發現使用者的輸入根本不合法（例如點了一杯負 50 元的咖啡），你可以直接回傳 Future.error，連網路請求都不用發送，節省資源！