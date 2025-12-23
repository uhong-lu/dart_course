//print to console a description using the provided name and age
// void main(){
//   describe('Howard', 23);
// }

// void describe(String name, int age) {
//   print('My name is $name and I am $age years old.');
// }

//return a description using the provided name and age
void main(){
  final person = describe('Howard', 23);
  print(person);
}

String describe(String name, int age) {
  return 'My name is $name and I am $age years old.';
}