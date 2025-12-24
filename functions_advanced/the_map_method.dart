void main(){
  const list = [1, 2, 3,];
  list.forEach(print);
  //map method
  final doubles = list.map((value) => value * 2);
  print(doubles);
  //for loop
  // final doubles2 = [];
  // for (var value in list){
  //   doubles2.add(value * 2);
  // }
}


// /**
//  * 主題：Map 方法與集合轉換 (Collection Transformation)
//  * 硬核定義：map 是一個「惰性 (Lazy)」轉換方法，它不會改變原始 List，
//  * 而是回傳一個包含轉換後結果的 Iterable（可迭代物件）。
//  */

// void main() {
//   // [const]：定義編譯期常數，此 List 物件存儲於唯讀記憶體區。
//   // [list]：識別碼，型別推斷為 List<int>。
//   // [1, 2, 3]：資料實體（整數物件）。
//   const list = [1, 2, 3];

//   // [list.forEach]：執行「副作用」迭代。
//   // [print]：將頂層函式的引用 (Reference) 傳入作為引數。
//   // 此行會依次將 1, 2, 3 丟進 print 執行，輸出至控制台。
//   list.forEach(print);

//   // ---------------------------------------------------------
//   // 核心：Map 方法 (The Map Method)
//   // ---------------------------------------------------------
  
//   // [final]：宣告執行期不可變變數。
//   // [doubles]：變數名稱。型別推斷為 Iterable<int>。
//   // [list.map]：呼叫轉換方法。它會啟動一個內部的 Iterator 協議。
//   // [(value)]：匿名函式的參數。代表當前正被處理的元素。
//   // [=> value * 2]：轉換邏輯表達式。每一項都會被乘 2。
//   final doubles = list.map((value) => value * 2);

//   // [print(doubles)]：印出結果。
//   // 注意：輸出會是 (2, 4, 6) 而非 [2, 4, 6]。
//   // 因為 map 回傳的是 Iterable 物件，而非 List 物件。
//   print(doubles); 

//   // ---------------------------------------------------------
//   // 對比：傳統 For 迴圈做法 (Traditional For-in Loop)
//   // ---------------------------------------------------------
  
//   // [final doubles2 = []]：建立一個空的動態清單。
//   // final doubles2 = <int>[]; 

//   // [for-in]：顯式外部迭代。
//   // [var value]：定義疊加器變數。
//   // [list]：遍歷的對象。
//   // for (var value in list) {
//   //   // [add]：呼叫 List 的方法將新資料壓入。
//   //   // [value * 2]：計算邏輯。
//   //   doubles2.add(value * 2);
//   // }
  
//   // 💡 總結：map 方法用一行代碼取代了傳統迴圈的「建立空籃子、遍歷、塞進去」三個步驟。
// }