class BankAccount{
  double balance = 0; //in order to use a class we need to create an instance of our class
  //the variables that are declared inside a class are also known as member variables or properties, so we could say that balance is a property of the BankAccount class
}


void main(){
  final bankAccount = BankAccount(); //create an instance of this class
  print(bankAccount.balance); //the way this code works is that we first create an instance of a bank account and then we can access the variables that are declared inside that class by using the dot-access operator
  bankAccount.balance = 100; // in addition tp reading the value of a property we can also set it
  print(bankAccount.balance);
  final bankAccount2 = BankAccount();// we have two separate instances of this class
  bankAccount2.balance = 50;
  print(bankAccount2.balance);
}
//bottom line is you can create classes to represent new types 
//once you have a class you can create as many instances as you want of that class







// /**
//  * 主題：類別 (Class) 與 實例 (Instance)
//  * 硬核定義：類別是定義數據結構的「型別 (Type)」，實例是佔據記憶體空間的「物件 (Object)」。
//  */

// // [class]：關鍵字，用來定義一個新的自定義型別。
// // [BankAccount]：類別名稱，採用大駝峰式 (UpperCamelCase) 命名規範。
// class BankAccount {
//   // [double]：屬性的型別，表示雙精度浮點數。
//   // [balance]：成員變數 (Member Variable) 或 屬性 (Property)。
//   // [= 0]：初始值。每當建立一個新帳戶時，預設餘額都是 0。
//   double balance = 0; 
// }

// // [void main()]：Dart 程式的進入點函式。
// void main() {
//   // ---------------------------------------------------------
//   // 1. 建立第一個物件實體 (First Instance)
//   // ---------------------------------------------------------
  
//   // [final]：宣告變數不可重新指向另一個物件。
//   // [bankAccount]：變數名稱（識別碼），型別推斷為 BankAccount。
//   // [BankAccount()]：呼叫構造函式 (Constructor)，在 Heap 記憶體中「實例化」一個物件。
//   final bankAccount = BankAccount(); 

//   // [bankAccount.balance]：使用「點運算子 (Dot operator)」存取物件內部的屬性。
//   // 這裡執行的是「讀取 (Getter)」動作。
//   print(bankAccount.balance); // 輸出: 0.0

//   // [bankAccount.balance = 100]：執行「寫入 (Setter)」動作。
//   // 我們直接修改這個特定物件實體內部的狀態 (State)。
//   bankAccount.balance = 100; 

//   // 再次讀取，確認狀態已更新。
//   print(bankAccount.balance); // 輸出: 100.0

//   // ---------------------------------------------------------
//   // 2. 建立第二個物件實體 (Second Instance)
//   // ---------------------------------------------------------
  
//   // [bankAccount2]：這是另一個獨立的物件。
//   // 💡 重要觀念：bankAccount 與 bankAccount2 指向不同的記憶體地址。
//   final bankAccount2 = BankAccount();

//   // 修改第二個帳戶的餘額。
//   bankAccount2.balance = 50;

//   // [驗證獨立性]：
//   // 雖然這兩個物件都來自同一個類別，但它們的數據是隔離的。
//   print(bankAccount2.balance); // 輸出: 50.0
//   print(bankAccount.balance);  // 輸出: 100.0 (維持原樣)
// }

// /**
//  * 🔬 技術總結 (Technical Summary)：
//  * 1. [Properties]：balance 是 BankAccount 類別的屬性，代表物件的「狀態」。
//  * 2. [Instance]：透過 BankAccount() 產生的每個個體都是一個「實體」。
//  * 3. [Encapsulation]：類別將「資料 (balance)」打包在一起，方便管理。
//  */