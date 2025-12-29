
class Animal {
  Animal({required this.age});  // super constructor
  final int age;
  void sleep() => print('sleep');
}


// class Dog extends Animal {        
//   void bark() => print('bark');
// }             //error: the superclass 'Aniam' doesn't have a zero argument constructor
//               //we can only create instances of 'Animal' by calling this constructor that takes one argument


// class Cow extends Animal {
//   void moo() => print('moo');
// }
//neither the Dog and Cow classes are calling this constructor
//in Dart constructors are not inherited by subclasses
//to fix, we must provide a constructor for the classes as well

//animal class has an age member variable but the Dog subclass doesn't have an 'age' variable
class Dog extends Animal {        
  Dog({required int age}) : super(age: age);  //purpose of this is that we can call the 'super' constructor inside the initializer list
  void bark() => print('bark');
}             


class Cow extends Animal {
  Cow({required int age}) : super(age: age);  //declare this as a regular argument with a type and a name, so that we can pass it ti the super constructor
  void moo() => print('moo');
}


class CleverGog extends Dog {
  CleverGog({required int age}) : super(age: age);
  void catchBall() => print('catch');
}

void main(){
  final animal = Animal(age : 10);
  animal.sleep();
  final dog = Dog(age: 3);
  dog.bark();
  dog.sleep(); 
  
  final cow = Cow(age: 4);
  cow.moo();
  cow.sleep(); 
  final clever = CleverGog(age: 5);
  clever.bark();
  clever.catchBall();
  clever.sleep();
}

//if you decide to add more required or positional arguments to the super constructor you will have to update all the constructors in the subclasses









// /**
//  * 主題：父類別構造函式 (The Super Constructor)
//  * 核心觀念：子類別必須負責初始化父類別的狀態。使用 super 關鍵字將參數向上傳遞。
//  */

// // [class]：定義父類別 (Superclass / Parent Class)。
// class Animal {
//   // [Animal({required this.age})]：父類別構造函式。
//   // [this.age]：[this shorthand syntax]，自動初始化成員變數 age。
//   // [required]：確保每個動物「出生」時都必須有年齡。
//   Animal({required this.age}); 

//   // [final int age]：不可變成員變數。子類別會繼承這個屬性。
//   final int age;

//   // [void sleep()]：實例方法 (Instance Method)。子類別會繼承這個行為。
//   // [=>]：箭頭語法回傳 print 動作。
//   void sleep() => print('sleep');
// }

// // ---------------------------------------------------------
// // 子類別實作 (Subclass Implementations)
// // ---------------------------------------------------------

// // [extends Animal]：繼承關鍵字。Dog 成為 Animal 的子類別。
// class Dog extends Animal { 
//   // [Dog({required int age})]：子類別自己的構造函式。
//   // [int age]：這是一個「普通參數 (Argument/Parameter)」，它不加 this，
//   //           因為 Dog 類別內部並沒有宣告 age 變數（age 是在 Animal 裡的）。
//   // [:]：[Initializer list] (初始化列表) 的開始。
//   // [super(age: age)]：呼叫父類別構造函式 (Super Constructor)。
//   //    - 第一個 age：指的是 Animal 構造函式中的「具名參數」。
//   //    - 第二個 age：指的是 Dog 構造函式剛接收到的「引數 (Argument)」。
//   Dog({required int age}) : super(age: age); 

//   // [bark()]：子類別特有的行為。
//   void bark() => print('bark');
// } 

// class Cow extends Animal {
//   // 同 Dog 的邏輯：接收 age，並透過 super 向上傳遞給 Animal。
//   Cow({required int age}) : super(age: age);
  
//   void moo() => print('moo');
// }

// // [CleverDog]：多層繼承 (Multi-level Inheritance)。
// // CleverDog -> Dog -> Animal
// class CleverGog extends Dog {
//   // [super(age: age)]：此處的 super 呼叫的是 Dog 的構造函式。
//   // 然後 Dog 的構造函式會再呼叫 Animal 的構造函式。這形成了一個「初始化鏈」。
//   CleverGog({required int age}) : super(age: age);
  
//   void catchBall() => print('catch');
// }

// // ---------------------------------------------------------
// // 執行與測試 (Execution)
// // ---------------------------------------------------------

// void main() {
//   // [animal]：父類別物件實體 (Instance of Superclass)。
//   final animal = Animal(age: 10);
//   animal.sleep();

//   // [dog]：子類別物件實體 (Instance of Subclass)。
//   // [age: 3]：引數 (Argument)，會經過 Dog 傳給 Animal。
//   final dog = Dog(age: 3);
//   dog.bark();   // 執行自己的方法
//   dog.sleep();  // 執行從父類別繼承來的方法

//   final cow = Cow(age: 4);
//   cow.moo();
//   cow.sleep(); 

//   // [clever]：最底層的子類別物件。
//   final clever = CleverGog(age: 5);
//   clever.bark();      // 繼承自 Dog
//   clever.catchBall(); // 自己定義的
//   clever.sleep();     // 繼承自 Animal (阿公類別)
// }

// /**
//  * 🔬 深度技術總結：
//  * * 1. [構造函式不繼承]：
//  * 這是初學者最常犯錯的地方。你不能因為 Animal 有構造函式就以為 Dog 自動也有。
//  * 你必須手動在 Dog 裡寫一個構造函式來「轉發」參數。
//  * * 2. [super 的角色]：
//  * 它就像是一支電話，讓子類別在出生時可以撥給父類別說：
//  * 「嘿！這是你要的初始化資料 (age)，請幫我設定好你的部分。」
//  * * 3. [初始化順序]：
//  * 在執行子類別構造函式的大括號 { } 之前，父類別的構造函式 (super) 必須先完成。
//  * 這確保了當你開始在子類別做事時，父類別繼承來的屬性已經準備好了。
//  */