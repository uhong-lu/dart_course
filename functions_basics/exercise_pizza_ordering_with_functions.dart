// void main() {
//   const pizzaPrices = {
//     'margherita': 5.5,
//     'pepperoni': 7.5,
//     'vegetarian': 6.5,
//   };
//   const order = ['margherita', 'pepperoni', 'pineapple'];
//   var total = 0.0;
//   for (var item in order) {
//     final price = pizzaPrices[item];
//     if (price != null) {
//       total += price;
//     }
//   }
//   print('Total: \$$total');
// }
// Modify this program so that the total calculation can be moved to a separate function that can be called multiple times with different orders.


void main(){
  const order = ['margherita', 'pepperoni', 'pineapple'];
  final total = calculateTotal(order);
  print('Total: \$$total');
}


double calculateTotal(List<String> orders) {
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };
  var totalPrice = 0.0;
  for (var order in orders) {
    final price = pizzaPrices[order];
    if (price != null) {
      totalPrice += price;
    }
  }
  return totalPrice;
}





// /**
//  * 主題：函式重構與區域狀態管理
//  * 機制：透過傳值引數 (Argument) 與傳回值 (Return Value) 實現數據流轉。
//  */

// // [void]：回傳型別，標示此函式執行結束後不向作業系統傳回數據。
// // [main()]：程式進入點，負責驅動整體的執行流。
// void main() {
//   // [const]：關鍵字，定義編譯期常數。
//   // [order]：變數名稱，存儲指向 Heap（堆）中 List 物件的位址。
//   // ['margherita', ...]：List<String> 物件，包含三個字串物件的引用。
//   const order = ['margherita', 'pepperoni', 'pineapple'];

//   // [final]：宣告執行期不可變變數。
//   // [total]：接收 calculateTotal 傳回的 double 物件（64-bit 浮點數）。
//   // [calculateTotal(order)]：函式呼叫。將 order 的地址作為「引數 (Argument)」傳入。
//   final total = calculateTotal(order);

//   // [\$]：脫逸字元，用於在字串插值語法中顯示原始的 '$' 符號。
//   // [$total]：字串插值，自動呼叫 total.toString() 並嵌入最終字串。
//   print('Total: \$$total');
// }

// /**
//  * [double]：函式簽章，宣告傳回值必須符合 IEEE 754 雙精度浮點數格式。
//  * [calculateTotal]：函式物件名稱。
//  * [List<String> orders]：參數 (Parameter)。接收呼叫端傳入的清單引用。
//  */
// double calculateTotal(List<String> orders) {
//   // [const pizzaPrices]：區域常數 Map 物件。
//   // [Map<String, double>]：鍵值對結構。Key 為 String，Value 為 double。
//   const pizzaPrices = {
//     'margherita': 5.5,
//     'pepperoni': 7.5,
//     'vegetarian': 6.5,
//   };

//   // [var totalPrice = 0.0]：初始化區域變數（累加器）。
//   // 硬核機制：此變數配置於該函式的 Stack Frame（棧幀）中，函式結束即釋放。
//   var totalPrice = 0.0;

//   // [for (var order in orders)]：疊加器協議 (Iterator Protocol)。
//   // [var order]：迭代變數。每一次循環都會從 orders 引用的清單中取出一個字串物件。
//   for (var order in orders) {
//     // [pizzaPrices[order]]：透過 Key (披薩名) 存取 Map 中的 Value (價格)。
//     // [final price]：型別推斷為 double? (Nullable double)。
//     // 原因：Map 查表可能失敗（如 'pineapple' 不在 Map 中），此時回傳 null。
//     final price = pizzaPrices[order];

//     // [if (price != null)]：空值安全檢查。
//     // [Type Promotion]：在此條件區塊內，price 的型別從 double? 晉升為 double。
//     if (price != null) {
//       // [+=]：算術累加指令。將 price 的數值加到棧變數 totalPrice 上。
//       totalPrice += price;
//     }
//   }

//   // [return]：結束函式執行，並將最終的累加結果從棧幀送回給呼叫者 (main)。
//   return totalPrice;
// }