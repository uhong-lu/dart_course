//specify an initial balance when we create a new BankAccount instance to do that we can use a class constructor
class BankAccount{
  BankAccount(double balance){
    //錯誤示範 balance = balance; //this does not work this variable refers to the constructor argument not the member variable that we have declared here with the sane name
    this.balance = balance; // this is used to disambiguate between the names of the variables. By doing so, this member variable should be initialized with the value of this argument
  } //add a constructor to this class by typing the same name as the class name
  double balance = 0;  //Goal: initial this member variable with the value of this argument 'balance'
  
  void deposit(double amount){ 
    balance += amount;
  }

  bool withdraw(double amount){ 
    if (balance > amount){ 
      balance -= amount;
      return true;
    } else {
      return false;
    }
  }
}


void main(){
  final bankAccount = BankAccount(100); //update this constructor call to pass an initial value of 100 
  print(bankAccount.balance); 
}
//bottom line: initialize member variables by providing arguments to our class constructors
//use the 'this.' syntax to disambiguate between member variables and constructor arguments










// /**
//  * 主題：構造函式 (Constructor) 與 this 關鍵字
//  * 核心觀念：利用構造函式在實例化時進行「初始化」，並用 this 解決名稱衝突（遮蔽效能）。
//  */

// // [class]：定義名為 BankAccount 的自定義型別（設計圖）。
// class BankAccount {
//   // ---------------------------------------------------------
//   // 1. 屬性宣告 (Property Declaration)
//   // ---------------------------------------------------------
//   // [double]：型別。 [balance]：成員變數 (Member Variable) 或稱屬性 (Property)。
//   // [= 0]：預設初始值。若構造函式沒有特別指定，則維持 0。
//   double balance = 0; 

//   // ---------------------------------------------------------
//   // 2. 構造函式 (Constructor)
//   // ---------------------------------------------------------
//   // [BankAccount]：函式名稱與類別完全相同，這是構造函式的特徵。
//   // [double balance]：參數 (Parameter)。這裡稱為「構造函式參數」。
//   // 💡 發生名稱遮蔽 (Name Shadowing)：這裡的參數名跟上方的成員變數名「撞名」了。
//   BankAccount(double balance) {
//     // [this]：關鍵字。指向「目前的物件實體 (Current Instance)」。
//     // [this.balance]：指代類別中的那個「成員變數 balance」。
//     // [= balance]：指代傳進來的那個「參數 balance」。
//     // 運作邏輯：把外面傳進來的錢 (參數)，存入這個帳戶物件的餘額 (屬性) 中。
//     this.balance = balance; 
//   }

//   // ---------------------------------------------------------
//   // 3. 實例方法 (Instance Methods)
//   // ---------------------------------------------------------
  
//   // [deposit]：存款方法。
//   void deposit(double amount) { 
//     // 此處沒有名稱衝突，可以直接使用 balance。
//     balance += amount; 
//   }

//   // [withdraw]：提款方法，具備邏輯檢查。
//   bool withdraw(double amount) { 
//     if (balance >= amount) { 
//       balance -= amount; 
//       return true; 
//     } else { 
//       return false; 
//     }
//   }
// }

// // [void main()]：Dart 程式的進入點。
// void main() {
//   // [Instantiation]：實例化並傳入初始值。
//   // [BankAccount(100)]：呼叫構造函式，引數 (Argument) 100 會傳給參數 balance。
//   // [bankAccount]：持有這個在 Heap 中新建立物件的引用。
//   final bankAccount = BankAccount(100); 

//   // [Dot Access]：讀取該物件被初始化後的屬性值。
//   print(bankAccount.balance); // 輸出: 100.0
// }

// /**
//  * 🔬 硬核技術進階解析：
//  * * 1. [什麼是 this？]：
//  * 當你寫 `this.balance` 時，你是在告訴編譯器：「我要的是這棟房子的餘額，
//  * 不是剛才從門口（參數）遞進來的那個金額。」
//  * * 2. [建構時機]：
//  * 構造函式只會在 `BankAccount()` 被執行時運行一次。一旦執行完畢，
//  * 物件就完成了「初始化」，準備好迎接後續的方法呼叫。
//  * * 3. [Dart 語法糖預告]：
//  * 在 Dart 中，上方的構造函式可以簡寫為：`BankAccount(this.balance);`
//  * 這行代碼能自動完成「接收參數」並「賦值給同名屬性」的所有工作。
//  */


// 構造函式 (Constructor) 與 this 關鍵字 的核心教學。構造函式是類別與物件之間的「大門」，負責在物件誕生的一瞬間設定初始狀態，而 this 則扮演了「指明對象」的關鍵角色。🎓 
// 關鍵概念詳解：為什麼需要 this？
// 在這個例子中，你的成員變數叫 balance，而構造函式的參數也叫 balance。這在程式中稱為 「名稱遮蔽 (Name Shadowing)」：

// 如果你寫 balance = balance;： 電腦會優先找「離它最近」的變數。在構造函式內部，最近的是「參數」。所以這行代碼實際上是把「參數」賦值給「參數自己」，類別裡的成員變數完全沒被動到，這就是為什麼你的錯誤示範會失敗。

// 如果你寫 this.balance = balance;： this 強制切換了視角。它告訴電腦：「左邊那個 balance 請去類別頂端（成員變數）找，右邊那個 balance 則是剛才傳進來的那個。」

// 🚀 學習小總結
// 構造函式：確保物件在「出生」時不是空的，而是帶有初始數據的。

// this 關鍵字：是物件的「自稱」。就像你在說「我的錢包 = 你給我的錢」。

// 在程式設計的世界中，構造函式 (Constructor) 就像是物件的「出生證明」與「初始化流程」。它是一個特殊的函式，專門負責在記憶體中建立物件實體並設定初始值。
// 🏗️ BankAccount 物件的誕生與構造函式的任務這段程式碼的執行流程可以拆解為四個關鍵階段：第一階段：觸發與記憶體分配 (Trigger & Allocation)當 main() 執行到這行：final bankAccount = BankAccount(100);記憶體申請：Dart 虛擬機 (VM) 看到 BankAccount 類別，立刻在 堆 (Heap) 記憶體區中劃出一塊空間，預備放置這個新帳戶。預設初始化：此時，類別定義中的 double balance = 0; 會先發生。這塊記憶體空間裡的 balance 目前是 0.0。第二階段：構造函式的啟動 (Constructor Activation)隨後，電腦會立刻跳轉到 構造函式定義 的地方：BankAccount(double balance) { ... }參數傳遞 (Passing)：引數 100 被傳入構造函式的參數 balance 中。棧空間佔用 (Stack usage)：此時在 棧 (Stack) 記憶體中，會產生一個暫時的變數名為 balance，其值為 100。此時此刻，記憶體中有兩個 balance：一個在堆（物件身上），一個在棧（函式參數）。第三階段：對齊與賦值 (Alignment & Assignment)執行構造函式本體：this.balance = balance;消除歧義 (Disambiguation)：this.balance：電腦看向「堆」裡的那個物件屬性。= balance：電腦看向「棧」裡剛傳進來的那個參數。數據拷貝：數值 100 從棧被拷貝到了堆的物件身上。現在，物件真正的餘額變成了 100.0。第四階段：任務結束與「丟棄」 (Completion & Discard)當執行到構造函式的結尾 } 時：局部變數銷毀：構造函式的參數 balance 被從 棧 (Stack) 中抹除。這就是你所說的「丟棄」。傳回引用：構造函式功成身退，它將這塊已經設定好資料的記憶體地址傳回給 main()。變數綁定：變數 bankAccount 正式指向這個已經「滿月」且初始化完畢的物件。📊 執行期角色對照表階段構造函式的作用記憶體狀態呼叫前尚未存在僅有類別定義 (設計圖)呼叫中活動中 (Active)建立「棧幀」，接收參數 100賦值時執行中透過 this 將數據從參數轉移到屬性結束後已丟棄 (Discarded)參數消失，僅剩初始化好的「物件」留在 Heap💡 關鍵結論構造函式是 「一次性」 的工具。它 何時被使用？：僅在 BankAccount(...) 執行時，也就是物件剛要誕生的那一刻。它 何時被丟棄？：當大括號 } 結束，物件的屬性都設定好之後。你之後再也無法對同一個物件再次呼叫「構造函式」，如果你想修改餘額，只能透過 deposit 或 withdraw 等「普通方法」。


/*
  --------------------------------------------------
  電腦內部的虛擬執行過程 (Virtual Process):
  --------------------------------------------------

  步驟 1：【空間計算與申請 (Allocation)】
  當編譯器看到 `BankAccount(100.0)`：
  - 電腦會查看設計圖 (Class Definition)，計算出一個 BankAccount 需要多少位元組 (Bytes)。
  - 例如：一個 double 需要 8 Bytes，加上物件標記 (Metadata) 可能共需 16 Bytes。
  - 電腦在「堆 (Heap)」記憶體申請一塊 16 Bytes 的空白空間。

  步驟 2：【身份標註 (Typing)】
  - 電腦將這塊記憶體標記為 "BankAccount" 型別。
  - 這時候，這塊空間雖然存在，但內容是隨機的垃圾資料或全零。

  步驟 3：【綁定 this 並執行構造代碼 (Initialization)】
  - 電腦呼叫構造函式，並傳入兩個東西：
    1. 引數：100.0
    2. 隱含參數 `this`：這塊剛申請好的記憶體地址 (Pointer)。
  - 執行 `this.balance = 100.0`：
    電腦找到 `this` 地址偏移量後的位置，將 100.0 的二進位數值寫入。

  步驟 4：【返回地址 (Returning)】
  - 構造函式執行完畢後，電腦會自動把這塊「已經填好資料」的記憶體地址，
    交給變數 `myAcc` 存起來。
*/




// 核心解析：虛擬機 (VM) 與 記憶體 (Memory)在執行 Dart 或任何現代程式語言時，程式並不是直接在硬體上跑，而是在一個由軟體模擬出來的環境中執行，這個環境就是虛擬機。1. 什麼是虛擬機 (Virtual Machine)?在程式開發（如 Dart VM, Java JVM）中，虛擬機並不是指像虛擬主機那樣模擬一整台電腦，而是一個**「執行時期環境 (Runtime Environment)」**。它的角色：它是你的程式碼與作業系統/硬體之間的「翻譯官」。主要任務：載入程式碼：讀取你的程式（Bytecode）。即時編譯 (JIT/AOT)：將程式碼轉換為處理器（CPU）看得懂的機器碼。管理記憶體：決定資料要放在哪裡，以及什麼時候該清理。安全檢查：確保程式不會亂動別人的記憶體空間。2. 記憶體的兩大區域：棧 (Stack) 與 堆 (Heap)虛擬機將電腦的記憶體劃分為不同的區域，其中最重要的兩塊是 Stack 和 Heap。A. 棧 (Stack)：快速、有序、暫時的空間管理方式：後進先出 (LIFO)。儲存內容：區域變數（如 int a = 5;）。函式呼叫的狀態（目前執行到哪一行）。特點：速度極快。空間較小。自動清理：當一個函式結束（碰到 }），這個函式在 Stack 裡的所有變數會立即被「彈出」並消失。B. 堆 (Heap)：巨大、動態、長久的空間管理方式：由虛擬機隨機分配。儲存內容：物件實體 (Object Instances)：你用 BankAccount() 或 Person() 建立出來的東西都在這裡。特點：空間非常大。手動/自動清理：資料不會因為函式結束而消失，必須等到沒有人再使用它時，由虛擬機清理。3. 虛擬機如何管理記憶體？當你執行 final account = BankAccount(100); 時，兩者是如何連動的？申請 (Allocation)：虛擬機在 Heap 劃出一塊空間放 BankAccount 物件，並在 Stack 放一個變數 account。引用 (Reference)：Stack 裡的 account 其實只是一個「指標 (Pointer)」，它儲存著 Heap 中那個物件的「地址」。垃圾回收 (Garbage Collection, GC)：這是虛擬機最重要的功能。虛擬機會定期掃描：「有沒有任何 Stack 裡的變數還指著這個 Heap 物件？」如果沒有（例如變數被設為 null 或函式結束了），虛擬機就會把 Heap 的空間回收。這就是為什麼你不需要像 C 語言一樣手動寫 free() 來釋放記憶體。💡 總結對比表特性虛擬機 (VM)記憶體 (Memory)定義負責執行程式的軟體層儲存資料的實體/邏輯空間功能翻譯代碼、管控資源、垃圾回收存放變數、物件與常數比喻總經理 (決定誰該工作、誰該被解僱)辦公室 (提供辦公桌與倉庫)🚀 實例示範 (Dart)void main() {
//   // 1. "100" 這個數據被傳入。
//   // 2. VM 在 Heap 建立 BankAccount 物件。
//   // 3. VM 在 Stack 建立 account 變數，存入 Heap 的地址。
//   final account = BankAccount(100); 
  
//   doSomething(); // 進入新函式，Stack 會增加一層
// } // main 結束，Stack 清空。此時 Heap 裡的物件沒有人指著它了，VM 的 GC 會來把它回收。
