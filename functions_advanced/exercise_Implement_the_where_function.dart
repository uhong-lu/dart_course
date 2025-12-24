
// Implement a where function that takes two arguments:

// A list of items
// A function argument that can be used to filter items in the list by evaluating each item with a boolean condition
// This function should return a new list, which contains the items filtered using the function argument.

// Use generics, so the where function can work on lists of any type.

// Then, use this function to retrieve all the odd numbers from this list: [1, 2, 3, 4], and print the result.

void main(){
  const list = [1, 2, 3, 4];
  final odd = where<int>(list, (value) => value % 2 ==1); //null check //explicitly adding a type annotation of when we call the where function
  print(odd); 
}

List<T> where<T>(List<T> items, bool Function(T) f){ //first of all, we want to declare the where function and write it using generics. So this function should return a List of type T. And it should be called whrere and take a generic T type.
  var results = <T>[];                        //the first aargument should be a list of type called items, and the second argument should be a Boolean function that takes an argument of type T and call this functon f.
  for (var item in items) {
    if (f(item)) {
      results.add(item);
    }
  }  
  return results;
}



// /**
//  * 主題：實作自定義泛型 where 篩選函式
//  * 硬核目標：理解如何將「遍歷邏輯」與「判斷邏輯」分離，實現高度代碼重用。
//  */

// // [void]：回傳型別，標示此進入點不回傳值。
// // [main()]：執行環境優先尋找的入口，在此進行資料準備與函式觸發。
// void main() {
//   // [const]：編譯期常數。 [list]：識別碼，指向 Heap 中不可變的 List<int> 物件。
//   const list = [1, 2, 3, 4];

//   // [final odd]：宣告不可變變數，用來接收篩選後的結果清單。
//   // [where<int>]：明確指定泛型型別 T 為 int。
//   // [list]：引數一，傳入資料源清單。
//   // [(value) => value % 2 == 1]：引數二，匿名函式（Predicate）。
//   // - 此函式符合 bool Function(int) 的規格。
//   // - 邏輯：判斷數值除以 2 的餘數是否為 1（即奇數）。
//   final odd = where<int>(list, (value) => value % 2 == 1); 

//   // [print(odd)]：將結果清單 [1, 3] 輸出至主控台。
//   print(odd); 
// }

// /**
//  * [List<T>]：定義傳回值型別。這是一個裝著 T 類型元素的清單。
//  * [where<T>]：泛型函式定義。
//  * - [<T>] 是「型別參數」，讓這個函式能處理 List<int>、List<String> 等任何型別。
//  * [List<T> items]：參數一。接收待處理的原始資料清單。
//  * [bool Function(T) f]：參數二。這是一個「回呼函式 (Callback)」。
//  * - bool：代表這個工人（f）必須告訴我 True 或 False。
//  * - (T)：代表這個工人必須能處理型別為 T 的單一元素。
//  * - f：參數名稱，在函式內部用來呼叫傳入的邏輯。
//  */
// List<T> where<T>(List<T> items, bool Function(T) f) {
//   // [var results = <T>[]]：實體化一個新的空清單。
//   // - 這是「積極求值 (Eager Evaluation)」的作法，會立刻佔用新的記憶體空間。
//   var results = <T>[]; 

//   // [for (var item in items)]：外部迭代器 (Iterator)。
//   // - 每一輪循環，item 都會指向清單中的下一個 T 型別物件。
//   for (var item in items) {
//     // [if (f(item))]：執行委派邏輯。
//     // - 呼叫傳入的匿名函式 f，並把當前的 item 餵給它。
//     // - 如果 f 覺得這個 item 符合條件（回傳 true）：
//     if (f(item)) {
//       // [results.add(item)]：將該元素存入結果清單的尾端。
//       results.add(item);
//     }
//   } 

//   // [return results]：將收集完畢的新清單物件傳回給呼叫者。
//   return results;
// }