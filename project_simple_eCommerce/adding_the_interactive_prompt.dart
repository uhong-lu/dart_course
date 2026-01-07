import 'dart:io';

class Product{
  const Product({required this.id, required this.name, required this.price});
  final int id;
  final String name;
  final double price;

  String get displayName => '($initial)${name.substring(1)}: \$$price';
  String get initial => name.substring(0, 1);
}

class Item{
  const Item({required this.product, this.quantity = 1});
  final Product product;
  final int quantity;

  double get price => quantity * product.price;
}

class Cart{
  //TODO: Add properties and methods to the Cart class
}

const allProducts = [
  Product(id: 1, name: 'apples', price: 1.60),
  Product(id: 2, name: 'bananas', price: 0.70),
  Product(id: 3, name: 'courgettes', price: 1.0),
  Product(id: 4, name: 'grapes', price: 2.00),
  Product(id: 5, name: 'mushrooms', price: 0.80),
  Product(id: 6, name: 'potatoes', price: 1.50),
];
// loop
// prompt :view cart / add item / checkout
// if select add item
// chose a product
// add it to he cart
// print cart
// else if selection == view cart
// print cart
// else if selection == checkout
// do checkout
// exit
// end

void main(){
  while(true){
    stdout.write(
      'What do you want to do? (v)iew items, (a)dd item, (c)heckout: ');
    final line = stdin.readLineSync();
    if(line == 'a'){
      final product = chooseProduct();
      if(product != null){
        print(product.displayName);
      }
    } else if(line == 'v'){
      // view cart
    } else if(line == 'c'){
      // checkout
    } 
  }
}

Product? chooseProduct(){
  final productsList = 
    allProducts.map((product) => product.displayName).join('\n');
  stdout.write('Available products:\n$productsList\nYour choice: ');
  final line = stdin.readLineSync();
  for (var product in allProducts){
    if(product.initial == line){
      return product;
    }
  }
  print('Not found');
  return null;
}













// /**
//  * 主題：互動式命令行介面 (Interactive CLI)
//  * 核心：使用 while 迴圈持續監聽使用者輸入，並透過 stdout/stdin 進行對話。
//  */

// import 'dart:io'; // 引入 dart:io 庫，讓我們可以用 stdin (讀) 和 stdout (寫)。

// // ---------------------------------------------------------
// // 1. 資料模型 (Data Models)
// // ---------------------------------------------------------
// class Product {
//   const Product({required this.id, required this.name, required this.price});
//   final int id;
//   final String name;
//   final double price;

//   // [Getter: displayName]：計算屬性。
//   // 邏輯：將名字的首字母與剩餘部分分開，顯示成如 "(a)pples: $1.6" 的格式。
//   // 用途：讓使用者知道要輸入哪個字母來選擇商品。
//   String get displayName => '($initial)${name.substring(1)}: \$$price';

//   // [Getter: initial]：計算屬性。
//   // 邏輯：name.substring(0, 1) 取出字串的第一個字元 (例如 'apples' -> 'a')。
//   // 用途：作為商品的「代號」。
//   String get initial => name.substring(0, 1);
// }

// class Item {
//   const Item({required this.product, this.quantity = 1});
//   final Product product;
//   final int quantity;
//   double get price => quantity * product.price;
// }

// class Cart {
//   // 預告：未來這裡會存放購物車的邏輯。
// }

// // ---------------------------------------------------------
// // 2. 全域常數資料 (Global Constant Data)
// // ---------------------------------------------------------

// // [const allProducts]：商品清單。
// // 記憶體：這些 Product 物件在程式啟動時就被建立，並固定在記憶體中，直到程式結束。
// const allProducts = [
//   Product(id: 1, name: 'apples', price: 1.60),
//   Product(id: 2, name: 'bananas', price: 0.70),
//   Product(id: 3, name: 'courgettes', price: 1.0),
//   Product(id: 4, name: 'grapes', price: 2.00),
//   Product(id: 5, name: 'mushrooms', price: 0.80),
//   Product(id: 6, name: 'potatoes', price: 1.50),
// ];

// // ---------------------------------------------------------
// // 3. 主程式邏輯 (Main Loop)
// // ---------------------------------------------------------

// void main() {
//   // [while(true)]：無窮迴圈。
//   // 這是互動式程式的心臟，保證程式不會執行一次就結束，而是持續等待使用者指令。
//   while (true) {
//     // [Prompt]：顯示主選單。
//     stdout.write('What do you want to do? (v)iew items, (a)dd item, (c)heckout: ');
    
//     // [Input]：讀取使用者輸入 (例如 'a')。
//     final line = stdin.readLineSync();

//     // [Routing]：根據輸入決定要做什麼事。
//     if (line == 'a') {
//       // [Action]：呼叫選擇商品函式。
//       // 這裡展示了如何將複雜邏輯抽離到另一個函式 (chooseProduct)。
//       final product = chooseProduct();
      
//       // [Null Check]：如果選到了商品 (不為 null)，就印出來確認。
//       if (product != null) {
//         print(product.displayName);
//       }
//     } else if (line == 'v') {
//       // TODO: 實作查看購物車功能
//     } else if (line == 'c') {
//       // TODO: 實作結帳功能
//     } 
//   }
// }

// // ---------------------------------------------------------
// // 4. 輔助函式 (Helper Function)
// // ---------------------------------------------------------

// // [Product?]：回傳型別是「可為空的 Product」。
// // 因為使用者可能輸入無效的代號，這時候我們回傳 null。
// Product? chooseProduct() {
//   // [String Construction]：建立商品清單字串。
//   // 1. map: 把每個 Product 物件轉換成它的 displayName 字串。
//   // 2. join('\n'): 把這些字串用換行符號連接起來。
//   final productsList = 
//     allProducts.map((product) => product.displayName).join('\n');
  
//   // [Display]：顯示清單供使用者選擇。
//   stdout.write('Available products:\n$productsList\nYour choice: ');
  
//   // [Input]：讀取使用者選擇 (例如 'a' 代表 apples)。
//   final line = stdin.readLineSync();

//   // [Search Logic]：在清單中尋找對應的商品。
//   for (var product in allProducts) {
//     // 比對：商品的代號 (initial) 是否等於使用者的輸入 (line)？
//     if (product.initial == line) {
//       return product; // 找到了！回傳這個 Product 物件。
//     }
//   }

//   // [Fallback]：跑完迴圈都沒找到，印出提示並回傳 null。
//   print('Not found');
//   return null;
// }















// 執行流程劇本：從啟動到選購蘋果
// 第一幕：程式啟動與初始化
// 載入 allProducts：程式還沒開始跑 main，就先把那 6 個水果 (Product) 放進記憶體了。

// 進入 main()：程式開始。

// 進入 while(true)：這是一個無限迴圈，代表程式會一直跑，直到被強制停止。

// 第二幕：主選單互動
// stdout.write(...)：

// 電腦做的事：印出提示文字，而且游標停在最後面。

// 你看到的：What do you want to do? (v)iew items, (a)dd item, (c)heckout:

// stdin.readLineSync()：

// 電腦做的事：暫停！等你打字。

// 你做的事：輸入 a，然後按 Enter。

// 結果：變數 line 變成了 'a'。

// 第三幕：進入分支邏輯
// if (line == 'a')：

// 判斷：'a' 等於 'a' 嗎？ 是！

// 動作：進入這個區塊，準備呼叫 chooseProduct()。

// 第四幕：切換場景 - chooseProduct() 函式
// (現在我們跳進了 chooseProduct 的大括號裡)

// 產生清單字串 (productsList)：

// 電腦把那 6 個水果的名字都轉好，接成一長串字串（包含換行）。

// stdout.write(...)：

// 電腦做的事：印出那串長長的清單，最後補上 Your choice: 。

// 你看到的：

// Plaintext

// Available products:
// (a)pples: $1.6
// (b)ananas: $0.7
// ...
// (p)otatoes: $1.5
// Your choice: 
// stdin.readLineSync()：

// 電腦做的事：再次暫停，等你選水果。

// 你做的事：輸入 a（代表 apples），按 Enter。

// 結果：這裡的變數 line（注意：這是 chooseProduct 裡的區域變數，跟 main 裡的無關）變成了 'a'。

// 第五幕：搜尋與回傳
// for 迴圈搜尋：

// 電腦拿著 'a' 去 allProducts 裡面一個個比對。

// 第一輪：拿到 Product(apples)。它的 initial 是 'a'。

// 比對：'a' == 'a'？ 中了！

// return product：

// 電腦做的事：立刻停止搜尋，把這顆 apples 物件帶回去給呼叫者（main）。

// 第六幕：回到 main() 繼續執行
// 接收結果：

// main 裡的 final product 變數現在拿到了那顆 apples 物件。

// if (product != null)：

// 判斷：有拿到東西嗎？ 有！

// print(product.displayName)：

// 電腦做的事：呼叫 apples 物件的 displayName 屬性。

// 你看到的：(a)pples: $1.6

// 第七幕：迴圈重來
// 回到 while(true) 開頭：

// 程式沒有結束，它跳回第 4 步。

// 你看到的：What do you want to do? (v)iew items, (a)dd item, (c)heckout:











// import 'dart:io';

// // [1. 類別定義]
// class Product {
//   const Product({required this.id, required this.name, required this.price});
//   final int id;
//   final String name;
//   final double price;

//   String get displayName => '($initial)${name.substring(1)}: \$$price';
//   String get initial => name.substring(0, 1);
// }

// // ... Item 和 Cart 類別保持不變 ...

// // [2. 全域變數]
// const globalProductList = [ // 原本叫 allProducts
//   Product(id: 1, name: 'apples', price: 1.60),
//   // ... 其他商品 ...
// ];

// void main() {
//   while (true) {
//     stdout.write('What do you want to do? (v)iew items, (a)dd item, (c)heckout: ');
    
//     // [改名] line -> mainMenuInput (主選單輸入)
//     final mainMenuInput = stdin.readLineSync(); 

//     if (mainMenuInput == 'a') {
//       // [改名] product -> selectedProduct (被選中的商品)
//       // 這樣就不會跟類別名稱 Product 搞混了
//       final selectedProduct = chooseProduct(); 
      
//       if (selectedProduct != null) {
//         print(selectedProduct.displayName);
//       }
//     } else if (mainMenuInput == 'v') {
//       // ...
//     } else if (mainMenuInput == 'c') {
//       // ...
//     }
//   }
// }

// // [3. 輔助函式]
// Product? chooseProduct() {
//   // [改名] product -> itemInList (清單裡的某個項目)
//   // 原本 map((product) => ...) 容易讓人誤以為那是類別
//   final productsListString = globalProductList
//       .map((itemInList) => itemInList.displayName)
//       .join('\n');
      
//   stdout.write('Available products:\n$productsListString\nYour choice: ');
  
//   // [改名] line -> productChoiceInput (商品選擇輸入)
//   // 這樣就不會跟 main 裡面的 line 搞混了
//   final productChoiceInput = stdin.readLineSync(); 

//   // [改名] product -> candidateProduct (候選商品)
//   // 這裡是在迴圈裡一個個拿出來檢查的商品
//   for (var candidateProduct in globalProductList) {
//     if (candidateProduct.initial == productChoiceInput) {
//       return candidateProduct;
//     }
//   }
//   print('Not found');
//   return null;
// }