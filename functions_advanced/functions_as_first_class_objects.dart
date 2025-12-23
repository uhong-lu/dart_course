void main(){
  final sayHi = (String name) => 'Hi, $name!';//take a String argument and return a String  ,  function types match code is valid
  //print(sayHi('Alice'));
  welcome(sayHi, 'Alice');
}

void welcome(String Function(String) greet, String name) { //declare an argument called greet and this argument is a function that takes a String argument and returns a String
  //notice how greet argument needs to be function that takes a string argument and returns a string
  print(greet(name));
  print('Welcome to this course!');
}