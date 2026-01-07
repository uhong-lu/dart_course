import 'dart:math';

//immutable class
// class ClosedPath2{
//   const ClosedPath2(this.points);
//   final List<Point> points;
// }

//mutable class, very common to use cascade operator
class ClosedPath{
  List<Point> _points = [];

  void moveTo(Point point){
    _points = [point];
  }

  void lineTo(Point point){
    _points.add(point);
  }
}


//ver1 
//void main(){
//  final path = ClosedPath();
//  path.moveTo(Point(0, 0));
//  path.lineTo(Point(2, 0));


// ver2 cascade operator  //notice semicoLon
void main(){
  final path = ClosedPath()
    
    //null aware variant ?..moveTo(Point(0, 0))
    ..moveTo(Point(0, 0))
    ..lineTo(Point(2, 0))
    ..lineTo(Point(2, 2))
    ..lineTo(Point(0, 2))
    ..lineTo(Point(0, 0));
}





// Dart 獨有的 「級聯運算符 (Cascade Operator) ..」。
// 這個運算符號是 Dart 的語法糖，它能讓你對 「同一個物件」 連續執行多個動作，而不需要每次都重新寫變數名稱。這在 可變物件 (Mutable Objects) 的操作中非常常見且強大。



// /**
//  * 主題：級聯運算符 (Cascade Operator)
//  * 核心：對同一個物件連續下指令，讓程式碼像「清單」一樣整齊。
//  */

// import 'dart:math'; // 引入 Point 類別 (Dart 內建)

// // ---------------------------------------------------------
// // 1. 不可變類別 (Immutable Class) - 對照組
// // ---------------------------------------------------------
// // 這種設計無法使用級聯運算符來「逐步修改」，因為它一旦建立就不能改。
// class ClosedPath2 {
//   const ClosedPath2(this.points);
//   final List<Point> points;
// }

// // ---------------------------------------------------------
// // 2. 可變類別 (Mutable Class) - 實驗組
// // ---------------------------------------------------------
// class ClosedPath {
//   // [Private Property]：私有變數，儲存點的清單。
//   List<Point> _points = [];

//   // [Action 1]：移動起點。
//   // 注意：這個方法回傳 void (不回傳東西)。
//   void moveTo(Point point) {
//     _points = [point];
//   }

//   // [Action 2]：畫線（增加點）。
//   // 注意：這個方法也回傳 void。
//   void lineTo(Point point) {
//     _points.add(point);
//   }
// }

// void main() {
//   // -------------------------------------------------------
//   // Ver 1: 傳統寫法 (Verbose)
//   // -------------------------------------------------------
//   /*
//   final path = ClosedPath();
//   path.moveTo(Point(0, 0)); // 第一步：叫 path 做事
//   path.lineTo(Point(2, 0)); // 第二步：叫 path 做事
//   path.lineTo(Point(2, 2)); // 第三步：叫 path 做事
//   */

//   // -------------------------------------------------------
//   // Ver 2: 級聯運算符 (Cascade Operator)
//   // -------------------------------------------------------
  
//   // [Step A]：建立物件
//   // 在記憶體中建立一個 ClosedPath 物件。此時它就像一個剛請來的「畫家」。
//   final path = ClosedPath() 
  
//     // [Step B]：連續下指令
//     // [..] 的意思是：「對剛剛那個畫家 (path)，執行 moveTo」。
//     // 💡 關鍵：執行完 moveTo 後，它會「自動回傳」那個畫家物件本身 (path)，
//     // 而不是 moveTo 的回傳值 (void)。這就是為什麼我們可以繼續接下去。
//     ..moveTo(Point(0, 0))
    
//     // [Step C]：繼續下指令
//     // 對同一個畫家，執行 lineTo。
//     ..lineTo(Point(2, 0))
//     ..lineTo(Point(2, 2))
//     ..lineTo(Point(0, 2))
//     ..lineTo(Point(0, 0)); // [;]：直到最後這里才寫分號，代表整串指令結束。

//   // [資料去向]：
//   // 所有的 Point 物件都被存進了 path 內部的 _points 清單裡。
//   // path 變數最終指向的是那個「已經畫好所有線」的物件。
// }