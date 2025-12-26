const welcome = 'Welcome';  //const is used to declare a comopile-time constant variable
const signIn = 'Sign in';  //remove String , dart can infer the type


class Strings {
  static String welcome = 'Welcome';  // static variables are variables that belong to the class itself and not to any specific instance of that class
  static String signIn = 'Sign in';  
  static String greet(String name) => 'Hi $name'; // static methods
}

void foo(){         //if you have a regular non-static method inside a class then inside here you could type something like this
  //print(Strings.welcome);  //this synax is  reduntant (already inside this class)
  print(welcome);
}

void main(){
  //final s = Strings(); // we don't need to create an instance of the Strings class to access its static members
  print(Strings.welcome); // in order to reference this welcome String. Don't heve to create instance of thr Strings class by calling a constructor like this. Because this variable is declared as 'static'
  print(Strings.signIn);   
  print(Strings.greet('Alice')); 
}

//bottom line : use static to define variables and methods that are specific to a class, rather than instances of that class. if you declare a class variable as 'staticd const' what you're doing is to define a global constant that belongs to that class this can be better than having constant variables in the global scope. you can put all these strings that belong together inside a class
//to access static methods and variables outside the class we need to use this syntax
//In summary, the static keyword is quite useful because it allows us ti define variables and methods that belong to a class rather than to instances og that class










// /**
//  * 主題：靜態變數與靜態方法 (Static Methods and Variables)
//  * 核心觀念：靜態成員屬於「類別」而非「實例」。它們在全域只有一份，不隨物件建立而重複產生。
//  */

// // [Top-level Constants]：定義在全域作用域的常數。
// // [const]：編譯期常數。 [welcome]：識別碼。
// // 💡 此處省略了 String，Dart 會透過「型別推斷 (Type Inference)」自動識別。
// const welcome = 'Welcome'; 
// const signIn = 'Sign in'; 

// // [class]：定義名為 Strings 的類別。
// // 💡 這種只包含靜態成員的類別，通常被稱為「工具類別 (Utility Class)」或「命名空間」。
// class Strings {
//   // [static]：關鍵字，表示此成員屬於類別本身。
//   // [const]：表示此值不可修改。
//   // [String welcome]：成員屬性。
//   // 💡 存取方式：使用 Strings.welcome，不需要實例化。
//   static const String welcome = 'Welcome'; 
//   static const String signIn = 'Sign in'; 

//   // [static String greet]：靜態方法 (Static Method)。
//   // [String name]：位置參數 (Positional Parameter)。
//   // [=>]：箭頭語法，直接回傳計算結果。
//   // 💡 靜態方法內部「不能」使用 this 關鍵字，因為它不屬於任何特定物件。
//   static String greet(String name) => 'Hi $name'; 
// }

// // [Global Function]：普通的頂層函式。
// void foo() {
//   // 💡 在全域環境中，若要存取類別內的靜態成員，必須加類別名稱前綴。
//   // print(Strings.welcome); 
  
//   // 這裡存取的是最上方的全域變數 welcome。
//   print(welcome);
// }

// // [void main()]：執行進入點。
// void main() {
//   // ---------------------------------------------------------
//   // 1. 存取靜態成員 (Accessing Static Members)
//   // ---------------------------------------------------------
  
//   // ❌ 錯誤觀念：不需要建立實例 (不需要 final s = Strings();)。
//   // 直接透過「類別名稱 + 點運算子」存取。
  
//   // [Strings.welcome]：存取靜態常數。
//   print(Strings.welcome); 
  
//   // [Strings.signIn]：存取另一個靜態常數。
//   print(Strings.signIn); 

//   // [Strings.greet('Alice')]：呼叫靜態方法。
//   // ['Alice']：引數 (Argument)，傳給參數 name。
//   print(Strings.greet('Alice')); 
// }

// /**
//  * 🔬 深度技術總結：
//  * * 1. [記憶體效率]：
//  * 靜態變數在程式啟動時載入記憶體，且只會有一份。如果你有一千個物件需要用到
//  * 同一個字串，使用 static 可以避免重複建立一千次相同的字串物件。
//  * * 2. [命名空間隔離 (Encapsulation)]：
//  * 將全域變數 (如 welcome) 移入類別 (如 Strings.welcome) 的好處是：
//  * 避免變數名稱衝突。你可以有 Strings.welcome，也可以有 AppConfig.welcome。
//  * * 3. [何時使用？]：
//  * 當一個方法或變數不需要知道「物件的狀態」（例如它不需要讀取 this.balance），
//  * 且它在邏輯上屬於這個類別的範疇時，就應該宣告為 static。
//  */





// 這是一個關於 靜態成員 (Static Members) 的深度解析。在物件導向中，「靜態」代表該變數或方法屬於「類別（設計圖）本身」，而不是屬於「物件（蓋出來的房子）」。

// 當我們使用 static 時，我們是在建立一個名為「命名空間 (Namespace)」的容器，用來整理相關的常數或工具函式，而不需要消耗記憶體去建立實體物件。
// 核心技術點詳解
// 1. 類別 vs. 實例 (Class vs. Instance)
// 實例成員 (Instance Members)：像 Person.name，每個人的名字都不一樣，所以要跟著物件跑。

// 靜態成員 (Static Members)：像 Strings.welcome，無論哪種語境下，「歡迎」這個字串都是一樣的，所以放在類別層級即可。

// 2. 靜態常數 (static const) 的威力
// 在 Dart 中，將相關的硬編碼字串（Hard-coded Strings）放在一個 Strings 類別中並標記為 static const 是非常好的實踐。這可以：

// 防止打錯字：編譯器會幫你檢查 Strings.welcome 是否拼錯。

// 易於維護：如果要改文字，只需要改一個地方，全專案都會更新。

// 3. 靜態方法的限制
// 靜態方法像是「住在類別裡的獨立函式」。

// 它 可以 存取其他的靜態成員。

// 它 不可以 存取非靜態成員（屬性或方法），因為它沒有 this 指標，它不知道你是要哪個物件的屬性。

// 🚀 專業建議
// 在開發專案時，如果你發現有一群常數（例如顏色代碼、字型大小、API 路徑）分散在各個檔案，請試著建立一個 class Constants 或 class AppColors 並使用 static const 將它們組織起來。這會讓你的程式碼看起來非常專業且易於管理！