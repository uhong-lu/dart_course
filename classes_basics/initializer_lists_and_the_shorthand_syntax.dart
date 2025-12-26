//better ways of initializing member variables with a class constructor
//way 1: using initializer lists
class BankAccount{
  //constructors are always declared before any member variables and methods
  BankAccount({required String accountHolder, double balance = 0}) : accountHolder = accountHolder, balance = balance;  //dart know the variable on the left hand side of the assignment is the balance member variable ,and the variable on the right hand side of the assignment is the balance argument
  //BankAccount(double balance) : balance = balance; redunt to use this. syntax  because we are inside an initializer list
  
  //way 2: this. (sorter version )// BankAccount({required this.accountHolder, this.balance = 0})

  double balance ; //since we can initialize the balance like this, no longrt need to assign it to 0 when we declare this variable
  
  //one more instance variable representing the name of the 'accountHolder'
  String accountHolder; // we added this . alse need to provide a constructor argument for this variable

  void deposit(double amount){
   balance += amount;  
  }

  bool withdraw(double amount){
    if(balance > amount){
      balance -= amount;
      return true;
    } else {
      return false;
    }
  }
}

void main(){
  final bankAccount = BankAccount(accountHolder: 'Alice', balance : 100);
  print(bankAccount.balance);
}







// /**
//  * 主題：類別成員初始化與構造函式進化
//  * 核心：Initializer Lists (初始化列表) 與 This Shorthand (this 簡寫語法)
//  */

// // [class]：定義名為 BankAccount 的自定義類別（型別設計圖）。
// class BankAccount {
//   // ---------------------------------------------------------
//   // 1. 成員變數 / 屬性 (Member Variables / Properties)
//   // ---------------------------------------------------------
//   // [String accountHolder]：儲存帳戶持有人姓名的屬性。
//   String accountHolder; 
  
//   // [double balance]：儲存餘額的屬性。
//   // 注意：這裡沒有寫 = 0，因為我們打算在 Constructor 中強制初始化。
//   double balance; 

//   // ---------------------------------------------------------
//   // 2. 構造函式 (Constructor) - 方式一：初始化列表 (Initializer Lists)
//   // ---------------------------------------------------------
//   // [BankAccount({ ... })]：定義一個使用「具名參數 (Named Parameters)」的構造函式。
//   // [required String accountHolder]：強制的具名參數引數 (Argument)。
//   // [double balance = 0]：具名參數，並帶有「預設值 (Default Value)」。
//   // [:]：初始化列表的開始符號。
//   // [accountHolder = accountHolder]：
//   //    - 左側：指成員變數 (Member Variable)。在 [:] 之後，左側會自動識別為屬性。
//   //    - 右側：指構造函式的參數 (Parameter / Argument)。
//   // [,]：分隔多個初始化動作。
//   // [balance = balance]：同上，將參數值賦予屬性。
//   BankAccount({
//     required String accountHolder, 
//     double balance = 0,
//   }) : accountHolder = accountHolder, 
//        balance = balance; 

//   /* 方式二：Dart 最推薦的簡寫 (Shorthand syntax)
//     -------------------------------------------
//     BankAccount({required this.accountHolder, this.balance = 0});
    
//     [this.accountHolder]：直接告訴 Dart「把這個參數直接塞進同名的成員變數裡」。
//     這是目前開發中最常用的工業標準。
//   */

//   // ---------------------------------------------------------
//   // 3. 實例方法 (Instance Methods)
//   // ---------------------------------------------------------

//   // [deposit]：存款行為。
//   void deposit(double amount) {
//     balance += amount; 
//   }

//   // [withdraw]：提款行為。
//   // [bool]：回傳型別，表示執行結果（成功/失敗）。
//   bool withdraw(double amount) {
//     if (balance > amount) {
//       balance -= amount; 
//       return true; // [return]：回傳布林值給呼叫者。
//     } else {
//       return false; 
//     }
//   }
// }

// // [void main()]：執行進入點。
// void main() {
//   // [Object Instantiation]：實例化 BankAccount 物件。
//   // [accountHolder: 'Alice']：具名引數 (Named Argument)，可讀性極高。
//   // [balance: 100]：具名引數，傳入 100 給構造函式。
//   final bankAccount = BankAccount(accountHolder: 'Alice', balance: 100);

//   // [Dot Access]：使用點運算子存取物件的 balance 屬性。
//   print('帳戶持有人: ${bankAccount.accountHolder}');
//   print('目前餘額: ${bankAccount.balance}'); // 輸出: 100.0
// }