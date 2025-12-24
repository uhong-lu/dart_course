void main(){
  const list = [1, 2, 3, 4];
  final even = list.where((value) => value % 2 == 0); //list.where this method takes a function argument that returns a "Boolean" value and takes an integer argument
  //final even = the result of this expression 
  //use where to perform filtering operations(no for loop needed)
  print(even);
  final value = list.firstWhere((x) => x == 5,orElse: () => -1);
  // final value = list.firstWhere((x) => x == 4,orElse: () => -1);
  //use firstWhere to get the first item inside a list that matches a certain condition
  //firstWhere method takes two function arguments
  //the first function argument is a condition that is evaluated on the items of the list
  //the second function argument is we can use if none of the arguments match this condition
  print(value);
}



// /**
//  * 主題：where 與 firstWhere 方法
//  * 硬核定義：
//  * - where：回傳一個「延遲計算」的 Iterable，包含所有符合條件的元素。
//  * - firstWhere：掃描集合，回傳「第一個」符合條件的元素實體。
//  */

// // [void]：回傳型別標記。 [main]：執行環境入口點。
// void main() {
//   // [const]：編譯期常數。 [list]：識別碼，型別推斷為 List<int>。
//   // [[1, 2, 3, 4]]：資料源物件 (Source Object)。
//   const list = [1, 2, 3, 4];

//   // ---------------------------------------------------------
//   // 核心 1：where 方法 (Filtering)
//   // ---------------------------------------------------------
  
//   // [final even]：識別碼，型別推斷為 Iterable<int>。
//   // [list.where]：呼叫篩選方法。
//   // [(value)]：匿名函式的參數，代表迭代器目前指向的整數元素。
//   // [value % 2 == 0]：布林表達式 (Predicate)。
//   // - 運作機制：where 會逐一將元素餵給此函式，若回傳 true 則保留該元素。
//   // - 💡 注意：這也是延遲計算的，此時並未真正跑完篩選。
//   final even = list.where((value) => value % 2 == 0); 
  
//   // [print(even)]：輸出結果為 (2, 4)。 圓括號表示它是一個 Iterable。
//   print(even);

//   // ---------------------------------------------------------
//   // 核心 2：firstWhere 方法 (Searching)
//   // ---------------------------------------------------------
  
//   // [final value]：型別推斷為 int。
//   // [list.firstWhere]：呼叫尋找方法。
//   // [(x) => x == 5]：引數一（匿名函式）。這是「搜尋條件 (Test Condition)」。
//   // [orElse:]：具名參數 (Named Parameter)。
//   // [() => -1]：引數二（匿名函式）。這是「後備方案 (Fallback Callback)」。
//   // - 運作機制：
//   //   1. 迭代 list，檢查是否有元素等於 5。
//   //   2. 如果找到，立即回傳該元素並終止掃描。
//   //   3. 如果掃描完畢都沒找到（如本例），則執行 orElse 函式並回傳其結果 (-1)。
//   final value = list.firstWhere((x) => x == 5, orElse: () => -1);
  
//   // 若取消註解下面這行：
//   // 因為 4 存在於 list 中，firstWhere 會找到 4 並直接回傳，不會執行 orElse。
//   // final valueFound = list.firstWhere((x) => x == 4, orElse: () => -1);

//   print(value);
// }