// Exercise: Restaurant ratings with classes
// Given the following class:

// class Restaurant {
//   const Restaurant({
//     required this.name,
//     required this.cuisine,
//     required this.ratings,
//   });
//   final String name;
//   final String cuisine;
//   final List<double> ratings;
// }
// Add some new functionality to this class so that it can be used to:

// get the total number of ratings
// calculate the average rating (use a for loop or the reduce operator)
// Create new getter variables or methods depending on what you feel is most appropriate.


class Restaurant {
  const Restaurant({
    required this.name,
    required this.cuisine,
    required this.ratings,
  });
  final String name;
  final String cuisine;
  final List<double> ratings;

  int get numRatings => ratings.length;
  double? avgRating(){
    if (ratings.isEmpty) {
      return null;
    }
    return ratings.reduce((value, element) => value + element) / ratings.length; //care about division by 0
  }
}

void main(){
  
}









// /**
//  * 主題：實戰練習 - 餐廳評分管理
//  * 核心：結合不可變屬性、計算屬性 (Getter) 與 歸約運算 (reduce)。
//  */

// // [class]：類別定義。 [Restaurant]：自定義型別，代表一家餐廳的數據模型。
// class Restaurant {
//   // ---------------------------------------------------------
//   // 1. 構造函式 (Const Constructor)
//   // ---------------------------------------------------------
  
//   // [const]：因為所有屬性都是 final，支援建立編譯期常數以優化記憶體。
//   // [{ }]：具名參數 (Named parameters)，提升呼叫端的可讀性。
//   // [required]：強制的引數 (Argument)，確保物件建立時資料完整。
//   // [this.name], [this.cuisine], [this.ratings]：
//   //    - [this shorthand syntax]：自動接收引數並賦值給同名的成員變數。
//   const Restaurant({
//     required this.name,
//     required this.cuisine,
//     required this.ratings,
//   });

//   // ---------------------------------------------------------
//   // 2. 不可變屬性 (Immutable Properties)
//   // ---------------------------------------------------------
  
//   // [final]：一旦初始化即不可修改。
//   // [String]：字串型別。 [List<double>]：儲存多個評分（雙精度浮點數）的清單物件。
//   final String name;
//   final String cuisine;
//   final List<double> ratings;

//   // ---------------------------------------------------------
//   // 3. 計算屬性：Getter (取得評分總數)
//   // ---------------------------------------------------------
  
//   // [int]：回傳整數。 [get]：宣告為讀取器（看起來像變數，實際執行邏輯）。
//   // [numRatings]：識別碼。 [=>]：箭頭語法回傳結果。
//   // [ratings.length]：存取 List 物件的長度屬性。
//   int get numRatings => ratings.length;

//   // ---------------------------------------------------------
//   // 4. 實例方法：計算平均分 (Average Calculation)
//   // ---------------------------------------------------------
  
//   // [double?]：回傳型別為「可為空的雙精度浮點數」。
//   //    - 💡 理由：如果沒有評分，平均值應該是 null 而非 0，這更符合邏輯。
//   // [avgRating()]：方法名稱。
//   double? avgRating() {
//     // [if (ratings.isEmpty)]：防禦性程式碼。
//     // 💡 重要：reduce 在空清單上執行會噴錯，必須先行檢查。
//     if (ratings.isEmpty) {
//       return null; // 回傳空值，代表無評分。
//     }

//     // [ratings.reduce]：呼叫 List 的歸約方法。
//     // [(value, element)]：匿名函式的參數。
//     //    - [value]：累加器 (Accumulator)，存放之前的加總。
//     //    - [element]：目前的評分元素。
//     // [value + element]：結合邏輯。
//     // [/ ratings.length]：總和除以數量，算出平均值。
//     return ratings.reduce((value, element) => value + element) / ratings.length;
//   }
// }

// // [void main()]：進入點。
// void main() {
//   // [Instantiation]：實例化一個餐廳物件。
//   // [ratings: [...]]：傳入一個 double 清單作為引數。
//   final rest = Restaurant(
//     name: '美味小吃',
//     cuisine: '台式料理',
//     ratings: [5.0, 4.5, 3.5],
//   );

//   // 呼叫 Getter。
//   print('評分數量: ${rest.numRatings}');
  
//   // 呼叫方法並處理可能的 null 值。
//   final avg = rest.avgRating();
//   // [??]：空值合併運算子，若為 null 則顯示 '無'。
//   print('平均評分: ${avg?.toStringAsFixed(1) ?? '無'}');
// }





// 📝 練習核心知識點總結

// 1. 為什麼 numRatings 用 Getter，而 avgRating 用 Method？

// 語意選擇：

// numRatings (數量) 聽起來像是一個物件固有的「屬性」。

// avgRating (計算平均) 涉及較複雜的運算（判斷是否為空、遍歷清單、除法），通常這類耗時或有邏輯判斷的操作，寫成「方法 ()」會讓呼叫者意識到這是一個計算過程。

// 2. 安全的歸約運算 (reduce)

// reduce 是一個強大的工具，但它對空集合非常敏感。

// 開發技巧：在使用 reduce 之前，永遠要檢查 isEmpty。本練習中使用 if (ratings.isEmpty) return null; 完美避開了潛在的執行期錯誤。

// 3. 類型安全與 Null Safety

// 傳回 double? 而不是 double 是專業的表現。

// 如果一個餐廳還沒有被評分，它的平均分數不應該是 0.0（這會被誤解為極差的評價），而是「尚未存在 (null)」。

// 4. const 構造函式的價值

// 雖然我們在 main 中使用了 final，但因為類別定義了 const 構造函式，如果我們有很多重複的餐廳數據，我們可以使用 const 來節省記憶體空間。