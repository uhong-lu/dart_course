// class Point {
//   const Point(this.x, this.y);
//   final int x;
//   final int y;

//   @override
//   String toString() => 'Point($x, $y)';
// }

// void main(){
//   print( 5 == 5);
//   print( Point(0,0) == Point(0,0)); //False // Dart doesn't know how to compare instances of Point
  
//   //if we want to reliably compareintances of new classes then we must implement equality operator
// }

// class Point {
//   const Point(this.x, this.y);
//   final int x;
//   final int y;

//   @override
//   String toString() => 'Point($x, $y)';

//   @override  //not alowwed to use 'Point' as the type of  the argument because the equality operatorinside the 'Object' class has an argument of type 'Object' and when we override a method or an operator all the arguments must match
//   bool operator == (Object other){ //operator overload allows us to define how an operator works when it is applied to a new type  // the ldeft hand side operand is the current instance which already has X and y variables //And right hand side operand is passed as an argument
//     if (other is Point){  //type check
//       return x == other.x && y == other.y;  //compare coordinates
//     }
//     return false;  //if the other object is not a Point then they are not equal
//   }
// }


class Point {
  const Point(this.x, this.y);
  final int x;
  final int y;

  @override
  String toString() => 'Point($x, $y)';

  @override  
  bool operator == (covariant Point other){  //USE COVARIANT KEYWORD WILL RETURN ERROR WHILE COMPILING
    return x == other.x && y == other.y;
  }


void main(){ 
  print( 5 == 5);  
  print( Point(0,0) == Point(0,0));   //one on the left one on the right  //need to pass an argument of type ibject beacuse the equality operator works with two operands
  // print( Point(0,0) == 'abc');      //Point == to a string literal //when this run then equality operator will be called with a value of type 'String' which is as subclass of 'Object'
 }
}
//Bottom line: we need to check that at runtime this object is actually of type 'Point' before we can compare its coordinates










// 在 Dart 中，預設情況下，即使兩個物件的內容一模一樣，電腦也會認為它們是「不一樣」的。

// 要解決這個問題，我們需要覆寫 == 運算子；而為了讓程式碼更簡潔，我們會用到 covariant 關鍵字。

// 1. 為什麼預設是 false？ (Referential Equality)
// 在沒有覆寫之前，Dart使用的是 引用相等性 (Referential Equality)。

// 比喻：雙胞胎長得一模一樣（內容相同），但他們是兩個不同的人（記憶體位址不同）。

// p1 == p2 預設是在問：「這兩個變數是不是指向記憶體中的同一個位置？」

// 2. 我們想要什麼？ (Value Equality)
// 我們希望使用的是 數值相等性 (Value Equality)。

// 比喻：如果兩張鈔票的面額都是 100 元，我們就視為它們價值相等，不管這張鈔票是哪一年印的。

// 覆寫 operator == 就是在告訴電腦：「不要比記憶體位址了，請比對裡面的 x 和 y 數值。」

// 3. covariant 的硬核角色
// 在 Dart 的標準繼承規則中，子類別的方法參數型別必須比父類別 「更寬鬆或相同」。

// 父類別 Object 的定義：bool operator ==(Object other) (接受任何東西)

// 我們想要的定義：bool operator ==(Point other) (只接受 Point)

// 這在邏輯上是 「變嚴格」 了（縮小範圍）。編譯器通常不允許這樣做（因為這違反了里氏替換原則）。 covariant 就是一張 「特許通行證」，它告訴編譯器：「我知道我在縮小範圍，我願意承擔風險（如果傳進來的不是 Point 就報錯），請讓我這樣寫。」









// /**
//  * 主題：相等運算子 (The Equality Operator) 與 協變關鍵字 (Covariant Keyword)
//  * 核心觀念：
//  * 1. 預設情況下，Dart 的 == 是比較「記憶體位址」(Reference Equality)。
//  * 2. 為了比較「內容」(Value Equality)，我們需要覆寫 (Override) operator ==。
//  * 3. covariant 關鍵字能簡化型別檢查的語法。
//  */

// // ---------------------------------------------------------
// // Part 1: 預設行為 (Default Behavior) - 為什麼回傳 False？
// // ---------------------------------------------------------
// /*
// class Point {
//   const Point(this.x, this.y);
//   final int x;
//   final int y;
// }

// void main() {
//   // [5 == 5]：對於基本型別 (Primitive Types) 如 int，Dart 已經幫我們實作好了數值比較。
//   print(5 == 5); // 輸出: true

//   // [Point(0,0) == Point(0,0)]：建立兩個不同的 Point 物件。
//   // 雖然內容都是 (0,0)，但它們是兩個獨立的物件，住在記憶體中不同的房間。
//   // 預設的 == 只會檢查：「這兩個是不是同一個房間？(位址相同嗎？)」
//   print(Point(0, 0) == Point(0, 0)); // 輸出: False
// }
// */


// // ---------------------------------------------------------
// // Part 2: 傳統覆寫寫法 (Override with 'is' check)
// // ---------------------------------------------------------
// /*
// class Point {
//   const Point(this.x, this.y);
//   final int x, y;

//   // [@override]：覆寫標記。
//   // [bool operator == (Object other)]：
//   // 這是標準寫法。因為父類別 (Object) 定義的 == 接受任何東西 (Object)，
//   // 為了遵守繼承規則，這裡的參數型別必須是 Object。
//   @override
//   bool operator == (Object other) {
//     // [if (other is Point)]：型別檢查 (Type Check)。
//     // 必須先確認傳進來的東西是不是 Point，因為它可能是 String 或 null。
//     if (other is Point) {
//       // 只有確認是 Point 後，才能存取 other.x 和 other.y。
//       return x == other.x && y == other.y;
//     }
//     // 如果傳進來的不是 Point，當然就不相等。
//     return false;
//   }
// }
// */


// // ---------------------------------------------------------
// // Part 3: 現代簡潔寫法 (The 'covariant' Keyword)
// // ---------------------------------------------------------

// class Point {
//   // [const Point]：常數建構子。
//   const Point(this.x, this.y);
  
//   final int x;
//   final int y;

//   // [toString]：覆寫字串轉換方法，方便除錯顯示。
//   @override
//   String toString() => 'Point($x, $y)';

//   // [operator ==]：覆寫相等運算子。
//   // [covariant]：關鍵字 (協變)。
//   // 💡 意義：雖然父類別規定參數要是 Object，但我現在強行規定這裡「只能」收 Point。
//   // 這是一個「特許令」，允許我們縮窄參數的型別範圍。
//   // [Point other]：因為加了 covariant，我們可以把參數型別直接寫成 Point。
//   // 優點：不需要再寫 if (other is Point) 了，編譯器幫我們處理轉型。
//   @override
//   bool operator == (covariant Point other) {
//     // 直接比較當前物件的 x (this.x) 與傳入物件的 x (other.x)。
//     return x == other.x && y == other.y;
//   }
  
//   // ⚠️ 重要提醒：覆寫 == 時，通常也要覆寫 hashCode (雜湊碼)，以確保 Map/Set 運作正常。
//   // 這裡省略 hashCode 是為了專注於 == 的教學。
// }

// void main() {
//   // 1. 比較兩個 Point
//   print(Point(0, 0) == Point(0, 0)); // 輸出: true (因為我們自定義了比較邏輯)

//   // 2. 比較 Point 與 String
//   // 這裡會發生什麼事？
//   // - 程式執行時，會檢查 'abc' 是不是 Point。
//   // - 由於使用了 covariant，Dart 會自動進行型別檢查。
//   // - 如果傳入錯誤型別，可能會拋出錯誤或回傳 false (取決於 Dart 版本與 Null Safety 設定)。
//   // 💡 在現代 Dart 中，如果傳入的型別不符，這行可能會導致執行期錯誤 (Runtime Error)。
//   // 因此使用 covariant 雖然方便，但要確保你只會拿 Point 跟 Point 比。
//   // print(Point(0, 0) == 'abc'); 
// }







// 1. 為什麼預設比較會失敗？ (The Problem)
// 在第一段被註解掉的 main 函式中：

// 原始註解: //False // Dart doesn't know how to compare instances of Point

// 翻譯與解析: 結果為 False。因為 Dart 預設 不知道 如何比較兩個 Point 物件的內容。預設行為是比較記憶體位址（是否為同一個物件實體），而不是比較內容（x, y 是否相同）。

// 原始註解: //if we want to reliably compareintances of new classes then we must implement equality operator

// 翻譯與解析: 如果我們想要可靠地比較新類別的實體（Instance），我們必須實作（覆寫）相等運算子 (operator ==)。

// 2. 傳統的覆寫方式 (The Standard Implementation)
// 在第二個 Point 類別版本中，展示了標準的物件導向寫法：

// 關於參數型別的限制:

// 原始註解: //not alowwed to use 'Point' as the type of the argument because the equality operatorinside the 'Object' class has an argument of type 'Object' and when we override a method or an operator all the arguments must match

// 翻譯與解析: 不允許直接使用 Point 作為參數型別。

// 原因: 因為父類別 Object 中的 operator == 定義參數型別為 Object。當我們覆寫方法時，參數型別必須與父類別完全匹配。

// 關於運算子重載 (Operator Overloading):

// 原始註解: //operator overload allows us to define how an operator works when it is applied to a new type

// 翻譯與解析: 運算子重載允許我們自定義當 == 符號用在這個新類別 (Point) 上時，具體該如何運作。

// 關於左右運算元 (Operands):

// 原始註解: // the ldeft hand side operand is the current instance which already has X and y variables

// 翻譯與解析: == 左邊 的運算元是「當前的物件實體 (this)」，它已經擁有內部的 x 和 y 變數。

// 原始註解: //And right hand side operand is passed as an argument

// 翻譯與解析: == 右邊 的運算元則是被當作「引數 (other)」傳入這個函式中。

// 關於邏輯檢查:

// 原始註解: //type check

// 翻譯與解析: 型別檢查。即程式碼中的 if (other is Point)，先確認傳進來的東西是不是 Point。

// 原始註解: //compare coordinates

// 翻譯與解析: 比較座標。確認型別正確後，才比較 x 和 y 的數值。

// 原始註解: //if the other object is not a Point then they are not equal

// 翻譯與解析: 如果另一個物件根本不是 Point（例如是 String 或 null），那它們當然不相等，直接回傳 false。

// 3. 使用 covariant 與實際呼叫 (Covariant & Execution)
// 在最後一個 Point 類別與 main 函式中：

// 關於參數傳遞:

// 原始註解: //one on the left one on the right //need to pass an argument of type ibject beacuse the equality operator works with two operands

// 翻譯與解析: == 運算子運作於兩個運算元之間（左邊一個，右邊一個）。右邊的那個會被當作參數傳入函式。

// 關於與 String 比較的行為:

// 原始註解: //Point == to a string literal

// 翻譯與解析: 嘗試將 Point 物件與一個字串字面量 ('abc') 進行比較。

// 原始註解: //when this run then equality operator will be called with a value of type 'String' which is as subclass of 'Object'

// 翻譯與解析: 當這行程式執行時，operator == 會被呼叫，並且傳入一個 String 型別的值。因為 String 也是 Object 的子類別，所以這是合法的傳遞（在沒有 covariant 的情況下），但邏輯上會回傳 false。

// 🎯 總結 (The Bottom Line)
// 原始註解: //Bottom line: we need to check that at runtime this object is actually of type 'Point' before we can compare its coordinates

// 翻譯與解析: 結論：在我們能夠比較座標（x 和 y）之前，我們必須在執行期 (Runtime) 檢查傳進來的這個物件，確定它真的屬於 Point 型別。

// 註：使用了 covariant 關鍵字後，Dart 會自動幫我們做這個檢查，如果型別不對（例如傳入 String），程式會直接報錯，而不是默默回傳 false。