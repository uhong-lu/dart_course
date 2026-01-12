//動詞用 mixin
//名詞用 class

//code duplicate
// class Animal{
//   void breathe() => print('breathing');
// }

// class Fish extends Animal{
//   void swim() => print('swimming');
// }

// class Human extends Animal{
//   void swim() => print('swimming');
// }



//code with mixin
//class hierarchy can now swim
// mixin Swimming{
//   void swim() => print('swimming');

// }
// class Animal{
//   void breathe() => print('breathing');
// }

// class Fish extends Animal with Swimming{
// }

// class Human extends Animal with Swimming{
// }

// void main(){
//   final fish = Fish();
//   fish.swim();
// final human = Human();
//   human.swim();
// }



//any class can be added as a mixin to another class
//class Breathing{
//   void breathe() => print('breathing');
// }
mixin Breathing{
  void breathe() => print('breathing');
}

mixin Swimming{
  void swim() => print('swimming');
}

class Animal with Breathing{
}

class Plant with Breathing{
}

class Fish extends Animal with Swimming{
}

class Human extends Animal with Swimming{
}

void main(){
  final fish = Fish();
  fish.swim();
final human = Human();
  human.swim();
}

//difference between declaring a class and a mixin
// A mixin can't be instantiated on its own

//class Breathing{
//   void breathe() => print('breathing');
// }

// void main(){
// final breathing = Breathing(); // can create an instance of type 'Breathing' because breathing is a class
// }

//mixin Breathing{
//   void breathe() => print('breathing');
// }

// void main(){
// final breathing = Breathing(); // error: can't create an instance of type 'Breathing' because breathing is a mixin
// }
