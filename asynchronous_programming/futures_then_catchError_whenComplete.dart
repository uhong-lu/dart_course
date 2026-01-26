// Summary
// Future<String>
// Future.delayed
// .then()
// .catchError()
// .whenComplete()

// Futures, then, catchError, whenComplete
// To follow along, add a pubspec.yaml file with the following contents to your project:
// name: test
// description: Async Programming
 
// environment:
//   sdk: '>=2.12.0 <4.0.0'
 
// dependencies:


//Example take user orders in a cafe
//the wat this works is that a user can place an order
//when this is ready, we can say that the order is comoplete

// //create a funtion that returns a Future of type String and call this fetchUserOrder
// // we want to simulate a delay of 2 seconds before the order is ready. So use the arrow notation and return Future.delayed
// Future<String> fetchUserOrder() => Future.delayed(  //Future.delayed is a factory constructor for the Future class
//   Duration(seconds: 2), //this works by adding a delay, and then returns a result using an anonymous function
//   () => 'Cappuccino',  // provide an anonymous function that will produce result
// ); // this Future produces a 'String' value


// void main(){
//   print('Program started');
//   fetchUserOrder().then((order) => print('Order is ready: $order')); //.then is a method that give us the result inside an anonymous function // we have one argument that we can call order
// }// this confirms that our program only produces this result when the Future completes



// //suppose that there was a problem and we can't fulfill the order because we're out of milk
// // we can do this inside this anonymous function by replacing this string with() 0 => throw Exception out of milk
// Future<String> fetchUserOrder() => Future.delayed( 
//   Duration(seconds: 2),
//   () => throw Exception('Out of milk'), 
// );


// void main(){
//   print('Program started');
//   fetchUserOrder().then((order) => print('Order is ready: $order')); //.then is a method that give us the result inside an anonymous function // we have one argument that we can call order
// } // we get an unhandled exception and this interrupts our program. How can we handle this?




// // add a new line and type .catchError after the then method
// Future<String> fetchUserOrder() => Future.delayed( 
//   Duration(seconds: 2),
//   () => throw Exception('Out of milk'), 
// );


// void main(){
//   print('Program started');
//   fetchUserOrder() 
//       .then((order) => print('Order is ready: $order'))
//       .catchError((error) => print('Caught an error: $error')); //this give us an error argument and we can use it ti print error
// } //this time the exception is printed // but it no longer interrupts the program because we're using 'catchError'





// Future<String> fetchUserOrder() => Future.delayed( 
//   Duration(seconds: 2),
//   () => throw Exception('Out of milk'), 
// );


// void main(){
//   print('Program started');
//   fetchUserOrder() 
//       .then((order) => print('Order is ready: $order'))
//       .catchError((error) => print('Caught an error: $error'))
//       // print('Done'); // we can see that Done is printed before the Exception out of milk this is not quite the order that we had in mind // we want to print Done after Future has completed
//       .whenComplete(() => print('Done')); // we want to run some code when the future completes, regardless of whether it returned a value, or threw an error // should use whenComplete() method and this gives us an anonymous function
// }// we can see that Done is printed after the error message






// if we want we can update the code inside our future so that it no longer throws an exception and it just returns 'Cappuccino' instead
Future<String> fetchUserOrder() => Future.delayed( 
  Duration(seconds: 2),
  () => 'Cappuccino', 
);


void main(){
  print('Program started');
  fetchUserOrder() 
      .then((order) => print('Order is ready: $order'))
      .catchError((error) => print('Caught an error: $error'))
      .whenComplete(() => print('Done')); // not the recommended way of working with Futures
} // we can see that things are still printed in the right order









// 核心概念解析
// 在深入程式碼前，我們先釐清三個重點：

// 數據的「去向」：Future 就像是一張「取餐收據」。數據現在還不在你手上，但承諾在「未來」的某個時間點會給妳。

// 記憶體的使用：當 Future 啟動時，它會被放入 Dart 的 Event Loop (事件迴圈) 中等待，不會阻塞（Block）主執行緒。這意味著 CPU 可以先去執行別的事（如：印出 "Program started"），直到時間到了再回頭處理結果。

// 語法結構：這是一種「鏈式調用（Chaining）」。每一層 .then 或 .catchError 都像是一個漏斗，接收上一步傳下來的結果或錯誤。

// 逐行程式碼解析
// 1. 定義非同步任務：Future.delayed
// Dart
// // 定義一個函數，回傳值是一個「未來會出現的字串」
// Future<String> fetchUserOrder() => Future.delayed( 
//   Duration(seconds: 2), // 延遲 2 秒，模擬製作咖啡的時間
//   () => 'Cappuccino',   // 匿名函數：2 秒後產生的結果（數據的源頭）
// ); 
// Future<String>: 這是類型宣告。它告訴系統：這不是普通的字串，而是一個包裹，裡面最終會裝著 String。

// Future.delayed: 工廠構造函數。它在記憶體中註冊了一個定時器，2 秒後才執行後面的匿名函數。

// 記憶體行為: 呼叫此函數時，系統會立即回傳一個「未完成」狀態的物件，主程式可以繼續往下走。

// 2. 處理成功結果：.then()
// Dart
// void main() {
//   print('Program started'); // 1. 先印出這行
//   fetchUserOrder().then((order) => print('Order is ready: $order')); 
// }
// .then((order) => ...): 這是監聽器。

// 數據去向: 當 Future 成功完成時，'Cappuccino' 會被傳遞給參數 order。

// 執行時機: 它不會立刻執行，而是等 2 秒後咖啡好了，才會被放入 Event Loop 執行。

// 3. 處理失敗異常：.catchError()
// 當程式碼改成 throw Exception('Out of milk') 時：

// Dart
// fetchUserOrder() 
//     .then((order) => print('Order is ready: $order'))
//     .catchError((error) => print('Caught an error: $error'));
// throw Exception: 模擬發生意外（沒牛奶了）。這時 Future 的狀態會從「成功」轉為「失敗」。

// 數據去向: 錯誤訊息會跳過 .then（因為沒有成功數據），直接墜落到 .catchError。

// 重要性: 如果不寫 catchError，程式會因為「未處理的異常」而崩潰；寫了之後，錯誤被捕捉，程式能優雅地繼續運行。

// 4. 無論成敗的終點：.whenComplete()
// Dart
// fetchUserOrder() 
//     .then((order) => print('Order is ready: $order'))
//     .catchError((error) => print('Caught an error: $error'))
//     .whenComplete(() => print('Done')); 
// .whenComplete(): 類似於 try...finally 中的 finally。

// 特點: 它不需要參數（不論是結果還是錯誤它都不關心），它只關心「這件事結束了沒」。

// 執行順序:

// Program started (立即)

// (等待 2 秒)

// Order is ready 或 Caught an error

// Done (最後)