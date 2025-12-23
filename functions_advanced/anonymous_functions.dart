void main(){
  final sayHi = (name) =>'Hi, $name'; //(name) the list og arguments   'Hi, $name' the function body     no name how to use it? assign it to varriable  final sayHi
  //final sayHi = (name) =>'Hi, $name'; daclare this name argument without a type  quite common when defining anonymous functions
  //final sayHi = (String name) =>'Hi, $name'; daclare this name argument with a type  the type system can help us avoid type errors
  print(sayHi('Alice'));//need to call it with paranthesis and pass one argument
  print(sayHi);//omit paranthesis
}