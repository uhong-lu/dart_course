/// two most important classes are Future and Stream in asynchronous programming
// Future represents a computation that doesn't complete immediately
// we can write asynchronous functions that return a 'Future'
// we can await until the result is ready

/// 'Stream' is a sequence of asynchronous events
// you can think of a stream as an asynchronous 'iterable' where events are delivered over time , rather than when you ask for them
// various way to create and add items to a 'Stream' 
// one way to do this , is to generate a stream from an 'iterable'
// another way is to use a stream generator, which is a function that uses 'async' and 'yield' can also use 'StreamController' which give us more control how we add items to the Stream

// 在 Dart 與 Flutter 的開發世界中，Stream（串流） 是一個非常核心且強大的觀念。如果說 Future 代表的是「未來的一個單一數值」，那麼 Stream 就代表「未來的一系列數值」。

// 你可以把它想像成一個輸送帶或水管：資料會不斷地從一端流進來，而你則在另一端「監聽」並處理這些資料。

// 核心觀念：Future vs. Stream
// 為了讓你更直觀地理解，我們可以做個簡單的對比：

// Future: 像是在餐廳點餐。你下單後（發出請求），需要等一段時間，最後服務生會送來「一份」餐點（一個結果）。

// Stream: 像是在迴轉壽司店。你坐在位子上，輸送帶會源源不絕地送來「很多份」壽司（一系列結果），你不知道什麼時候會有新的壽司過來，但只要有壽司經過，你就可以決定要不要拿起來處理。

// Stream 的運作機制
// 一個完整的 Stream 流程通常包含三個角色：

// StreamSource (來源)：產生資料的地方（例如：感應器數據、Firebase 即時資料庫、使用者點擊事件）。

// Stream (水管)：資料傳輸的通道。

// Subscriber (訂閱者)：負責監聽（listen）並處理資料的人。

// 常見的兩種類型
// 單一訂閱 (Single-subscription Streams)： 最常見的類型。整個生命週期只允許一個監聽者。一旦開始讀取資料，就不能再有其他人來聽（例如：下載檔案）。

// 多重廣播 (Broadcast Streams)： 允許多個監聽者同時存在。就像廣播電台，任何人只要切換到那個頻道，都能聽到正在播放的內容（例如：手機的 GPS 定位更新）。

// 如何使用 Stream？
// 在 Dart 中，處理 Stream 主要有兩種方式：

// 1. 使用 listen()
// 這是最直接的方法，當有新資料流入時，會觸發回呼函數（Callback）。

// Dart
// stream.listen((data) {
//   print('收到資料: $data');
// }, onError: (err) {
//   print('發生錯誤: $err');
// }, onDone: () {
//   print('串流結束');
// });
// 2. 使用 await for
// 如果你在 async 函式中，可以使用非同步迴圈來處理，這讓程式碼看起來更像同步代碼。

// Dart
// Future<void> processStream(Stream<int> numbers) async {
//   await for (var value in numbers) {
//     print('目前數值: $value');
//   }
//   print('所有資料處理完畢');
// }
// Stream 的實際應用場景
// 在你的 Flutter 開發中，Stream 經常出現在以下地方：

// 使用者輸入監聽：例如監聽搜尋框文字的即時變化。

// Firebase / WebSocket：接收後端主動推送的即時訊息（如聊天室）。

// 計時器 (Timer)：每秒更新一次倒數計時。

// BLoC 模式：在 Flutter 的狀態管理中，BLoC 完全是建立在 Stream 之上的，用來傳遞 UI 狀態。









// await for loop
Future<int> sumStream(Stream<int> Stream) async{
  var sum = 0;
  await for (var value in Stream){
    sum += value;
  }
  return sum;
}

// 'reduce' method
Future<int> sumStream2(Stream<int> stream) =>  //this returns a Future<int>
    stream.reduce((previous, element) => previous + element);  //this syntax is identical to what we would write if we were using an iterable // the stream 'reduce' method will wait for each event in the stream to become avaible before calling the combine function // since this function returns a 'Future' and 'stream.reduce' also returns a future.
    // we don't need to a pair of 'await/async' keywords // we can just return this as an expression

Future<void> main() async {
  final stream = Stream<int>.fromIterable([1,2,3,4]);
  final sum = await sumStream(stream);
  final sum2 = await sumStream2(stream);
  print('Sum: $sum');
  print('Sum2: $sum2');
}









// 核心重點分析
// 非同步雙核心：Future 與 Stream 是非同步程式設計中最關鍵的兩個類別。

// Future (單一結果)：

// 代表一個不會立即完成的運算。

// 非同步函數可回傳 Future，並透過 await 等待最終結果。

// Stream (序列結果)：

// 定義為非同步事件的「序列」。

// 性質：可視為非同步的 Iterable（可迭代對象），事件是隨時間主動「傳送」過來，而非被動請求。

// 創建方式：

// 從既有的 Iterable 生成。

// 使用 Stream Generator（搭配 async* 與 yield）。

// 使用 StreamController 獲得更精細的控制權。

// 2. 講者語氣：精煉演說稿
// 「在非同步開發裡，請務必掌握 Future 和 Stream。簡單來說，Future 處理的是單次延遲回傳，我們用 await 等它算完；而 Stream 則像是一個非同步的序列，資料會隨時間流轉主動送達。你可以透過 Iterable 轉換、async* 產生器，或是利用 StreamController 來精準控管數據的生成與傳遞。」