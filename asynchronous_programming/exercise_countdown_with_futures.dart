// summary
// the order in your code execute is important
// unless you 'await' when you call functions that return a 'Future' then things may not run in the order that you want
// So make sure that you always use 'await' when you work with 'Future'

// Implement a countdown function that takes an int n argument, and prints all the numbers from n to 0, with one second delay between each number.

// Then, call countdown(5) inside the main() method, and verify that it works as intended.

// The program should print Done after the countdown has completed.

// Use Futures, async and await as needed.

// // immdiately print version not what we want
// void countdown(int n){
//   for (var i = n; i >= 0; i--) {
//     Future.delayed(
//       Duration(seconds: 1), 
//       () => print(i),
//     );
//   }
// }

// void main(){
//   countdown(5);
//   print('Done');
// }


// //delayed print version
// //add async 、 await to countdown
// Future<void> countdown(int n) async {
//   for (var i = n; i >= 0; i--) {
//     await Future.delayed(
//       Duration(seconds: 1), 
//       () => print(i),
//     );
//   }
// }

// void main(){
//   countdown(5);
//   print('Done');
// } //correct countdown but Done still prints before all the numbers


//Done delayed print version
Future<void> countdown(int n) async {
  for (var i = n; i >= 0; i--) {
    await Future.delayed(
      Duration(seconds: 1), 
      () => print(i),
    );
  }
}

Future<void> main() async {
  await countdown(5);
  print('Done');
}