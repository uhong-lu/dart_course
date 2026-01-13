// Given the following (incomplete) program:

// void main() {
//   for (var i in 1.rangeTo(5)) {
//     print(i);
//   }
//   // output: [1, 2, 3, 4, 5]
// }
// Create an extension on int that implements a rangeTo method.

// This method should take an int other argument, and use it to return a list containing all the integer values inside the range in increasing order.

// If the other argument is less than the initial value, the method should return an empty list.


extension Range on int{
  List<int> rangeTo(int other){
    if(other < this){
      return [];
    }
    var list = [this];
    for (var i = this + 1; i <= other; i++){
      list.add(i);
    }
    return list;
  }
}

void main() {
  for (var i in 1.rangeTo(5)) {
    print(i);
  }
  for (var i in 6.rangeTo(5)) {
    print(i);
  }
}








// // 定義一個回傳 List<int> 的方法，名稱叫 rangeTo，接收一個參數 other
//   List<int> rangeTo(int other) {
    
//     // [this]: 在 extension 中，`this` 代表「呼叫這個方法的那個整數物件」。
//     // 例如 1.rangeTo(5)，這裡的 this 就是 1。
    
//     // 檢查：如果目標比起點還小 (例如 6.rangeTo(5))
//     if (other < this) {
//       return []; // 回傳空列表
//     }

//     // 初始化列表，先把起點 (this) 放進去
//     var list = [this];

//     // 跑迴圈：從起點+1 開始，直到目標數字 (other)
//     for (var i = this + 1; i <= other; i++) {
//       list.add(i); // 把數字加入列表
//     }
    
//     return list; // 回傳做好的列表
//   }


// void main() {
//   // [1.rangeTo(5)]
//   // Dart 編譯器看到 int 類別原本沒有 rangeTo 方法。
//   // 它會去查所有的 Extension，發現 Range 有定義。
//   // 於是它把 1 當作 this，5 當作 other，執行擴充方法。
//   for (var i in 1.rangeTo(5)) { 
//     print(i); // 印出 1, 2, 3, 4, 5
//   }

//   // 測試防呆邏輯
//   for (var i in 6.rangeTo(5)) {
//     print(i); // 這裡是空列表，所以什麼都不會印
//   }
// }