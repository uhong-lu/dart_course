///summary 
// use the 'await' keyword to wait until a Future returns and we can get the result value if it returns successfully
// and if we have multiple futures we can use 'await' to execute them in sequence
// 'await' is only allowed inside 'asynchronous' functions or methods marked with the 'async' keyword
// when we use 'await' in combination with 'try/catch' we cab also handle any exceptions that are thrown by a 'Future'
// so 'async and await' along with 'try/catch' is a great way of working with Futures in Dart
// recommended that use them instead of using 'then' 'catchError' and 'whenComplete' like we have done in the previous lesson

// Future<String> fetchUserOrder() => Future.delayed( 
//   Duration(seconds: 2),
//   () => 'Cappuccino', 
// );


// void main(){
//   print('Program started');
//   fetchUserOrder() 
//       .then((order) => print('Order is ready: $order'))
//       .catchError((error) => print('Caught an error: $error'))
//       .whenComplete(() => fetchUserOrder().then((value) => null)); //Hard to execute multiple future sequentially then it is hard to follow this flow of execution //EX: if we wanted to fetch the next order //this hard to read and reason about
// }



///async and await makes it easier to work with futures sequentially
Future<String> fetchUserOrder() => Future.delayed( 
  Duration(seconds: 2),
  () => 'Cappuccino', 
);


void main(){
  print('Program started');
  final order = fetchUserOrder(); 
  print(order); //Output Instance of Future<String>
} 

// //if we want to get the actual order, then we need to 'await' for this future to complete
// Future<String> fetchUserOrder() => Future.delayed( 
//   Duration(seconds: 2),
//   () => 'Cappuccino', 
// );


// Future<void> main() async{  //marking main function as async //main method is now asynchronous //whenever you mark a function or method with 'async' then you should also make its return type a Future (the main method should return 'Future of type void')
//   print('Program started');
//   final order = await fetchUserOrder();  //use await inside a function then we must make it an 'async' function
//   print(order); //Output: Program started (after 2 seconds) Order is ready: Cappuccino
// } 
// //handout //we use 'await' ti wait for a future to complete, and get it's return value.


// //But what if the 'Future' throws an exception instead?
// //EX
// Future<String> fetchUserOrder() => Future.delayed( 
//   Duration(seconds: 2),
//   () => throw Exception('Out of milk'), 
//   // () => 'Cappuccino', 
// );


// Future<void> main() async{ 
//   print('Program started');
//   final order = await fetchUserOrder();  
//   print(order); 
// } //output : Unhandled exception: Exception: Out of milk

// //to address this ,we can wrap this code with a try block and then we can add catch e
// Future<void> main() async{ 
//   print('Program started');
//   try{
//     final order = await fetchUserOrder();  
//     print(order); 
//   } catch(e){ 
//     print('Caught an error: $e');
//   }
// } //output : Program started (after 2 seconds) Caught an error: Exception: Out of milk


// //mutiple futures sequentially using the 'await' keyword
// Future<void> main() async{ 
//   print('Program started');
//   try{
//     final order = await fetchUserOrder();  //all lines following this call are not executed until this future completes
//     print(order); 
//     final order2 = await fetchUserOrder();  
//     print(order2); 
//   } catch(e){ 
//     print('Caught an error: $e');
//   } finally{
//     print('done');
//   }
// } //get one exception because all the lines following this call are executed there is an exception => throw Exception('Out of milk')
// // if we return 'Cappouccino' from this function from this function and run again ,then we can see the two orders appear one after the other in wequence
// // as a reminder we can also use 'finally' and use this to print(done) // this will run after all the futures have completed regardless of whether they succeeded or not