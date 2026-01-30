// /// In Dart, there are two types of Streams : single subscription and broadcast streams
// /// A Stream that is created from an 'Iterable' or a stream generator you can only call one out of the various stream methods that are available
// // example
// Future<void> main() async{
//   final stream = Stream.fromIterable([1, 2, 3]);
//   // final value = await stream.first;
//   // print(value);
//   await stream.forEach((element) => print(element));  // here call forEach on same stream
//   final doubles = stream.map((value) => value * 2).where((value) => value > 3); // here call map on same stream
//   print(doubles);  
//   await doubles.forEach(print);
// } // we are calling forEach and map on the same (single subsciption) stream
