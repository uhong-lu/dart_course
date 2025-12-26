//add some methods
class BankAccount{
  double balance = 0;
  
  void deposit(double amount){ //the deposit method works by adding funds to account every time we make a deposit
    balance += amount;
  }

  bool withdraw(double amount){ //use a boolean return value to indicate whether the withdrawal is successful or not
    if (balance > amount){ //set rule cannot withdrae an amount that is greater than the current balance
      balance -= amount;
      return true;
    } else {
      return false;
    }
  }
}


void main(){
  final bankAccount = BankAccount();
  // bankAccount.balance = 100;//set balance by assigning a specific value
  bankAccount.deposit(100); 
  bankAccount.deposit(50);
  final success1 = bankAccount.withdraw(100);
  print('success: $success1, balance: ${bankAccount.balance}');
  final success2 = bankAccount.withdraw(100);
  print('success: $success2, balance: ${bankAccount.balance}');  
}





// /**
//  * 主題：實例方法 (Instance Methods)
//  * 核心觀念：方法定義了物件「能做什麼」，並負責保護與處理物件內部的資料。
//  */

// // [class]：定義一個名為 BankAccount 的自定義型別（設計圖）。
// class BankAccount {
//   // [Property]：實例屬性。代表每個帳戶物件各自擁有的餘額資料。
//   double balance = 0; 
  
//   // [Instance Method]：實例方法。定義「存款」行為。
//   // [void]：回傳型別，表示這個方法執行完後不會傳回任何資料。
//   // [double amount]：參數 (Parameter)。接收呼叫者傳入的存款金額。
//   void deposit(double amount) { 
//     // [balance += amount]：存取並修改「當前物件」的 balance 屬性。
//     // 這是一個副作用 (Side Effect)，改變了物件的內部狀態。
//     balance += amount; 
//   }

//   // [Instance Method]：實例方法。定義「提款」行為。
//   // [bool]：回傳型別，會傳回 true (成功) 或 false (失敗) 給呼叫者。
//   // [double amount]：參數。接收呼叫者想要領取的金額。
//   bool withdraw(double amount) { 
//     // [if]：業務邏輯檢查。確保帳戶內的錢足夠支付提款金額。
//     if (balance >= amount) { 
//       // [balance -= amount]：若餘額充足，則扣除屬性 balance 的值。
//       balance -= amount; 
//       // [return true]：向呼叫端回傳成功信號。
//       return true; 
//     } else { 
//       // [return false]：向呼叫端回傳失敗信號，且不執行扣款。
//       return false; 
//     }
//   }
// }

// // [void main()]：Dart 程式的進入點。
// void main() {
//   // [Object Instance]：實例化一個帳戶物件，儲存在 bankAccount 變數中。
//   final bankAccount = BankAccount();
  
//   // [Method Call]：調用實例方法。
//   // [100]：引數 (Argument)。這會傳給 deposit 方法中的 amount 參數。
//   bankAccount.deposit(100); 
//   bankAccount.deposit(50); // 二次存款，目前 balance 為 150.0。

//   // [Method Call with Return Value]：調用方法並接收其產出的結果。
//   // [success1]：接收 withdraw 回傳的 bool 物件。
//   final success1 = bankAccount.withdraw(100);
//   // [${...}]：字串插值 (String Interpolation)。直接在字串中存取物件屬性。
//   print('success: $success1, balance: ${bankAccount.balance}'); // 輸出: success: true, balance: 50.0

//   // 再次提款：此時餘額只有 50.0，但想提 100.0。
//   final success2 = bankAccount.withdraw(100);
//   // 由於餘額不足，withdraw 會回傳 false。
//   print('success: $success2, balance: ${bankAccount.balance}'); // 輸出: success: false, balance: 50.0
// }









// /**
//  * 主題：為什麼不同方法的參數名稱可以相同？
//  * 核心觀念：作用域 (Scope) 與 棧幀 (Stack Frame)
//  */

// class BankAccount {
//   double balance = 0;

//   // [作用域 A]：deposit 方法的領地
//   // 此處的 amount 僅存活於 deposit 的大括號 {} 之間。
//   void deposit(double amount) {
//     // 當執行到這裡時，電腦會建立一個屬於 deposit 的記憶體空間。
//     // 這個 amount 與其他函式的 amount 完全隔離。
//     balance += amount;
//   } 

//   // [作用域 B]：withdraw 方法的領地
//   // 此處的 amount 僅存活於 withdraw 的大括號 {} 之間。
//   bool withdraw(double amount) {
//     // 即使名字一樣，這是在另一個獨立的記憶體空間（Stack Frame）中建立的。
//     if (balance >= amount) {
//       balance -= amount;
//       return true;
//     }
//     return false;
//   }
// }

// /**
//  * 🔬 硬核原理解析：
//  * * 1. [局部變數的生命週期]：
//  * 當你呼叫 deposit(100) 時，電腦會「生出」一個名為 amount 的變數，值為 100。
//  * 當 deposit 執行結束（遇到最後一個 }）時，這個 amount 就會被「銷毀」並從記憶體中抹除。
//  * * 2. [棧幀隔離 (Stack Frame Isolation)]：
//  * 在記憶體中，每個函式呼叫都有自己獨立的「小房間」。
//  * deposit 有自己的房間，withdraw 也有自己的房間。
//  * 這就像是不同的教室裡都可以有一個叫「小明」的學生，老師在 A 教室喊小明，
//  * 不會影響到 B 教室的小明。
//  * * 3. [語義化命名]：
//  * 之所以都取名為 amount，是因為對於這兩個方法來說，「金額」就是最精確的描述。
//  * 我們不需要為了避開衝突而取名為 depositAmount 或 withdrawAmount，
//  * 因為上下文（方法名稱）已經解釋了一切。
//  * * ⚠️ 什麼時候會衝突？
//  * 只有在「同一個作用域（同一對大括號）」內定義兩個同名變數才會衝突：
//  * void test(double amount) {
//  * double amount = 50; // ❌ 這裡會報錯，因為在同一個房間裡出現了兩個 amount。
//  * }
//  */

// void main() {
//   final account = BankAccount();
  
//   // 呼叫時，這兩個 100 分別進入了不同的函式處理流程，彼此互不相干。
//   account.deposit(100);
//   account.withdraw(100);
// }