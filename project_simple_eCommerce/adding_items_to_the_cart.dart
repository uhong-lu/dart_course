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

  @override
  String toString() =>
    '$quantity x ${product.name}  : \$$price';
}

class Cart{
  final Map<int, Item> _items = {};

  void addProduct(Product product){
    final item = _items[product.id];
    if(item == null){
      _items[product.id] = Item(product: product,
        quantity: 1,);
    } else {
      _items[product.id] = Item(product: product, 
      quantity: item.quantity + 1,);
    }
  }
  double total() => 
    _items.values
      .map((item) => item.price)
      .reduce((value, element) => value + element);


  @override
  String toString(){
    if(_items.isEmpty){
      return 'Cart is empty';
    }
    final itemizedList = 
      _items.values.map((item) => item.toString()).join('\n');
    return '------\n$itemizedList\nTotal: \$${total()}\n------';
  }
}

const allProducts = [
  Product(id: 1, name: 'apples', price: 1.60),
  Product(id: 2, name: 'bananas', price: 0.70),
  Product(id: 3, name: 'courgettes', price: 1.0),
  Product(id: 4, name: 'grapes', price: 2.00),
  Product(id: 5, name: 'mushrooms', price: 0.80),
  Product(id: 6, name: 'potatoes', price: 1.50),
];



void main(){
  final cart = Cart();
  while(true){
    stdout.write(
      'What do you want to do? (v)iew items, (a)dd item, (c)heckout: ');
    final line = stdin.readLineSync();
    if(line == 'a'){
      final product = chooseProduct();
      if(product != null){
        cart.addProduct(product);
        print(cart);
      }
    } else if(line == 'v'){
      print(cart);
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



// 🎓 教授的白話文解析
// /**
//  * 主題：實作購物車邏輯 (Cart Implementation)
//  * 核心：使用 Map 來管理購物車狀態，處理新增商品與數量累加。
//  */

// import 'dart:io';

// // Product 與 Item 類別保持不變...
// class Product { ... }
// class Item { ... }

// // ---------------------------------------------------------
// // 1. 購物車類別 (Cart Class) - 邏輯核心
// // ---------------------------------------------------------
// class Cart {
//   // [Private Property]：私有屬性 _items。
//   // [Map<int, Item>]：使用 Map 而不是 List。
//   //    - Key (int): 商品 ID (Product.id)。
//   //    - Value (Item): 購物車項目 (包含商品與數量)。
//   // 💡 為什麼用 Map？因為我們要快速檢查「這個商品是不是已經在車上了」。
//   final Map<int, Item> _items = {};

//   // [Action: addProduct]：將商品加入購物車。
//   void addProduct(Product product) {
//     // [Lookup]：先用商品 ID 去 Map 裡查查看。
//     // 如果找不到，item 會是 null。
//     final item = _items[product.id];

//     // [Logic Branching]：判斷是「新商品」還是「舊商品」。
//     if (item == null) {
//       // [Case A: 新商品]
//       // 建立一個全新的 Item 物件，數量設為 1。
//       // 將其存入 Map，Key 是商品 ID。
//       _items[product.id] = Item(product: product, quantity: 1);
//     } else {
//       // [Case B: 舊商品] (已存在)
//       // 建立一個「更新版」的 Item 物件。
//       // 數量 = 舊數量 + 1。
//       // 覆寫 Map 中原本的位置。
//       _items[product.id] = Item(product: product, quantity: item.quantity + 1);
//     }
//   }

//   // [Helper Method]：計算總金額。
//   double total() {
//     // [items.values]：取出 Map 中所有的 Item。
//     // [.map]：把每個 Item 變成它的價格 (subtotal)。
//     // [.reduce]：把所有價格加總起來。
//     return _items.values
//         .map((item) => item.price)
//         .reduce((value, element) => value + element);
//   }

//   // [toString]：覆寫，讓 print(cart) 能直接印出漂亮的收據。
//   @override
//   String toString() {
//     if (_items.isEmpty) {
//       return 'Cart is empty';
//     }
//     // [Formatting]：將每個項目轉成字串並換行連接。
//     final itemizedList =
//         _items.values.map((item) => item.toString()).join('\n');
//     return '------\n$itemizedList\nTotal: \$${total()}\n------';
//   }
// }

// // ... allProducts 定義 ...

// void main() {
//   // [Instantiation]：建立一台空的購物車。
//   // cart 變數會一直活著，直到程式結束。
//   final cart = Cart();

//   while (true) {
//     stdout.write('What do you want to do? ...');
//     final line = stdin.readLineSync();

//     if (line == 'a') {
//       final product = chooseProduct();
//       if (product != null) {
//         // [Integration]：選好商品後，呼叫購物車的 addProduct 方法。
//         // 資料流：Product -> Cart -> Item (Create/Update) -> Map
//         cart.addProduct(product);
        
//         // [Feedback]：印出目前的購物車狀態給使用者看。
//         print(cart);
//       }
//     } else if (line == 'v') {
//       // 查看購物車
//       print(cart);
//     } 
//     // ...
//   }
// }





// 🚀 新手友善版：清楚區分作用域的購物車程式
// import 'dart:io';

// // ---------------------------------------------------------
// // 1. 資料模型 (維持原樣，但為了完整性列出)
// // ---------------------------------------------------------
// class Product {
//   const Product({required this.id, required this.name, required this.price});
//   final int id;
//   final String name;
//   final double price;

//   String get displayName => '($initial)${name.substring(1)}: \$$price';
//   String get initial => name.substring(0, 1);
// }

// class Item {
//   const Item({required this.product, this.quantity = 1});
//   final Product product;
//   final int quantity;
  
//   double get price => quantity * product.price;

//   @override
//   String toString() => '$quantity x ${product.name}: \$$price';
// }

// // 全域商品清單 (Global Constant)
// const globalProductList = [
//   Product(id: 1, name: 'apples', price: 1.60),
//   Product(id: 2, name: 'bananas', price: 0.70),
//   Product(id: 3, name: 'courgettes', price: 1.0),
//   Product(id: 4, name: 'grapes', price: 2.00),
//   Product(id: 5, name: 'mushrooms', price: 0.80),
//   Product(id: 6, name: 'potatoes', price: 1.50),
// ];

// // ---------------------------------------------------------
// // 2. 購物車類別 (Cart) - 變數名稱大改造
// // ---------------------------------------------------------
// class Cart {
//   // [改名]: _items -> _idToItemMap (ID 對應 Item 的地圖)
//   // 這樣你就知道這是一個 Map，而且是用 ID 來查 Item。
//   final Map<int, Item> _idToItemMap = {};

//   // [改名]: product -> productToAdd (要被加入的商品)
//   // 避免跟類別 Product 混淆，也清楚表達這是「外來的引數」。
//   void addProduct(Product productToAdd) {
    
//     // [改名]: item -> existingItem (已存在的項目)
//     // 這樣你就能區分這是「查出來的結果」，而不是「新的項目」。
//     final existingItem = _idToItemMap[productToAdd.id];

//     if (existingItem == null) {
//       // [Case A: 新商品]
//       // 這裡直接建立 Item，傳入 productToAdd
//       _idToItemMap[productToAdd.id] = Item(
//         product: productToAdd, 
//         quantity: 1
//       );
//     } else {
//       // [Case B: 舊商品]
//       // 使用 existingItem 的資料來更新
//       _idToItemMap[productToAdd.id] = Item(
//         product: productToAdd, 
//         quantity: existingItem.quantity + 1
//       );
//     }
//   }

//   double total() {
//     // [改名]: item -> cartItem (購物車裡的項目)
//     return _idToItemMap.values
//         .map((cartItem) => cartItem.price)
//         .reduce((currentTotal, elementPrice) => currentTotal + elementPrice);
//   }

//   @override
//   String toString() {
//     if (_idToItemMap.isEmpty) {
//       return 'Cart is empty';
//     }
//     final itemizedListString = 
//         _idToItemMap.values.map((cartItem) => cartItem.toString()).join('\n');
//     return '------\n$itemizedListString\nTotal: \$${total()}\n------';
//   }
// }

// // ---------------------------------------------------------
// // 3. 主程式 (Main) - 變數名稱大改造
// // ---------------------------------------------------------
// void main() {
//   // [改名]: cart -> myShoppingCart (我的購物車)
//   final myShoppingCart = Cart();

//   while (true) {
//     stdout.write('What do you want to do? (v)iew items, (a)dd item, (c)heckout: ');
    
//     // [改名]: line -> menuChoiceInput (主選單輸入)
//     final menuChoiceInput = stdin.readLineSync();

//     if (menuChoiceInput == 'a') {
//       // [改名]: product -> selectedProduct (被選中的商品)
//       final selectedProduct = chooseProduct();
      
//       if (selectedProduct != null) {
//         // 把「被選中的商品」加入「我的購物車」
//         myShoppingCart.addProduct(selectedProduct);
//         print(myShoppingCart);
//       }
//     } else if (menuChoiceInput == 'v') {
//       print(myShoppingCart);
//     } 
//     // ...
//   }
// }

// // ---------------------------------------------------------
// // 4. 輔助函式 - 變數名稱大改造
// // ---------------------------------------------------------
// Product? chooseProduct() {
//   final productsMenuString = 
//     globalProductList.map((p) => p.displayName).join('\n');
    
//   stdout.write('Available products:\n$productsMenuString\nYour choice: ');
  
//   // [改名]: line -> productChoiceInput (商品選擇輸入)
//   final productChoiceInput = stdin.readLineSync();

//   // [改名]: product -> candidateProduct (候選商品)
//   for (var candidateProduct in globalProductList) {
//     if (candidateProduct.initial == productChoiceInput) {
//       return candidateProduct;
//     }
//   }
//   print('Not found');
//   return null;
// }











// 🛒 購物流程劇本：從「想買東西」到「結帳確認」
// 我們將模擬一個使用者想買 一顆蘋果 (apples) 的完整過程。

// 第一幕：程式啟動與準備 (Initialization)
// 程式載入：程式一跑起來，globalProductList 這個全域變數就已經在記憶體中準備好了，裡面放著 6 個不可變的商品物件（蘋果、香蕉...）。

// 進入 main()：

// final myShoppingCart = Cart();：建立了一台全新的、空的購物車物件 (Cart)。這個物件會在記憶體中一直存在，直到程式結束。

// 進入 while(true) 迴圈：這是程式的主循環，像是一個一直問你話的店員。

// 第二幕：主選單互動 (Main Loop Interaction)
// stdout.write(...)：店員問你：「你想做什麼？(v)iew, (a)dd, (c)heckout」。

// stdin.readLineSync()：程式暫停，等你回答。

// 你的動作：輸入 a (代表 add item)，然後按 Enter。

// 變數變化：menuChoiceInput 變成了 'a'。

// if (menuChoiceInput == 'a')：判斷成立！程式準備進入「選商品」的環節。

// 關鍵動作：程式呼叫 chooseProduct() 函式。這時候，main 函式暫時停住，控制權轉移到 chooseProduct。

// 第三幕：選擇商品 (Inside chooseProduct)
// 準備選單字串：

// 程式跑過 globalProductList，把每個商品的 displayName 抓出來（例如 (a)pples: $1.60）。

// 用換行符號 (\n) 把這些字串接成一個長字串 productsMenuString。

// 顯示選單：stdout.write(...) 把所有商品列出來給你看。

// 等待選擇：程式再次暫停。

// 你的動作：輸入 a (代表蘋果)，按 Enter。

// 變數變化：productChoiceInput 變成了 'a'。

// 搜尋商品：

// 程式開始跑 for 迴圈，一個個檢查 globalProductList 裡的商品。

// 比對：蘋果的 initial 是 'a'，你的輸入也是 'a'。中了！

// 回傳結果：return candidateProduct（把蘋果物件丟回去）。chooseProduct 任務結束。

// 第四幕：加入購物車 (Back to main)
// 接收商品：main 函式裡的 selectedProduct 變數接到了那顆蘋果物件。

// 加入購物車：呼叫 myShoppingCart.addProduct(selectedProduct)。

// 跳轉到 Cart 類別：

// 程式檢查 _idToItemMap 裡面有沒有蘋果的 ID (1)。

// 結果：沒有（因為是第一次買）。

// 動作：建立一個新的 Item 物件（蘋果 x 1），並存入 Map。

// 印出收據：print(myShoppingCart)。

// 這會觸發 Cart.toString()，把購物車裡的內容（1 x apples : $1.60）和總金額算出來印在螢幕上。

// 第五幕：迴圈重來
// 回到 while 開頭：店員再次問你：「你想做什麼？...」。

// 如果你這次又選 a 並再選一次蘋果，流程會重複一遍，但在第四幕時，購物車會發現蘋果已經有了，於是把數量從 1 改成 2。