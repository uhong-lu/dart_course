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

  bool get isEmpty => _items.isEmpty;

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
      if(checkout(cart)){
        print('Thank you for your purchase!');
        break;
      }
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


bool checkout(Cart cart){
  if (cart.isEmpty){
    print('Your cart is empty!');
    return false;
  }
  final total = cart.total();
  print('Total: \$$total');
  stdout.write('Payment in cash: ');
  final line = stdin.readLineSync();
  if (line == null || line.isEmpty){
    return false;
  }
  final paid = double.tryParse(line);
  if (paid == null){
    return false;
  }
  if (paid >= total){
    final change = paid - total;
    print('Change: \$${change.toStringAsFixed(2)}');
    return true;
  } else {
    print('Not enough cash.');
    return false;
  }
}








// /**
//  * 主題：實作結帳功能 (Checkout Functionality)
//  * 核心：互動式付款流程、邏輯驗證、與主迴圈的終止條件。
//  */

// import 'dart:io';

// // Product 與 Item 類別保持不變...
// class Product { ... }
// class Item { ... }

// // ---------------------------------------------------------
// // 1. 購物車類別更新 (Cart Class Update)
// // ---------------------------------------------------------
// class Cart {
//   final Map<int, Item> _items = {};

//   // ... addProduct 方法保持不變 ...

//   // [新增]: Getter 用於檢查購物車是否為空。
//   // [bool]: 回傳 true/false。
//   // [isEmpty]: 屬性名稱。
//   // [=> _items.isEmpty]: 直接轉發 Map 內建的 isEmpty 屬性。
//   bool get isEmpty => _items.isEmpty;

//   double total() {
//     // [注意]: 如果購物車是空的，這行會報錯 (因為 reduce 不能處理空序列)。
//     // 解決方案：我們會在 checkout 函式先檢查 isEmpty，確保不為空才呼叫 total()。
//     return _items.values
//         .map((item) => item.price)
//         .reduce((value, element) => value + element);
//   }

//   // ... toString 方法保持不變 ...
// }

// // ... allProducts 定義 ...

// void main() {
//   final cart = Cart();
//   while (true) {
//     stdout.write('What do you want to do? ...');
//     final line = stdin.readLineSync();

//     if (line == 'a') {
//       // ... 加入商品邏輯 ...
//     } else if (line == 'v') {
//       print(cart);
//     } else if (line == 'c') {
//       // -------------------------------------------------------
//       // [新增]: 結帳流程整合
//       // -------------------------------------------------------
      
//       // [checkout(cart)]: 呼叫結帳函式，並傳入購物車物件。
//       // [if (...)]: 判斷結帳是否成功。
//       if (checkout(cart)) {
//         // [Success]: 如果結帳成功 (回傳 true)。
//         print('Thank you for your purchase!');
        
//         // [break]: 跳出 while(true) 迴圈，程式正式結束！
//         break; 
//       }
//       // [Failure]: 如果結帳失敗 (回傳 false)，迴圈繼續，回到主選單。
//     } 
//   }
// }

// // ... chooseProduct 函式保持不變 ...

// // ---------------------------------------------------------
// // 2. 結帳邏輯函式 (Checkout Function)
// // ---------------------------------------------------------

// // [bool]: 回傳型別。告訴 main 函式結帳是否成功。
// // [checkout(Cart cart)]: 接收購物車物件作為參數。
// bool checkout(Cart cart) {
//   // [Validation 1]: 檢查購物車是不是空的。
//   if (cart.isEmpty) {
//     print('Your cart is empty!');
//     return false; // 失敗：沒東西不能結帳。
//   }

//   // [Calculation]: 計算總金額。
//   // 因為前面已經檢查過 isEmpty，這裡呼叫 total() 是安全的。
//   final total = cart.total();
//   print('Total: \$$total');

//   // [Prompt]: 要求使用者輸入付款金額。
//   stdout.write('Payment in cash: ');
//   final line = stdin.readLineSync();

//   // [Validation 2]: 檢查使用者有沒有輸入東西。
//   if (line == null || line.isEmpty) {
//     return false; // 失敗：沒給錢。
//   }

//   // [Parsing]: 嘗試將輸入字串轉為數字。
//   final paid = double.tryParse(line);
  
//   // [Validation 3]: 檢查輸入的是不是有效數字。
//   if (paid == null) {
//     return false; // 失敗：給的不是錢 (例如輸入了 'abc')。
//   }

//   // [Transaction Logic]: 交易核心邏輯。
//   if (paid >= total) {
//     // [Case A: 付款足夠]
//     final change = paid - total; // 計算找零
//     print('Change: \$${change.toStringAsFixed(2)}'); // 印出找零
//     return true; // 成功！
//   } else {
//     // [Case B: 付款不足]
//     print('Not enough cash.');
//     return false; // 失敗！
//   }
// }
// ```

// ### 🎓 教授的白話文解析

// #### 1. 為什麼 `checkout` 要回傳 `bool`？
// 這是一種 **「控制訊號」**。
// * `checkout` 函式就像是一個負責結帳的櫃檯人員。
// * `main` 函式就像是店長。
// * 當櫃檯人員處理完後，他需要告訴店長：「這筆交易成了嗎？」
//     * **成了 (`true`)**：店長說：「好，關店休息（`break`）。」
//     * **沒成 (`false`)**：店長說：「好，那繼續營業，等待下一位客人（迴圈繼續）。」

// #### 2. `cart.total()` 的安全性
// 我們之前提到 `reduce` 不能處理空清單。
// 在這裡，我們透過 **「前置檢查 (Pre-check)」** 來保護它：
// ```dart
// if (cart.isEmpty) return false; // 如果是空的就擋下來
// cart.total(); // 這裡絕對安全，因為能跑到這行代表一定不是空的