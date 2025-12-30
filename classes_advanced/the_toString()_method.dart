
// void main(){
//   const list = [1, 2, 3];
//   print(list);          //print method automatically calls the .toString() method
//   print(list.toString());  //explicitly calling the .toString() method
// }


// ///define own class
// class Point{
//   const Point(this.x, this.y); //const constructor
//   final int x;
//   final int y;
// }

// void main(){
//   print(Point(1,1)); //haven't implemented toString() method
// }


// ///to fix
// class Point{
//   const Point(this.x, this.y); 
//   final int x;
//   final int y;

//   @override
//   String toString() => 'Point($x, $y)'; //override toString() method
// }

// void main(){
//   print(Point(1,1)); 
// }

///readable example collections and nested classes
class Point{
  const Point(this.x, this.y); 
  final int x;
  final int y;

  @override
  String toString() => 'Point($x, $y)'; 
}

void main(){
  print(Point(1,1)); 
  const list = [Point(1,2), Point(3,4)];
  print(list);
}
///bottom line : when you create your own classes and you want to print the value of their member variables,it's a good idea to override the 'toString()' method
///particularly useful when defining model classes that represent some objects in the real world such as 'Person' or 'Empoloyee'











// /**
//  * 主題：toString() 方法 (The toString() Method)
//  * 核心觀念：
//  * 1. 所有的 Dart 物件都有 toString() 方法。
//  * 2. 自定義類別預設的 toString() 只會印出「Instance of 'ClassName'」。
//  * 3. 透過 @override 覆寫 toString()，我們可以自定義物件被 print 時的顯示內容，方便除錯。
//  */

// // ---------------------------------------------------------
// // Part 1: 基礎觀察 (List 的行為)
// // ---------------------------------------------------------
// // void main() {
// //   // [const list]：建立一個編譯期常數清單。
// //   const list = [1, 2, 3];
  
// //   // [print(list)]：當你把物件丟給 print 時，它會在背後自動呼叫 list.toString()。
// //   // List 類別已經幫我們寫好了漂亮的 toString()，所以會印出 [1, 2, 3]。
// //   print(list); 
  
// //   // [list.toString()]：這行跟上面那一行的效果完全一樣，只是明確寫出來而已。
// //   print(list.toString());
// // }


// // ---------------------------------------------------------
// // Part 2: 自定義類別的問題 (The Problem)
// // ---------------------------------------------------------
// /*
// class Point {
//   // [const Point(this.x, this.y)]：建構子，使用簡寫語法初始化 x 和 y。
//   const Point(this.x, this.y); 
  
//   // [final int x, y]：不可變的成員變數 (座標)。
//   final int x;
//   final int y;
// }

// void main() {
//   // [Point(1,1)]：建立一個 Point 物件。
//   // 😱 問題：這裡會印出 "Instance of 'Point'"。
//   // 原因：我們沒有教 Point 類別「該怎麼介紹自己」，所以它用預設的方式回答。
//   print(Point(1, 1)); 
// }
// */


// // ---------------------------------------------------------
// // Part 3: 解決方案 (Override toString)
// // ---------------------------------------------------------

// // [class Point]：定義一個座標點類別。
// class Point {
//   // [const Point]：常數建構子，允許建立編譯期常數物件。
//   const Point(this.x, this.y); 
  
//   final int x;
//   final int y;

//   // [@override]：覆寫標記。
//   // 告訴編譯器：「我要取代原本預設的 toString 行為」。
//   // [String toString()]：回傳型別必須是 String。
//   // [=> 'Point($x, $y)']：使用箭頭語法與字串插值，回傳易讀的格式。
//   @override
//   String toString() => 'Point($x, $y)'; 
// }

// // ---------------------------------------------------------
// // Part 4: 巢狀結構與集合應用 (Nested Classes & Collections)
// // ---------------------------------------------------------

// void main() {
//   // 1. 印出單一物件
//   // 因為我們覆寫了 toString()，現在會印出 "Point(1, 1)"，清楚多了！
//   print(Point(1, 1)); 

//   // 2. 印出包含物件的清單
//   // [const list]：建立一個包含 Point 物件的清單。
//   const list = [Point(1, 2), Point(3, 4)];
  
//   // 💡 當 List 被印出時，它會呼叫裡面每一個元素的 toString()。
//   // 所以你會看到漂亮的：[Point(1, 2), Point(3, 4)]
//   print(list);
// }

// /**
//  * 🎓 教授總結 (Bottom Line)：
//  * 當你設計自己的類別（尤其是像 Person, Order 這種資料模型）時，
//  * 強烈建議覆寫 `toString()` 方法。
//  * 這能讓你在開發與除錯 (Debug) 時，一眼就看懂變數現在的內容是什麼，
//  * 而不是看到一堆無意義的 "Instance of ..."。
//  */