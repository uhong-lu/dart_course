void main(){
  // int
  const list = [1, 2, 3];
  // double
  const list2 = [1.0, 2.0, 3.0];
  list.forEach(print);
  //int case1 only double the values only works with integers
  //法一 final List<int> doubles = list.map((value) => value * 2).toList();
  //法二 
  // final doubles = doubleItems(list);
  // print(doubles);

  //int case2 use anonymous functions to make our code more reusable
  final doubles = transform(list, (x) => x * 2);
  final squares = transform(list, (x) => x * x);
  // final squares = transform(list2, (x) => x * x);  will get error
  print(doubles);
  print(squares);

  //case3 make it generic to work with any type
  final doublesgen = transformgen<int>(list, (x) => x * 2); //using a generic type T doesnt guarantee that T is not-nullable. With null safety, we cant multiply numbers that may be null. We sure these lists contain non-nullable values, we can annotate this function. From transformgen to transformgen<int>
  final squaresgen = transformgen<double>(list2, (x) => x * x);
  print(doublesgen);
  print(squaresgen);

  //case4 input type different from output type
  final doublesformDifferent = transformDifferent<int, int>(list, (x) => x * 2); //using a generic type T doesnt guarantee that T is not-nullable. With null safety, we cant multiply numbers that may be null. We sure these lists contain non-nullable values, we can annotate this function. From transformgen to transformgen<int>
  final roundformDifferent = transformDifferent<double, int>(list2, (x) => x.round());//inpuy output different type
  print(doublesformDifferent);
  print(roundformDifferent);
}

//int case1 double the values only works with integers
List<int> doubleItems(List<int> items) { //This function would return a List of type int and we could call it doubleItems List of int values as an argument
  var result = <int>[]; //We create an empty List of type int called result
  for (var x in items) { //We iterate over each item in the input List
    result.add(x * 2); //For each item, we multiply it by 2 and add it to the result List
  }
  return result;
}

 //int case2 make caculate methods more generic
 List<int> transform(List<int> items, int Function(int) f) { //rename to transform create new function argument that we will use to transform each item in the list  add a new function argument that returns an int and takes an argument of type int call this f
  var result = <int>[]; 
  for (var x in items) {
    result.add(f(x)); //quite powerful ,delegate the transformation of each item in the list to a function argument 將清單中每個項目的轉換工作，委派給一個函數參數來處理
  }
  return result;
}

//case3 make it generic to work with any type
 List<T> transformgen<T>(List<T> items, T Function(T) f) { //define a function that uses generics , we have to specify a generic type after the function name, by convention generic types always use capital letters of the alphabet
  //return type can be a list of T items argument can be a list of T and function argument can return T and take an argument of type T
  var result1 = <T>[];  //list literal should be of type T //when convert a function to use generics make sure you update all the types accordingly
  for (var x in items) {
    result1.add(f(x)); 
  }
  return result1;
}

//a list of doubles to a list of integers
//case4 input type different from output type
//solution is to add one additional generic type
 List<R> transformDifferent<T, R>(List<T> items, R Function(T) f) { //return list of R Use R as the return type of the anonymous function This result2 variable should be a list of Type R
  var result2 = <R>[];  
  for (var x in items) {
    result2.add(f(x)); 
  }
  return result2;
}


// /**
//  * 主題：從硬編碼到泛型 (From Hard-coded to Generics)
//  * 核心觀念：利用匿名函式進行「邏輯委派」，利用泛型實現「型別抽象」。
//  */

// void main() {
//   // ---------------------------------------------------------
//   // 準備資料源 (Data Sources)
//   // ---------------------------------------------------------
  
//   // [const]：編譯期常數。 [list]：識別碼，指向 Heap 中的 List<int> 物件。
//   const list = [1, 2, 3];
//   // [list2]：識別碼，指向 Heap 中的 List<double> 物件。
//   const list2 = [1.0, 2.0, 3.0];

//   // [forEach]：Iterable 介面的方法。 [print]：頂層函式引用，作為 Callback 傳入。
//   list.forEach(print);

//   // ---------------------------------------------------------
//   // Case 1: 專用函式 (Specific Function)
//   // ---------------------------------------------------------
//   // 呼叫 doubleItems，僅能處理 List<int>。
//   final doubles1 = doubleItems(list);
//   print('Case 1: $doubles1');

//   // ---------------------------------------------------------
//   // Case 2: 邏輯委派 (Logic Delegation)
//   // ---------------------------------------------------------
//   // [transform]：高階函式。
//   // [(x) => x * 2]：匿名函式 (引數)，定義了「如何轉換」。
//   final doubles2 = transform(list, (x) => x * 2);
//   // [(x) => x * x]：換一個匿名函式，邏輯立刻改變，無需重寫 transform。
//   final squares2 = transform(list, (x) => x * x);
//   print('Case 2: $doubles2, $squares2');

//   // ---------------------------------------------------------
//   // Case 3: 單一泛型 (Single Generic Type)
//   // ---------------------------------------------------------
//   // [<int>]：顯式指定泛型 T 為 int。
//   final doublesGen = transformgen<int>(list, (x) => x * 2);
//   // [<double>]：顯式指定泛型 T 為 double，這讓函式能處理不同型別。
//   final squaresGen = transformgen<double>(list2, (x) => x * x);
//   print('Case 3: $doublesGen, $squaresGen');

//   // ---------------------------------------------------------
//   // Case 4: 多重泛型 (Multiple Generics - Type Mapping)
//   // ---------------------------------------------------------
//   // [<double, int>]：T 是 double (輸入), R 是 int (輸出)。
//   // [x.round()]：呼叫 double 的方法，回傳 int。
//   final roundDiff = transformDifferent<double, int>(list2, (x) => x.round());
//   print('Case 4 (Double to Int): $roundDiff');
// }

// // =========================================================
// // 函式定義區 (Function Definitions)
// // =========================================================

// /**
//  * Case 1: 僅限整數倍增
//  * [List<int> items]：參數，限制僅能接收整數清單。
//  */
// List<int> doubleItems(List<int> items) {
//   // [<int>[]]：實例化一個空的 List 物件，限定儲存 int。
//   var result = <int>[]; 
//   // [for-in]：外部迭代器。 [x]：迭代變數，取得清單中的每個整數。
//   for (var x in items) {
//     // [add]：List 方法，將計算後的結果壓入。
//     result.add(x * 2); 
//   }
//   return result; // 傳回累積後的清單物件。
// }

// /**
//  * Case 2: 委派邏輯
//  * [int Function(int) f]：函式型別參數。
//  * - 接收一個「工人」，這個工人必須能處理 int 並回傳 int。
//  * 可以重複使用 transform，邏輯全交給 f 處理。
//  */
// List<int> transform(List<int> items, int Function(int) f) {
//   var result = <int>[]; 
//   for (var x in items) {
//     // [f(x)]：執行委派的邏輯。transform 函式本身不知道要做什麼運算，全部交給 f。
//     result.add(f(x)); 
//   }
//   return result;
// }

// /**
//  * Case 3: 泛型抽象
//  * [<T>]：型別參數標記。告訴編譯器 T 是一個佔位符，執行時才決定。
//  * [List<T>]：傳回值與參數皆使用 T，保證「進去是什麼型別，出來就是什麼型別的清單」。
//  */
// List<T> transformgen<T>(List<T> items, T Function(T) f) {
//   // [<T>[]]：根據呼叫時決定的 T，建立對應型別的空清單。
//   var result = <T>[]; 
//   for (var x in items) {
//     result.add(f(x)); 
//   }
//   return result;
// }

// /**
//  * Case 4: 多型別對映 (Input T -> Output R)
//  * [<T, R>]：兩個獨立的型別參數。
//  * [List<R>]：傳回值是結果型別 R 的清單。
//  * [R Function(T) f]：工人接收 T，但回傳 R。這允許了「型別轉換」。
//  */
// List<R> transformDifferent<T, R>(List<T> items, R Function(T) f) {
//   // [<R>[]]：建立儲存「結果型別」的清單。
//   var result = <R>[]; 
//   for (var x in items) {
//     // [f(x)]：將型別 T 的物件餵進去，拿回型別 R 的物件。
//     result.add(f(x)); 
//   }
//   return result;
// }