// Given the following program:

// class Point {
//   const Point(this.x, this.y);
//   final int x;
//   final int y;

//   @override
//   String toString() => 'Point($x, $y)';

//   @override
//   bool operator ==(covariant Point other) {
//     return x == other.x && y == other.y;
//   }
// }

// void main() {
//   // make this compile by overriding the + operator
//   print(Point(1, 1) + Point(2, 0)); // should print: Point(3, 1)
//   // make this compile by overriding the * operator
//   print(Point(2, 1) * 5); // should print: Point(10, 5)
// }
// Implement the + operator, so that it’s possible to add two instances of type Point.
// Implement the * operator, so that it’s possible to multiply a Point with an int value.
// Once you have done this, the print statements in the main method should compile and print the correct result.

class Point {
  const Point(this.x, this.y);
  final int x;
  final int y;

  @override
  String toString() => 'Point($x, $y)';

  @override
  bool operator ==(covariant Point other) {
    return x == other.x && y == other.y;
  }

  Point operator +(Point other) {
    return Point(x + other.x, y + other.y);
  }

  Point operator *(int other) {
    return Point(x * other, y * other);
  }
}

void main() {
  // make this compile by overriding the + operator
  print(Point(1, 1) + Point(2, 0)); // should print: Point(3, 1)
  // make this compile by overriding the * operator
  print(Point(2, 1) * 5); // should print: Point(10, 5)
}










// /**
//  * 主題：實作 + 與 * 運算子 (Operator Overloading)
//  * 核心目標：讓自定義物件 (Point) 像數字一樣支援數學運算。
//  */

// // [class]：定義 Point 類別，代表二維座標點。
// class Point {
//   // ---------------------------------------------------------
//   // 1. 構造函式與屬性 (Constructor & Properties)
//   // ---------------------------------------------------------
  
//   // [const]：常數構造函式，允許建立編譯期常數物件。
//   // [Point]：構造函式名稱。
//   // [(this.x, this.y)]：[this shorthand syntax] (this 簡寫語法)。
//   //    - 自動將傳入的第一個引數賦值給 x。
//   //    - 自動將傳入的第二個引數賦值給 y。
//   const Point(this.x, this.y);

//   // [final int x, y]：不可變的成員變數 (Immutable Properties)。
//   final int x;
//   final int y;

//   // ---------------------------------------------------------
//   // 2. 基礎覆寫 (Basic Overrides)
//   // ---------------------------------------------------------

//   // [@override]：覆寫 Object 類別預設的 toString 方法。
//   // [String]：回傳型別。
//   // [=>]：胖箭頭語法，回傳格式化後的字串 "Point(x, y)"。
//   @override
//   String toString() => 'Point($x, $y)';

//   // [operator ==]：覆寫相等運算子，比較座標內容而非記憶體位址。
//   // [covariant Point other]：
//   //    - [covariant]：縮小參數型別範圍，強制規定只能跟 Point 比，省去手動轉型的麻煩。
//   @override
//   bool operator ==(covariant Point other) {
//     return x == other.x && y == other.y;
//   }

//   // ---------------------------------------------------------
//   // 3. 實作加法運算子 (Implementing the + operator)
//   // ---------------------------------------------------------
  
//   // [Point]：回傳型別。加法運算的結果會產生一個「新的」Point 物件。
//   // [operator +]：關鍵字組合，告訴編譯器我們要定義 "+" 號的行為。
//   // [(Point other)]：參數。
//   //    - 左運算元 (Left Operand)：是「自己」(this.x, this.y)。
//   //    - 右運算元 (Right Operand)：是「參數」(other.x, other.y)。
//   Point operator +(Point other) {
//     // 邏輯：x 加 x，y 加 y。
//     // [Point(...)]：建立並回傳一個全新的 Point 物件。
//     return Point(x + other.x, y + other.y);
//   }

//   // ---------------------------------------------------------
//   // 4. 實作乘法運算子 (Implementing the * operator)
//   // ---------------------------------------------------------

//   // [Point]：回傳型別。結果依然是一個座標點。
//   // [operator *]：定義 "*" 號的行為。
//   // [(int other)]：參數型別是 int。
//   //    - 這代表我們定義的是「點 * 整數 (Scalar Multiplication)」，而不是「點 * 點」。
//   Point operator *(int other) {
//     // 邏輯：x 和 y 分別乘以整數倍率。
//     return Point(x * other, y * other);
//   }
// }

// // [void main()]：程式進入點。
// void main() {
//   // ---------------------------------------------------------
//   // 5. 測試加法 (Testing Addition)
//   // ---------------------------------------------------------
  
//   // [Point(1, 1)]：左邊的點 (this)。
//   // [+]：呼叫我們定義的 operator + 方法。
//   // [Point(2, 0)]：右邊的點 (other)。
//   // 運算過程：(1+2, 1+0) -> Point(3, 1)
//   print(Point(1, 1) + Point(2, 0)); // 輸出: Point(3, 1)

//   // ---------------------------------------------------------
//   // 6. 測試乘法 (Testing Multiplication)
//   // ---------------------------------------------------------
  
//   // [Point(2, 1)]：左邊的點 (this)。
//   // [*]：呼叫 operator * 方法。
//   // [5]：右邊的整數 (other)。
//   // 運算過程：(2*5, 1*5) -> Point(10, 5)
//   print(Point(2, 1) * 5); // 輸出: Point(10, 5)
// }









// /**
//  * 主題：深入解析 this、toString 原貌、== 原貌與比較邏輯
//  */

// class Point {
//   // ---------------------------------------------------------
//   // 1. [this.x, this.y] 的作用？沒有 this 會怎樣？
//   // ---------------------------------------------------------
  
//   // [寫法 A：你現在用的 (語法糖)]
//   // const Point(this.x, this.y);
//   // 作用：這是一個「自動化」指令。它告訴 Dart：
//   // 1. 接收第一個引數。 2. 直接把它存進「這個物件(this)」的 x 屬性裡。

//   // [寫法 B：如果沒有 this (原始寫法)]
//   // 這是沒有語法糖的樣子。你必須寫出參數名，並手動賦值。
//   // 如果你寫 Point(int x, int y) { x = x; } 
//   // ❌ 錯誤：這變成「參數 x = 參數 x」，物件的屬性完全沒被動到（因為名稱被遮蔽了）。
//   // ✅ 正確：你必須寫 this.x = x; 告訴電腦「左邊是物件的屬性，右邊是傳進來的參數」。
  
//   const Point(this.x, this.y);

//   final int x;
//   final int y;

//   // ---------------------------------------------------------
//   // 2. 原本 Object 類別預設的 toString() 長怎樣？
//   // ---------------------------------------------------------
  
//   // 所有的類別預設都繼承自 Object。
//   // Object 裡的 toString() 實作邏輯大約是這樣的：
//   // String toString() {
//   //   return "Instance of '${this.runtimeType}'";
//   // }
  
//   // 所以如果你不覆寫 (Override)，print(Point(1, 1)) 會印出：
//   // 輸出: Instance of 'Point'  <-- 這是給電腦看的，人類看不懂內容。

//   @override
//   String toString() => 'Point($x, $y)'; // 覆寫後，我們讓它印出座標數據。

//   // ---------------------------------------------------------
//   // 3. 原本 Object 類別預設的 operator == 長怎樣？
//   // ---------------------------------------------------------

//   // Object 裡的 == 實作邏輯大約是這樣的 (Identity Equality)：
//   // bool operator ==(Object other) {
//   //   return identical(this, other); 
//   // }
  
//   // [identical]：這是比對「記憶體位址」。
//   // 只有當 p1 和 p2 指向記憶體中「完全同一個房間」時，才會回傳 true。
//   // 所以預設情況下：Point(1, 1) == Point(1, 1) 是 false (因為是兩間不同的房間)。

//   @override
//   bool operator ==(covariant Point other) {
//     // ---------------------------------------------------------
//     // 4. 解釋 x == other.x && y == other.y
//     // ---------------------------------------------------------
    
//     // 這裡其實省略了 this。完整寫法是：
//     // return this.x == other.x && this.y == other.y;

//     // [this.x] (或是 x)：
//     // 代表「我」。也就是 `==` 符號左邊那個 Point 物件的 x 座標。
    
//     // [other.x]：
//     // 代表「他」。也就是 `==` 符號右邊當作參數傳進來的那個 Point 物件的 x 座標。

//     // [&&] (AND 運算子)：
//     // 意思是「而且」。必須兩個條件同時成立。
    
//     // 整句翻譯：
//     // 「如果 (我的 x 等於 他的 x) 而且 (我的 y 等於 他的 y)，那我們就是相等的。」
//     return x == other.x && y == other.y;
//   }
// }

// void main() {
//   final p1 = Point(1, 2);
//   final p2 = Point(1, 2);

//   // 測試比較邏輯
//   // p1 是 "this" (我)，p2 是 "other" (他)
//   // 比較： 1 == 1 (True) && 2 == 2 (True) -> 結果 True
//   print(p1 == p2); 
// }









/**
 * 主題：Point 物件的誕生、相遇與繁衍 (Life Cycle & Operation)
 * 場景：main 函式中的第一行 print(Point(1, 1) + Point(2, 0));
 */

// [階段一：左邊物件的誕生 (Creation of Left Operand)]
// 1. 程式執行到 Point(1, 1)。
// 2. 觸發 const Point(this.x, this.y) 建構式。
// 3. 記憶體配置：在 Heap 中切出一塊空間 (假設地址為 0x001)。
// 4. 初始化：將 1 填入 x，將 1 填入 y。
// 5. 標記：這塊 0x001 物件現在是「左運算元 (this)」。

// [階段二：右邊物件的誕生 (Creation of Right Operand)]
// 1. 程式執行到 Point(2, 0)。
// 2. 再次觸發建構式。
// 3. 記憶體配置：在 Heap 中切出另一塊新空間 (假設地址為 0x002)。
// 4. 初始化：將 2 填入 x，將 0 填入 y。
// 5. 標記：這塊 0x002 物件現在是「右運算元 (other)」。

// [階段三：相加運算 (The Operation)]
// 1. 呼叫：0x001 物件呼叫了它的 operator + 方法。
// 2. 傳參：0x002 物件被當作參數 (other) 傳進去。
// 3. 執行 operator + 內部的邏輯：
//    - 計算 x：this.x (1) + other.x (2) = 3
//    - 計算 y：this.y (1) + other.y (0) = 1

// [階段四：新物件的誕生 (Creation of Result)]
// 1. 運算子內部執行 return Point(3, 1)。
// 2. 第三次觸發建構式！
// 3. 記憶體配置：在 Heap 中切出第三塊空間 (假設地址為 0x003)。
// 4. 初始化：將 3 填入 x，將 1 填入 y。
// 5. 回傳：0x003 物件被丟回給 main 函式。

// [階段五：顯示 (Printing)]
// 1. print 接收到 0x003 物件。
// 2. 呼叫 0x003.toString()。
// 3. 執行覆寫邏輯：回傳字串 "Point(3, 1)"。
// 4. 螢幕顯示結果。

// [階段六：銷毀 (Destruction - 補充知識)]
// 這一行執行完後，0x001, 0x002, 0x003 都沒人用了。
// Dart 的垃圾回收車 (Garbage Collector) 會在稍後將它們全部回收。