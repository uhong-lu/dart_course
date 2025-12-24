void amin(){
  const list = [1, 2, 3, 4];
  final sum = list.reduce((value, element) => value + element);  //lisr.reduce takes a function that has two input values, and one output value. And the way we can use this function is by combining all the values inside the list. So to get the sum all the values in the list, we can specify two arguments called value and element and we can use them to return value + element like this. And then we can assign the result of this expression to a varaible.
  print(sum);
  //value : 1 3 6 10
  //element : 2 3 4
}
//the way reduce works is that it takes the first item inside the list and assigns it to a variable and then it combines this with all the remaining items in the list using the combine function provided. Now just by looking at this code, it's not obvious how these arguments change as we iterate through the items.
//So to better understand this let me add some comments.
//At the brgging reduce takes the first item in the list and assigns it to this value variable.
//then it starts iterating and tales the second iten in the list and assigns it to this element variable, and then it calls the combine fucntion with these values.
//And since here we return value + element, then the result of this expression is 3,and this is used to update this value. So this is now 3,and the next item on the list is used,in this case the number three.
//Then the combine function is called again,because 3 + 3 makes 6, then this value now has the value of 6.Then we get the last item on the list which is 4.And we call combine one last time.
//this will add 6 + 4, and returm 10 as the final result,which is the sum of all the items in the list.
//So the reduce method is useful when you want to combine all the values inside a collection without using a for loop.
//though as we have seen, it's a bit harder to figure out how the items are processed.
//it's perfecftly fine to use a standard fot-in loop.

// /**
//  * 主題：The reduce method (歸約方法)
//  * 硬核定義：將集合中的元素透過指定函式「遞迴結合」，最終簡化為單一值的過程。
//  * 限制：清單不可為空 (Empty List will throw StateError)。
//  */

// void main() {
//   // [const]：編譯期常數標籤。
//   // [list]：識別碼，指向 Heap 中包含 [1, 2, 3, 4] 的 List<int> 物件實例。
//   const list = [1, 2, 3, 4];

//   // ---------------------------------------------------------
//   // 核心：reduce 方法的運算機制
//   // ---------------------------------------------------------
  
//   // [final sum]：宣告不可變變數，型別推斷為 int。
//   // [list.reduce]：呼叫 Iterable 介面定義的歸約方法。
//   // [(value, element)]：匿名函式的雙參數。
//   // - [value]：累加器 (Accumulator)，儲存「上一次運算後的結果」。
//   // - [element]：當前元素 (Current Element)，代表「目前正在遍歷到的項目」。
//   // [=> value + element]：結合邏輯。這是一個「純函數」，定義如何合併這兩個值。
//   final sum = list.reduce((value, element) => value + element);

//   // [print(sum)]：輸出最終結果 10。
//   print(sum);
// }

// /**
//  * 🔬 執行期狀態追蹤 (Runtime State Trace)
//  * ---------------------------------------------------------
//  * 初始狀態：reduce 自動提取第一個元素 (1) 作為 value 的起始值。
//  * * 輪次 | value (累加值) | element (當前值) | 運算 (value + element) | 下一輪的 value
//  * ----|--------------|----------------|----------------------|--------------
//  * 第1輪| 1 (第1個元素)  | 2 (第2個元素)    | 1 + 2 = 3            | 3
//  * 第2輪| 3            | 3 (第3個元素)    | 3 + 3 = 6            | 6
//  * 第3輪| 6            | 4 (第4個元素)    | 6 + 4 = 10           | 10 (結束)
//  * ---------------------------------------------------------
//  * * [技術總結]：
//  * 1. [Iterator]：reduce 內部會自動移動疊加器。它跳過了第1個元素的迭代，直接從第2個開始。
//  * 2. [類型約束]：reduce 要求傳回值的型別必須與元素型別相同（int 進，int 出）。
//  * 3. [對比 fold]：如果你需要自定義起始值（例如從 100 開始加），或者轉換型別，則應改用 fold。
//  */