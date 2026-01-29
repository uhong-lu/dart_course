// summary stream generators are quite useful
// wecan use them to emit multiple values over time inside a single function
// stream generators are also called asynchronous generators


// Future<int> sumStream(Stream<int> Stream) async{
//   var sum = 0;
//   await for (var value in Stream){
//     sum += value;
//   }
//   return sum;
// }


// Future<int> sumStream2(Stream<int> stream) => 
//     stream.reduce((previous, element) => previous + element);
    

// Stream<int> countStream(int n) async* {  // Use Stream rather than Future // Use async* rather async
//   for (var i = 1; i <= n; i++) {
//     yield i;  // Use 'yield' rather than 'await'  // this code lets us do is to generate multiple values and use them to create a stream
//   }
// }

// Future<void> main() async {
//   final stream = Stream<int>.fromIterable([1,2,3,4]);
//   final stream2 = countStream(4);       
//   final sum = await sumStream(stream2);
//   print('Sum: $sum');
// }


// asynchronous generators
// we could add a delay inside the for loop so that all the stream items are not generated at the same time
Stream<int> countStreamWithDelay(int n) async* {
  for (var i = 1; i <= n; i++) {
    // some asynchronous works
    await Future.delayed(Duration(seconds: 1)); // Simulate a delay
    print(i);  // show the stream items are generated with a delay  // generated one by one
    yield i;
  }
}

// synchronous generators
// In Dart we can also have synchronous generators
Iterable<int> countSync(int n) sync* {  // Use Iterable rather than Stream // Use sync* rather async*
  for (var i = 1; i <= n; i++) {
    yield i;  // Use 'yield' rather than 'await'
  }
}

//模擬使用
void main() async {
  print('--- 1. 同步生成器 (Iterable) ---');
  // 這裡會瞬間跑完，因為沒有延遲
  var iterable = countSync(3); 
  for (var val in iterable) {
    print('Sync: $val');
  }

  print('\n--- 2. 非同步生成器 (Stream) ---');
  // 這裡會每一秒印出一次，因為有 await Future.delayed
  var stream = countStreamWithDelay(3);
  await for (var val in stream) {
    print('Stream received: $val');
  }
}
