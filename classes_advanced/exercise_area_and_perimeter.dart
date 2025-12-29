// Given the following program that defines some Shape, Circle and Square classes:



// import 'dart:math';
 
// abstract class Shape {
//   double get area;
// }
 
// class Square extends Shape {
//   Square(this.side);
//   final double side;
 
//   @override
//   double get area => side * side;
// }
 
// class Circle extends Shape {
//   Circle(this.radius);
//   final double radius;
 
//   @override
//   double get area => pi * radius * radius;
// }
 
// void main() {}
// Add a new perimeter getter variable to the Shape class, and implement it in all subclasses.

// Notes

// the perimeter of a square is equal to 4 * side
// the perimeter of a circle is equal to 2 * pi * radius
// Then, add a new printValues() method to the Shape class. When called, this should print both the area and the perimeter.

// Finally, create a list of shapes that contains Squares and Circles and call the printValues() method on each item.


import 'dart:math';
 
abstract class Shape {
  double get area;
  double get perimeter;

  void printValues() {
    print('Area: $area, Perimeter: $perimeter');
  }
}
 
class Square extends Shape {
  Square(this.side);
  final double side;
 
  @override
  double get area => side * side;

  @override
  double get perimeter => 4 * side;
}
 
class Circle extends Shape {
  Circle(this.radius);
  final double radius;
 
  @override
  double get area => pi * radius * radius;

  @override
  double get perimeter => 2 * pi * radius;
}
 
void main() {
  final shapes = [
    Square(3),
    Circle(4),
  ];
  shapes.forEach((shape) => shape.printValues());
}










// import 'dart:math'; // 匯入數學庫以使用 pi

// /**
//  * 主題：抽象類別的雙重角色
//  * 1. 規範者：強制子類別實作特定屬性 (area, perimeter)。
//  * 2. 實作者：提供子類別可直接繼承的通用邏輯 (printValues)。
//  */

// // [abstract class]：定義抽象類別 Shape。
// abstract class Shape {
//   // -------------------------------------------------------
//   // [抽象成員 (Abstract Members)]
//   // -------------------------------------------------------
//   // [double get area;]：
//   // 抽象 Getter。沒有實作部分（無箭頭 => 或大括號 {}）。
//   // 意義：任何形狀都「必須」能計算面積。
//   double get area;
  
//   // [double get perimeter;]：
//   // 抽象 Getter。
//   // 意義：任何形狀都「必須」能計算周長。
//   double get perimeter;

//   // -------------------------------------------------------
//   // [具體方法 (Concrete Method)]
//   // -------------------------------------------------------
//   // [void printValues()]：
//   // 這是一個已經寫好邏輯的方法。
//   // 💡 關鍵點：抽象類別可以包含具體方法！
//   // 這個方法依賴於抽象的 area 和 perimeter。雖然 Shape 不知道面積怎麼算，
//   // 但它知道「如果你算出來了，我要怎麼印出來」。
//   void printValues() {
//     print('Area: $area, Perimeter: $perimeter');
//   }
// }

// // [class Square extends Shape]：
// // Square 繼承 Shape，因此它必須實作 area 和 perimeter。
// // 同時，它自動獲得了 printValues() 的功能。
// class Square extends Shape {
//   Square(this.side);
//   final double side;

//   // [@override]：實作面積計算邏輯 (邊長 * 邊長)。
//   @override
//   double get area => side * side;

//   // [@override]：實作周長計算邏輯 (邊長 * 4)。
//   @override
//   double get perimeter => 4 * side;
// }

// // [class Circle extends Shape]：
// // Circle 同樣必須履行 Shape 的契約。
// class Circle extends Shape {
//   Circle(this.radius);
//   final double radius;

//   // [@override]：實作圓面積 (πr²)。
//   @override
//   double get area => pi * radius * radius;

//   // [@override]：實作圓周長 (2πr)。
//   @override
//   double get perimeter => 2 * pi * radius;
// }

// void main() {
//   // [List<Shape>]：多型清單。
//   // 我們可以把 Square 和 Circle 都放在同一個清單裡，因為它們本質上都是 Shape。
//   final shapes = [
//     Square(3),
//     Circle(4),
//   ];

//   // [forEach]：遍歷清單。
//   // [shape.printValues()]：
//   // 呼叫的是定義在抽象類別 Shape 中的方法。
//   // 雖然 Square 和 Circle 沒有自己寫 printValues，但它們從父親那裡繼承了這個能力。
//   shapes.forEach((shape) => shape.printValues());
// }