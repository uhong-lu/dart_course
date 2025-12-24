void main(){
  const list = [1, 2, 3];
  list.forEach(print);
  final doubles = list.map((value) => value * 2);//不會計算 使用的時候才會計算
  // 如果想確保expression是list type，可以使用toList()方法
  // 不行final List<int> doubles = list.map((value) => value * 2);
  // 可以final doubles = list.map((value) => value * 2).toList();
  print(doubles);
}





// /**
//  * 主題：Map 方法、Iterable 協議與 toList() 的實體化
//  * 硬核解析：理解「延遲計算 (Lazy)」與「立即計算 (Eager)」的記憶體差異。
//  */

// // [void]：函式回傳型別，代表不回傳任何數據。
// // [main]：程式進入點 (Entry Point)，Dart 虛擬機啟動後的首個執行棧。
// void main() {
//   // [const]：編譯期常數標記，資料被固定在記憶體的唯讀區。
//   // [list]：變數名稱（識別碼），型別推斷為 List<int>。
//   // [[1, 2, 3]]：List 物件實體 (Object Instance)。
//   const list = [1, 2, 3];

//   // [list.forEach]：呼叫 Iterable 介面定義的迭代方法。
//   // [print]：傳入頂層函式的「引用 (Reference)」。
//   // 運作：內部 Iterator 啟動，逐一將元素傳給 print 執行副作用 (Side Effect)。
//   list.forEach(print);

//   // ---------------------------------------------------------
//   // 核心 1：map 方法的延遲特性 (Lazy Evaluation)
//   // ---------------------------------------------------------
  
//   // [final]：執行期不可變變數。
//   // [doubles]：變數名稱。
//   // 💡 注意：此時 doubles 的型別是 Iterable<int>，而不是 List<int>。
//   // [list.map]：建立一個 MappedIterable 物件，它只存儲了「地圖」和「公式」。
//   // [(value)]：匿名函式的參數名。代表迭代過程中被提取的當前元素。
//   // [=> value * 2]：轉換表達式。注意：此行執行時，乘法「尚未發生」。
//   final doubles = list.map((value) => value * 2); 

//   // ---------------------------------------------------------
//   // 核心 2：型別不匹配問題 (Type Mismatch)
//   // ---------------------------------------------------------
  
//   // ❌ 錯誤嘗試：
//   // final List<int> badExample = list.map((value) => value * 2);
//   // 原因：map 回傳的是 Iterable (一種序列計畫)，不能直接塞進 List (一種實體空間) 的標籤裡。

//   // ✅ 正確做法：使用 .toList() 進行實體化 (Materialization)
//   // [.toList()]：
//   // 1. 啟動 Iterator。
//   // 2. 執行所有 => value * 2 的運算。
//   // 3. 在 Heap (堆) 記憶體開闢空間。
//   // 4. 將結果填入，回傳一個真正的 List<int> 物件。
//   final listDoubles = list.map((value) => value * 2).toList();

//   // [print(doubles)]：印出資料。
//   // 輸出顯示為 (2, 4, 6) -> 圓括號代表它還是一個 Iterable (延遲序列)。
//   print(doubles); 

//   // [print(listDoubles)]：印出實體化後的清單。
//   // 輸出顯示為 [2, 4, 6] -> 中括號代表它已經是一個實體化的 List。
//   print(listDoubles);
// }
