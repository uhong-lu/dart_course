// subclassing is a technique that we can use to extend the functionality of an existing class by creating a new class that inherits properties and methods from the existing class. This allows us to build upon existing code, promote code reuse, and create more specialized classes.
class Animal {
  void sleep() => print('sleep');
}

//this Animal is also called the super clsaa
class Dog extends Animal {        //the process of extending an existing class is also called sub-classing or inheritance
  void bark() => print('bark');
}

class cleverGog extends Dog {
  void catchBall() => print('catch');
}


class Cow extends Animal {
  void moo() => print('moo');
}


void main(){
  final animal = Animal();
  animal.sleep();
  final dog = Dog();
  dog.bark();
  dog.sleep(); // inherited method
  // animal.bark();   //the method 'bark' isn't defined for the type 'Animal'
  final cow = Cow();
  cow.moo();
  cow.sleep(); // inherited method
  final clever = cleverGog();
  clever.bark();
  clever.catchBall();
  clever.sleep();
}