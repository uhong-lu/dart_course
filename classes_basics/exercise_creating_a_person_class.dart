// Exercise
// Given the following program:

// void main() {
//   final person = {
//     'name': 'Andrea',
//     'age': 36,
//     'height': 1.84
//   };
//   print("My name is ${person['name']}. I'm ${person['age']} years old, I'm ${person['height']} meters tall.");
// }
// Refactor this code by creating a Person class that will contain name, age, height properties.

// This class should have a printDescription() method that can be used to print the name, age and height just like in the program above.

// Once this is done, create two instances of Person and use them to call the printDescription() method just created.

class Person {
  Person({
    required this.name,
    required this.age,
    required this.height
    });
  
  final String name;
  final int age;
  final double height;

  void printDescription() {
    print("My name is $name. I'm $age years old, I'm $height meters tall.");
  }
}

void main() {
  final p1 = Person(name: 'Alice',age: 26,height: 1.74);
  final p2 = Person(name: 'Lucy',age: 16,height: 1.84);
  p1.printDescription();
  p2.printDescription();
}



// /**
//  * 主題：實作 Person 類別與不可變屬性
//  * 核心觀念：使用 final 確保資料安全性，並透過 this 語法糖簡化初始化流程。
//  */

// // [class]：關鍵字，用來定義一個名為 Person 的自定義型別（設計圖）。
// class Person {
//   // ---------------------------------------------------------
//   // 1. 構造函式 (Constructor)
//   // ---------------------------------------------------------
  
//   // [Person({ ... })]：定義一個與類別同名的構造函式，使用「具名參數 (Named parameters)」。
//   // [{ }]：大括號表示這些參數在呼叫時必須指定名稱。
//   // [required]：修飾詞，表示該具名參數為必填，不能省略。
//   // [this.name]：這就是「this 語法糖 (this shorthand syntax)」。
//   //    - 它同時定義了參數，並在背景將傳入的「引數 (Argument)」直接賦值給同名的成員變數。
//   // [this.age], [this.height]：同上，將輸入值直接綁定到物件的屬性上。
//   Person({
//     required this.name,
//     required this.age,
//     required this.height,
//   });
  
//   // ---------------------------------------------------------
//   // 2. 成員變數 / 屬性 (Member Variables / Properties)
//   // ---------------------------------------------------------
  
//   // [final]：關鍵字，定義「不可變成員 (Immutable member)」。
//   //    - 一旦在構造函式中被初始化，這些變數的值就再也無法修改。
//   // [String name]：字串型別的成員變數。
//   final String name;
//   // [int age]：整數型別的成員變數。
//   final int age;
//   // [double height]：雙精度浮點數型別的成員變數。
//   final double height;

//   // ---------------------------------------------------------
//   // 3. 實例方法 (Instance Method)
//   // ---------------------------------------------------------

//   // [void]：回傳型別，代表此方法執行後不傳回任何數據。
//   // [printDescription]：方法名稱，定義物件的「行為」。
//   void printDescription() {
//     // [print]：內建函式，將訊息輸出至控制台。
//     // ["..."]：字串字面量 (String literal)。
//     // [$name], [$age], [$height]：字串插值 (String interpolation)。
//     //    - 電腦會自動尋找該物件實例 (Object Instance) 內部的成員變數值並填入。
//     print("My name is $name. I'm $age years old, I'm $height meters tall.");
//   }
// }

// // [void main()]：Dart 程式的執行起點 (Entry point)。
// void main() {
//   // ---------------------------------------------------------
//   // 4. 實例化與物件操作 (Instantiation)
//   // ---------------------------------------------------------

//   // [final p1]：宣告不可變變數，儲存第一個物件的引用 (Reference)。
//   // [Person(...)]：執行實例化動作，呼叫構造函式。
//   // [name: 'Alice']：具名引數 (Named argument)，將資料傳給構造函式的參數。
//   // [age: 26], [height: 1.74]：傳入對應的數據 (Arguments)。
//   final p1 = Person(name: 'Alice', age: 26, height: 1.74);

//   // [p2]：建立第二個獨立的物件實體 (Object Instance)。
//   // 即使類別相同，p1 與 p2 在記憶體中是完全分開的。
//   final p2 = Person(name: 'Lucy', age: 16, height: 1.84);

//   // [p1.printDescription()]：使用點運算子 (Dot access) 呼叫 p1 物件的方法。
//   p1.printDescription();
//   // [p2.printDescription()]：呼叫 p2 物件的方法，會印出 p2 自己的屬性內容。
//   p2.printDescription();
// }

// /**
//  * 🔬 深度技術總結：
//  * 1. [Immutable members]：由於使用了 final，如果你嘗試寫 p1.age = 30; 會導致編譯錯誤。
//  * 2. [Argument vs Parameter]：
//  * - Parameter (參數)：構造函式定義裡的 this.name。
//  * - Argument (引數)：main 函式裡傳入的 'Alice'。
//  * 3. [Encapsulation]：類別將資料 (name, age, height) 與行為 (printDescription) 封裝在一起。
//  */




