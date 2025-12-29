
class Animal {
  Animal({required this.age});  
  final int age;
  void sleep() => print('sleep');
}


// class Dog extends Animal {        
//   Dog({required int age}) : super(age: age); 
//   void bark() => print('bark');
//   @override                     // future yourself or other developers read this code, they will know that the intent was to override a method of the super class
//  //override is also useful because if you try to override a method that doesn't exist in thr superclass Dart will warn you about it
//   void sleep() => print('dog sleep'); // 方法覆寫
// }             


class Dog extends Animal {        
  Dog({required int age}) : super(age: age); 
  void bark() => print('bark');
  @override
   void sleep() {             // change method to : exxcute sleep() in the superclass 、 run some other code
    //  sleep();                 //don't do this// recursive call to sleep() in the Dog class
     super.sleep();           //do this// call the superclass implementation of sleep()
     print('sleep more');
     }    //it allows you customize the implementation of a  method that is defined in the base
}             




class Cow extends Animal {
  Cow({required int age}) : super(age: age);  
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
  dog.sleep(); 
}

//overrides are common when we use UI framewoeks






// /**
//  * 主題：方法覆寫 (Method Overriding)
//  * 核心觀念：子類別重新定義父類別的方法，並可選擇是否保留父類別原有的邏輯。
//  */

// // [class]：定義父類別 (Base Class / Superclass)。
// class Animal {
//   // [Animal({required this.age})]：父類別構造函式。
//   // [this.age]：[this shorthand syntax]，將參數直接賦值給成員變數。
//   Animal({required this.age}); 
  
//   // [final int age]：不可變的成員變數 (Member Variable)。
//   final int age;

//   // [void sleep()]：父類別中定義的方法。
//   void sleep() => print('sleep');
// }

// // [extends Animal]：子類別繼承父類別。
// class Dog extends Animal { 
//   // [Dog({required int age})]：子類別構造函式。
//   // [int age]：接收外部傳入的引數 (Argument)。
//   // [:]：[Initializer list] (初始化列表) 開始。
//   // [super(age: age)]：呼叫父類別構造函式 (Super Constructor)，完成屬性初始化。
//   Dog({required int age}) : super(age: age); 
  
//   // [void bark()]：子類別特有的方法 (Subclass-specific Method)。
//   void bark() => print('bark');

//   // [@override]：元數據標籤 (Metadata Annotation)。
//   // 💡 功能：告訴編譯器與開發者「我現在要覆寫父類別的方法」。
//   // 💡 優點：如果你拼錯字（如寫成 sleeeep），編譯器會報錯提醒你父類別沒這個方法。
//   @override 
//   void sleep() {
//     // [super.sleep()]：呼叫「父類別版本」的 sleep 方法。
//     // 💡 為什麼要加 super.？ 
//     // 如果只寫 sleep(); 會變成「遞迴呼叫 (Recursive Call)」，導致無窮迴圈直到程式當掉。
//     super.sleep(); 
    
//     // [print]：在保留父類別行為之後，加入子類別專屬的額外行為。
//     print('dog sleep more');
//   }
// }

// class Cow extends Animal {
//   // Cow 繼承了 Animal，但選擇「不覆寫」sleep 方法。
//   Cow({required int age}) : super(age: age); 
//   void moo() => print('moo');
// }

// class CleverGog extends Dog {
//   // CleverGog 繼承了 Dog，所以它繼承的是 Dog「覆寫過後」的 sleep。
//   CleverGog({required int age}) : super(age: age);
//   void catchBall() => print('catch');
// }

// // [void main()]：Dart 執行進入點。
// void main() {
//   // [animal]：物件實例 (Object Instance)。
//   final animal = Animal(age: 10);
//   print('--- Animal 執行 ---');
//   animal.sleep(); // 輸出: sleep

//   // [dog]：子類別物件實體。
//   final dog = Dog(age: 3);
//   print('\n--- Dog 執行 (覆寫版本) ---');
//   // [dog.sleep()]：執行的是 Dog 類別中定義的覆寫版本。
//   // 它會先執行父類別的 sleep()，再印出自己的訊息。
//   dog.sleep(); 
//   // 輸出:
//   // sleep
//   // dog sleep more
// }

// /**
//  * 🔬 深度技術總結：
//  * * 1. [@override 的重要性]：
//  * 雖然不寫也能跑，但寫了可以防止「意外新增方法」。例如你想覆寫，卻不小心
//  * 把名字打錯，沒有標籤的話，電腦會以為你只是想創一個新方法，這會導致 Bug。
//  * * 2. [super.methodName()]：
//  * 當你想「擴充」而不是「完全取代」父類別的邏輯時，這非常有用。
//  * 它讓子類別可以在執行自定義邏輯前，先確保父類別的基礎邏輯（如初始化或資源釋放）已執行。
//  * * 3. [遞迴警訊]：
//  * 在覆寫方法內直接呼叫同名方法而不加 super，會造成無限迴圈。
//  * * 4. [多型實務]：
//  * 在 Flutter UI 框架中，我們幾乎每天都在覆寫 `Widget` 的 `build` 方法，
//  * 這就是 `@override` 最常見的場景。
//  */