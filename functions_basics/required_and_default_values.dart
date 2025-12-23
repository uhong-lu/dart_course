//null age
// void main(){
//   final person = decribe(name : 'Andrea');
//   print (person);
// }

// String decribe({String name, int age}){
//   return 'My name is $name and I am $age years old';
// }

//解法一 nullable
// void main(){
//   final person = decribe(name : 'Andrea');
//   print (person);
// }

// String decribe({String name, int? age}){
//   return 'My name is $name and I am $age years old';
// }

// //解法二 default values
// void main(){
//   final person = decribe(name : 'Andrea');
//   print (person);
// }

// String decribe({String name = '', int age = 0}){
//   return 'My name is $name and I am $age years old';
// }


// //解法二 Mark arguments as required
// void main(){
//   final person = decribe(name : 'Andrea');
//   print (person);
// }

// String decribe({required String name,required int age}){
//   return 'My name is $name and I am $age years old';
// }