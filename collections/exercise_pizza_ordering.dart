void main(){
  const pizzaPrices = {
  'margherita': 5.5,
  'pepperoni': 7.5,
  'vegetarian': 6.5,
};
const order = ['margherita', 'pepperoni' ,'pie'];
var total = 0.0;
for(var item in order){
  final price = pizzaPrices[item];
  if(price != null){
    total += price;
  } else {
    print("Pizza $item is not on the menu.");
  }
}
print("Total price: \$${total}");
}


///Sol2
// import 'dart:io';

// // 增強型列舉：定義披薩種類、簡寫代碼與單價
// enum Pizza {
//   margherita('m', '瑪格麗特', 5.5),
//   pepperoni('p', '義大利腸', 7.5),
//   vegetarian('v', '蔬菜', 6.5);

//   final String code;
//   final String displayName;
//   final double price;

//   const Pizza(this.code, this.displayName, this.price);

//   // 靜態方法：根據輸入代碼回傳對應的披薩物件
//   static Pizza? fromCode(String code) {
//     for (var pizza in Pizza.values) {
//       if (pizza.code == code.toLowerCase()) return pizza;
//     }
//     return null;
//   }
// }

// void main() {
//   print("--- 歡迎使用披薩自動訂購系統 ---");
//   print("指令說明: 輸入代碼組合成訂單 (如: 'mp' 代表瑪格麗特與義大利腸)");
//   print("輸入 'q' 結束程式。");

//   while (true) {
//     stdout.write("\n請輸入披薩代碼 (m/p/v) 或輸入 'q' 離開: ");
//     final input = stdin.readLineSync()?.trim().toLowerCase() ?? '';

//     // 功能：輸入 q 結束迴圈
//     if (input == 'q') {
//       print("感謝您的光臨，再見！");
//       break;
//     }

//     if (input.isEmpty) continue;

//     // 解析輸入字串 (例如 "mp")
//     List<Pizza> selectedPizzas = [];
//     bool hasInvalidInput = false;

//     for (var i = 0; i < input.length; i++) {
//       final char = input[i];
//       final pizza = Pizza.fromCode(char);
//       if (pizza != null) {
//         selectedPizzas.add(pizza);
//       } else {
//         print("錯誤：代碼 '$char' 無效，此部分將被忽略。");
//         hasInvalidInput = true;
//       }
//     }

//     // 如果完全沒有合法輸入，跳回開頭
//     if (selectedPizzas.isEmpty) {
//       if (!hasInvalidInput) print("請輸入至少一個有效的代碼。");
//       continue;
//     }

//     double grandTotal = 0;
//     print("\n您選擇了 ${selectedPizzas.length} 個披薩：");

//     // 處理每種選中披薩的數量
//     for (var pizza in selectedPizzas) {
//       stdout.write("請輸入 [${pizza.displayName}] 的數量: ");
//       final quantityInput = stdin.readLineSync();
//       final quantity = int.tryParse(quantityInput ?? '');

//       if (quantity != null && quantity > 0) {
//         double subTotal = pizza.price * quantity;
//         grandTotal += subTotal;
//         print("-> ${pizza.displayName} x $quantity = \$${subTotal.toStringAsFixed(2)}");
//       } else {
//         print("-> 數量無效，此項訂單取消。");
//       }
//     }

//     if (grandTotal > 0) {
//       print("-" * 30);
//       print("訂單總計金額: \$${grandTotal.toStringAsFixed(2)}");
//       print("-" * 30);
//     } else {
//       print("未選購任何有效的披薩。");
//     }
//   }
// }