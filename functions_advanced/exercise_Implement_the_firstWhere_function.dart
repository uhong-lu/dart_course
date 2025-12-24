// Implement a firstWhere function that takes three arguments:

// A list of items
// A function argument that can be used to find an item in the list by evaluating each item with a boolean condition
// A named function argument orElse that is used to return a given value if none of the items in the list matches the search condition
// This function should return the first item that matches the search condition, or the value returned by the orElse function if no matches are found.

// Use generics, so the firstWhere function can work on lists of any type.

// Then, use this function to find the value 5 from this list: [1, 2, 3, 4]. The function should return -1 in this case.

void main(){
  const list = [1, 2, 3, 4];
  final result = firstWhere(list, (x) => x == 3,
      orElse: () => -1);
  print(result); 
}

T firstWhere<T>(List<T> items, bool Function(T) f, //first implement the firstWhere funvtion using generics.
    {required T Function() orElse}) {              //This function shouldreturn just one iten and not a list of items. So the return type is T. And then we can type fitsrWhere with a generic type T.And the first argument will be list of items. the second argument is a boolean function that we can use to  evaluate each item. //we can add some curly braces so that the last argument willbe a named argument.
   for (var item in items) {                       //And inside here , we need a function that returns a fallback value if this condition is not true for any of the items. This function has no arguments and is called 、or else、. And here we can mark this function argument as required. So that we can be sure that this argument is always given when we call firstWhere.
    if (f(item)) {
      return item;
    }
  }
  return orElse();                                 //And we only reach this line if this condition was false for all these items. And note that here we are calling 'orElse' with parenthesis becausw this is a function.
}



// /**
//  * 主題：實作自定義泛型 firstWhere 搜尋函式
//  * 硬核目標：實現具備「短路機制」與「後備方案」的搜尋邏輯。
//  */

// // [void]：回傳型別，代表主程式執行後不向操作系統回傳數據。
// // [main()]：程式進入點，負責準備測試數據與驅動邏輯。
// void main() {
//   // [const]：編譯期常數標籤。 
//   // [list]：識別碼，指向 Heap 中包含 [1, 2, 3, 4] 的 List<int> 物件。
//   const list = [1, 2, 3, 4];

//   // [final result]：宣告執行期不可變變數，儲存搜尋結果。
//   // [firstWhere]：呼叫下方定義的高階函式。
//   // [list]：引數一，傳遞資料清單的引用 (Reference)。
//   // [(x) => x == 3]：引數二，匿名函式 (Predicate)。
//   // - 邏輯：判斷目前掃描到的元素是否等於 3。
//   // [orElse: () => -1]：具名引數。
//   // - 提供一個匿名函式作為後備方案，若找不到則回傳 -1。
//   final result = firstWhere(list, (x) => x == 3, orElse: () => -1);

//   // [print(result)]：將搜尋到的結果 (3) 輸出至控制台。
//   print(result); 
// }

// /**
//  * [T]：回傳型別。宣告此函式會回傳一個型別為 T 的單一元素（而非清單）。
//  * [firstWhere<T>]：泛型函式定義標籤。
//  * - [<T>] 是「型別佔位符」，讓函式能適應各種資料型別（如 int, String）。
//  * [List<T> items]：參數一。接收一個型別為 T 的清單物件。
//  * [bool Function(T) f]：參數二。位置參數，接收一個「判斷工人」。
//  * - 這個工人接收一個 T，必須回傳 bool。
//  * [{required T Function() orElse}]：具名參數區塊 (用 {} 包裹)。
//  * - [required]：修飾詞，強制呼叫者必須提供此參數，否則編譯失敗。
//  * - [T Function()]：這是一個「工廠函式」，不接收參數，但必須產出一個型別為 T 的值。
//  * - [orElse]：參數名稱。
//  */
// T firstWhere<T>(List<T> items, bool Function(T) f, 
//     {required T Function() orElse}) {
  
//   // [for (var item in items)]：啟動外部迭代器 (Iterator)。
//   // - item：迭代變數，依序指向清單中的每個 T 物件。
//   for (var item in items) {
//     // [f(item)]：執行邏輯委派。
//     // - 將目前的 item 餵給判斷函式 f。
//     // - [if]：判斷條件是否成立。
//     if (f(item)) {
//       // [return item]：核心機制 —— 短路傳回 (Early Return)。
//       // - 一旦找到符合的物件，立即跳出函式並結束所有迴圈。
//       // - 剩餘的元素將不會被掃描，極大提升效能。
//       return item;
//     }
//   }

//   // [return orElse()]：後備邏輯執行。
//   // - 只有當上面的 for 迴圈跑完「所有元素」且都沒有觸發 if 時，才會來到這一行。
//   // - [()]：執行傳入的 orElse 函式，並將其產出的 T 物件傳回給呼叫者。
//   return orElse(); 
// }