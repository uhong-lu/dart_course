
typedef Greet = String Function(String); //defining a named function type (it doesn't have a function body)
//typedef String Greet(String name); //alternative syntax for defining a named function type 只使用一次可以用這個方法 在Greet(String name) 這裡取Greet名字

String sayHi(String name) => 'Hi, $name!';

String sayBonjour(String name) => 'Bonjour, $name!';

String sayHola(String name) => 'Hola, $name!';

void main(){
  final sayHi = (String name) => 'Hi, $name!';
  welcome(sayHi, 'Alice');
  welcome(sayBonjour, 'Bob');
  welcome(sayHola, 'Carlos');
}

// void welcome(String Function(String) greet, String name){ //String Function(String) greet long and hard to read  define a named function type to improve the readability
  void welcome(Greet greet, String name){  //using the named function type(or alias)
  print(greet(name));
  print('Welcome to this course');
}