class BankAccount{
  
  BankAccount({required String accountHolder, double balance = 0}) : accountHolder = accountHolder, balance = balance; 
  
  double balance ; 
  
  final String accountHolder; // make this an immutable variable

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

// 具有不可變成員的類別 (Classes with Immutable Members)

// 1. 什麼是不可變性？ (What is Immutability?)

// 不可變性指的是一個物件的狀態在建立後就「固定」了。在 Dart 中，我們主要使用 final 關鍵字來達成這個目標。

// 2. 為什麼需要不可變成員？

// 安全性：防止程式碼的其他部分意外修改重要資料（如用戶 ID、帳號金額）。

// 可預測性：物件的狀態永遠保持一致，除錯（Debug）更容易。

// 效能優化：不可變物件可以宣告為 const，這讓虛擬機（VM）可以重用記憶體，減少開銷。

// 3. 核心關鍵字：final vs const

// final 屬性：

// 必須在「建構子執行完成前」被賦值。

// 賦值後就不能再指向其他資料。

// 可以在執行期（Runtime）決定數值。

// const 建構子：

// 如果類別所有屬性都是 final，可以定義 const 建構子。

// 允許建立編譯期常數物件。

// 4. 視覺化概念：封存的檔案

// 可變物件：像是一塊白板，隨時可以擦掉重寫。

// 不可變物件：像是一張印好的獎狀，資訊一旦印上去就永久固定。