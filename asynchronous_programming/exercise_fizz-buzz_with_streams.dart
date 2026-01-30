// Exercise
// Given the following function that implements the fizz-buzz algorithm:

// void fizzBuzz() {
//   for (var i = 1; i <= 15; i++) {
//     if (i % 3 == 0 && i % 5 == 0) {
//       print('fizz buzz');
//     } else if (i % 3 == 0) {
//       print('fizz');
//     } else if (i % 5 == 0) {
//       print('buzz');
//     } else {
//       print(i);
//     }
//   }
// }
// Convert this to a stream generator by replacing all the print statements with the yield keyword, so that each value is added as a String.

// To make things fun, introduce a delay of 500 milliseconds inside the for loop, using Duration(milliseconds: 500).

// In the main method, iterate through all the values in the stream and print them.




Stream<String> asyncFizzBuzz() async* {
  for (var i = 1; i <= 15; i++) {
    await Future.delayed(Duration(milliseconds: 500));
    if (i % 3 == 0 && i % 5 == 0) {
      yield 'fizz buzz';
    } else if (i % 3 == 0) {
      yield 'fizz';
    } else if (i % 5 == 0) {
      yield 'buzz';
    } else {
      yield '$i';
    }
  }
}

Future<void> main() async {
  final stream = asyncFizzBuzz();
  await for (var value in stream) {
    print(value);
  }
}













// // 定義一個回傳 Stream<String> 的函式
// // async* 是 Dart 用來標記「非同步產生器」的關鍵字
// Stream<String> asyncFizzBuzz() async* {
//   // 使用標準的 for 迴圈，從 1 數到 15
//   for (var i = 1; i <= 15; i++) {
    
//     // [模擬耗時操作]
//     // await 代表「等待」。這裡讓程式暫停 500 毫秒 (0.5秒)
//     // 就像是假裝正在從網路下載資料或是做複雜運算
//     await Future.delayed(Duration(milliseconds: 500));
    
//     // [FizzBuzz 邏輯判斷]
//     if (i % 3 == 0 && i % 5 == 0) {
//       // 如果同時是 3 和 5 的倍數
//       // yield 代表「產出」一個值丟進 Stream 裡，但函式不會結束，會繼續跑下一圈
//       yield 'fizz buzz';
//     } else if (i % 3 == 0) {
//       // 如果是 3 的倍數
//       yield 'fizz';
//     } else if (i % 5 == 0) {
//       // 如果是 5 的倍數
//       yield 'buzz';
//     } else {
//       // 其他情況，直接產出數字本身 (轉成字串)
//       yield '$i';
//     }
//   }
// }



// // main 也是非同步的，因為我們需要等待 Stream 跑完
// Future<void> main() async {
//   // 1. 建立 Stream
//   // 呼叫函式時，並不會立刻開始跑迴圈，而是建立了一條「準備好」的輸送帶
//   final stream = asyncFizzBuzz();

//   // 2. 監聽 Stream (使用 await for)
//   // 這是一個專門用來處理 Stream 的迴圈
//   await for (var value in stream) {
//     // 當 Stream 吐出一個新值，這裡就會執行一次
//     print(value);
//   }
//   // 當 Stream 結束 (asyncFizzBuzz 跑完所有程式碼) 後，main 才會結束
// }