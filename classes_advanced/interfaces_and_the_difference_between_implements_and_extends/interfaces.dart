abstract class InterfaceA {
  void a();
}

abstract class InterfaceB {
  void b();
}

class AB implements InterfaceA, InterfaceB {
  @override
  void a() {
    // TODO: implement a
  }

  @override
  void b() {
    // TODO: implement b
  }
  
}


//wrong version // new classes can only extend one class
// class AB extends InterfaceA, InterfaceB {
//   @override
//   void a() {
//     // TODO: implement a
//   }

//   @override
//   void b() {
//     // TODO: implement b
//   }
  
// }

abstract class Base {
  void foo();                 // abstract method
  void bar() => print('bar');// concrete method  //we can chose to implement or not
}

//wrong extends version  
//class Subclass extends Base {}
//error: The non-abstract class 'Subclass' is missing implementations for these members:
  // - Base.foo

//correct extends version
class Subclass extends Base {
  @override
  void foo() {
    print('foo');
  }
}

//wrong implements version
//missing concrete method Base.bar
// class Subclass implements Base {
//   @override
//   void foo() {
//     print('foo');
//   }
// }
//implenments a class must override all its methods, even if they are already  implemented in that class



















// /**
//  * 主題：介面 (Interfaces) 與 繼承 (Inheritance) 的差異
//  * 核心觀念：
//  * 1. extends (繼承)：是「父子關係」。繼承父類別的功能，只需實作未完成的部分。只能有一個父親。
//  * 2. implements (實作)：是「合約關係」。無視父類別已有的功能，強制重新實作所有方法。可以簽多份合約。
//  */

// // ---------------------------------------------------------
// // Part 1: 定義介面 (Defining Interfaces)
// // ---------------------------------------------------------

// // [abstract class]：抽象類別。
// // 在 Dart 中，任何類別都可以被當作「介面 (Interface)」來使用。
// // 這裡定義了第一份合約，規定必須具備功能 a()。
// abstract class InterfaceA {
//   // [abstract method]：抽象方法。
//   // 只有簽章 (void a())，沒有實作內容 (無 {})。
//   void a();
// }

// // 定義第二份合約，規定必須具備功能 b()。
// abstract class InterfaceB {
//   void b();
// }

// // ---------------------------------------------------------
// // Part 2: 多重實作 (Multiple Interfaces)
// // ---------------------------------------------------------

// // [class AB]：一個具體的類別。
// // [implements]：關鍵字，意為「實作」或「履行合約」。
// // [InterfaceA, InterfaceB]：多重介面。
// // 💡 重點：Dart 不支援多重繼承 (extends A, B)，但支援多重實作 (implements A, B)。
// // 這代表 AB 類別必須同時滿足 A 和 B 的所有要求。
// class AB implements InterfaceA, InterfaceB {
  
//   // [@override]：覆寫標記。
//   // 實作 InterfaceA 規定的 a() 方法。
//   @override
//   void a() {
//     print('實作 A 的功能');
//   }

//   // 實作 InterfaceB 規定的 b() 方法。
//   @override
//   void b() {
//     print('實作 B 的功能');
//   }
// }

// // ❌ 錯誤示範：多重繼承是不被允許的
// // Error: 'extends' can only be used with one class.
// // class AB extends InterfaceA, InterfaceB {} 


// // ---------------------------------------------------------
// // Part 3: 繼承與實作的行為差異 (Extends vs Implements)
// // ---------------------------------------------------------

// // 定義一個包含「抽象方法」與「具體方法」的基底類別。
// abstract class Base {
//   // [抽象方法]：子類別「必須」實作它。
//   void foo(); 
  
//   // [具體方法]：父類別已經寫好了程式碼。
//   // [=> print('bar')]：這是既有的實作邏輯。
//   void bar() => print('bar');
// }

// // --- 情境 A: 使用 extends (繼承) ---
// // 意義：Subclass "是" 一種 Base。它繼承了 Base 的血統。
// class SubclassExtends extends Base {
//   // 💡 [foo]：必須實作。因為爸爸沒寫內容，兒子要自己補上。
//   @override
//   void foo() {
//     print('foo');
//   }
  
//   // 💡 [bar]：不需要寫！
//   // 因為是 extends，子類別自動繼承了爸爸的 bar() 功能。
//   // 當然，你也可以選擇覆寫它 (Optional override)。
// }

// // ❌ 錯誤示範：extends 但未實作抽象方法
// // Error: Missing concrete implementation of 'Base.foo'.
// // class BadExtends extends Base {}


// // --- 情境 B: 使用 implements (介面) ---
// // 意義：SubclassImplements "承諾具備" Base 的外觀。它把 Base 當作一張規格書。
// class SubclassImplements implements Base {
//   // 💡 [foo]：必須實作 (這點跟 extends 一樣)。
//   @override
//   void foo() {
//     print('foo');
//   }

//   // 💡 [bar]：也必須實作！(這是最大的差異)
//   // 雖然 Base 裡面已經寫好了 bar()，但因為使用了 implements，
//   // 這裡把 Base 當作純粹的「介面 (合約)」。
//   // 合約只規定「你要有一個叫 bar 的方法」，不包含父類別原本的程式碼。
//   // 所以你必須從頭自己寫一遍，不能呼叫 super.bar()。
//   @override
//   void bar() {
//     print('我必須自己重新實作 bar');
//   }
// }

// // ❌ 錯誤示範：implements 但漏掉具體方法
// // Error: Missing concrete implementation of 'Base.bar'.
// // class BadImplements implements Base {
// //   @override
// //   void foo() { print('foo'); }
// //   // 漏寫了 bar()，編譯失敗！
// // }