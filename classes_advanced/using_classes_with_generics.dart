class Stack<T>{
  final List<T> _items = [];

  void push(T item) => _items.add(item);

  T pop() => _items.removeLast();
}

void main(){
  final stanck = Stack<int>();
  stanck.push(1);
  stanck.push(2);
  print(stanck.pop());
  print(stanck.pop());
  final names = Stack<String>();
  names.push("Alice");
}

// 泛型讓我們的類別變得像「萬用容器」一樣。我們不需要為了儲存 int 寫一個 IntStack，再為了儲存 String 寫一個 StringStack。只要寫一次 Stack<T>，它就能適應任何型別。
// 1. 為什麼要用 <T>？ (The Power of T)
// 如果你不用泛型：你可能要用 List<dynamic>。

// 缺點：你可能會不小心把字串和數字混在一起，取出時還要檢查型別，容易當機。

// 如果你用泛型：

// 安全性：Stack<int> 絕對插不進去字串。

// 方便性：pop() 出來的東西直接就是 int，不需要轉型。

// 2. 什麼是 Stack (堆疊)？
// 這是一種 LIFO (Last-In, First-Out) 的資料結構。

// 想像一疊盤子。

// Push：洗好一個盤子，疊在最上面。

// Pop：要用盤子時，從最上面拿一個。

// 你不能直接抽走中間的盤子（那是 List 的索引存取做的事）。

// 💡 視覺化記憶：模具工廠
// Stack<T>：那台機器。

// T：原料的類型。

// Stack<int>：生產出來的成品。




/**
//  * 主題：使用泛型類別 (Using Classes with Generics)
//  * 核心目標：實作一個可以儲存「任何型別」的堆疊 (Stack) 資料結構。
//  * 泛型好處：Type Safety (型別安全) + Code Reuse (代碼重用)。
//  */

// // [class Stack<T>]：定義一個泛型類別。
// // [<T>]：型別參數 (Type Parameter)。
// //    - T 是一個「佔位符 (Placeholder)」。
// //    - 當你使用 Stack<int> 時，T 就會變成 int。
// //    - 當你使用 Stack<String> 時，T 就會變成 String。
// class Stack<T> {
  
//   // ---------------------------------------------------------
//   // 1. 內部儲存結構 (Internal Storage)
//   // ---------------------------------------------------------
  
//   // [final]：變數本身不可變（不能指向別的 List），但 List 內容可變。
//   // [List<T>]：這是一個「泛型清單」。
//   //    - 如果 T 是 int，這就是 List<int>。
//   // [_items]：私有變數 (Private Variable，以底線開頭)。
//   //    - 只有 Stack 類別內部可以存取這個 List，外部不能直接修改，這就是「封裝」。
//   // [= []]：初始化為一個空清單。
//   final List<T> _items = [];

//   // ---------------------------------------------------------
//   // 2. 推入方法 (Push Method)
//   // ---------------------------------------------------------

//   // [void]：不回傳值。
//   // [push]：方法名稱。
//   // [(T item)]：參數型別是 T。
//   //    - 這保證了你不能把 String 推入 Stack<int>，編譯器會幫你檢查。
//   // [=>]：箭頭語法。
//   // [_items.add(item)]：將項目加入內部清單的尾端。
//   void push(T item) => _items.add(item);

//   // ---------------------------------------------------------
//   // 3. 彈出方法 (Pop Method)
//   // ---------------------------------------------------------

//   // [T]：回傳型別是 T。
//   //    - 如果是 Stack<int>，這裡就保證回傳 int。
//   // [pop]：方法名稱。
//   // [_items.removeLast()]：移除並回傳清單的最後一個元素。
//   // 💡 注意：如果 Stack 是空的，removeLast() 會拋出錯誤。
//   T pop() => _items.removeLast();
// }

// // [void main()]：程式進入點。
// void main() {
//   // ---------------------------------------------------------
//   // 4. 實例化整數堆疊 (Stack<int>)
//   // ---------------------------------------------------------
  
//   // [Stack<int>]：具體化 (Reification)。我們告訴 Dart，這個 Stack 專門裝 int。
//   // 此時，類別裡的所有的 T 都變成了 int。
//   final stanck = Stack<int>();
  
//   // [push(1)]：合法，因為 1 是 int。
//   stanck.push(1);
//   stanck.push(2);
  
//   // [stanck.push('a')]：❌ 錯誤！
//   // 因為泛型限制了只能放 int，IDE 會直接畫紅線報錯。

//   print(stanck.pop()); // 輸出: 2 (後進先出)
//   print(stanck.pop()); // 輸出: 1

//   // ---------------------------------------------------------
//   // 5. 實例化字串堆疊 (Stack<String>)
//   // ---------------------------------------------------------
  
//   // 這裡的 T 變成了 String。我們完全不用重寫 Stack 類別的程式碼！
//   final names = Stack<String>();
//   names.push("Alice");
//   print(names.pop()); // 輸出: Alice
// }