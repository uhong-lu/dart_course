// //declaring farenheit as a method
// class Temperature{
//   Temperature.celsius(this.celsius);
//   Temperature.farenheit(double fahrenheit) 
//       : celsius = (fahrenheit - 32) /1.8; 
//   double celsius;
//   double fahrenheit() => celsius * 1.8 + 32;
// }

// void main(){
//   final temp1 = Temperature.celsius(30);
//   final temp2 = Temperature.farenheit(90); 
//   print(temp1.celsius);
//   temp1.celsius = 32;
//   print(temp1.fahrenheit());
// }


//use 'getter'
//declaring farenheit as a method
class Temperature{
  Temperature.celsius(this.celsius);
  Temperature.farenheit(double fahrenheit) 
      : celsius = (fahrenheit - 32) /1.8; 
  double celsius;
  double get fahrenheit => celsius * 1.8 + 32;  //this will turn 'farenheit' into a computed variable //when you declare a getter variable you need to provide a body just like you do when you define function othrtwise you will get an error // you can use a getter to declare a variable that can be directly computed from some of the other variables in your class. For this reason, getters are also knoen as computed variables while regular member are also known as stored variables because they are stored in memory
  set fahrenheit(double fahrenheit) => 
      celsius = (fahrenheit - 32) / 1.8; //setter for farenheit
}

void main(){
  final temp1 = Temperature.celsius(30);
  final temp2 = Temperature.farenheit(90); 
  print(temp1.celsius);
  temp1.celsius = 32;
  print(temp1.fahrenheit);
  temp1.fahrenheit = 90; 
}










// /**
//  * 主題：存取器 (Getters & Setters) 與 計算屬性 (Computed Variables)
//  * 核心觀念：將邏輯隱藏在屬性存取的背後，實現「單一事實來源 (Single Source of Truth)」。
//  */

// // [class]：類別定義，作為溫度的邏輯模型。
// class Temperature {
//   // ---------------------------------------------------------
//   // 1. 構造函式 (Constructors)
//   // ---------------------------------------------------------
  
//   // [Temperature.celsius]：具名構造函式。
//   // [(this.celsius)]：[this shorthand syntax] 語法糖，直接初始化存儲變數。
//   Temperature.celsius(this.celsius);

//   // [Temperature.farenheit]：具名構造函式。
//   // [double fahrenheit]：傳入的參數 (Parameter)。
//   // [:]：[Initializer list] (初始化列表)。
//   // [celsius = ...]：在物件建立前，將傳入的華氏引數 (Argument) 轉為攝氏存入。
//   Temperature.farenheit(double fahrenheit) 
//       : celsius = (fahrenheit - 32) / 1.8; 

//   // ---------------------------------------------------------
//   // 2. 存儲變數 (Stored Variable)
//   // ---------------------------------------------------------
  
//   // [double celsius]：這是一個「存儲變數」，它真真實實地佔據記憶體空間。
//   // 它是此類別的核心資料 (The Source of Truth)。
//   double celsius;

//   // ---------------------------------------------------------
//   // 3. 計算屬性：Getter (讀取器)
//   // ---------------------------------------------------------
  
//   // [double]：回傳型別。
//   // [get]：關鍵字，標明這是一個讀取器，呼叫時不需加 ()。
//   // [fahrenheit]：屬性名稱。
//   // [=>]：箭頭語法，後方接計算邏輯。
//   // 💡 這是一個「計算變數」，它不佔額外記憶體，而是每次讀取時動態算出來。
//   double get fahrenheit => celsius * 1.8 + 32;

//   // ---------------------------------------------------------
//   // 4. 計算屬性：Setter (寫入器)
//   // ---------------------------------------------------------
  
//   // [set]：關鍵字，當使用者對此屬性執行「=」賦值時觸發。
//   // [fahrenheit]：與 Getter 同名，形成一對完整的存取器。
//   // [(double fahrenheit)]：接收等號右側傳入的值作為引數。
//   // [=>]：執行邏輯，將傳入的華氏轉回攝氏並更新「存儲變數」。
//   set fahrenheit(double fahrenheit) => 
//       celsius = (fahrenheit - 32) / 1.8; 
// }

// // [void main()]：進入點。
// void main() {
//   // [Instantiation]：實例化一個溫度物件。
//   // [temp1]：物件實例 (Object Instance)。
//   final temp1 = Temperature.celsius(30);

//   // 讀取存儲變數。
//   print('初始攝氏: ${temp1.celsius}'); // 30.0

//   // 修改攝氏溫度。
//   temp1.celsius = 32;

//   // [temp1.fahrenheit]：呼叫 Getter。
//   // 💡 注意：看起來像讀變數，背後執行了 (32 * 1.8 + 32) 的計算。
//   print('對應華氏: ${temp1.fahrenheit}'); // 89.6

//   // [temp1.fahrenheit = 90]：呼叫 Setter。
//   // 💡 注意：雖然我們賦值給 fahrenheit，但受影響的是內部的 celsius。
//   temp1.fahrenheit = 90; 

//   // 驗證內部的攝氏是否隨之改變。
//   print('設定華氏 90 後的攝氏值: ${temp1.celsius}'); 
// }

// /**
//  * 🔬 深度技術總結：
//  * * 1. [Stored vs Computed]：
//  * - Stored (存儲)：如 celsius，佔用記憶體，保存資料。
//  * - Computed (計算)：如 fahrenheit，不佔記憶體，保存「邏輯」。
//  * * 2. [語意化 (Semantics)]：
//  * 對於使用者來說，他不需要知道裡面到底是存攝氏還是華氏，他可以像操作普通變數
//  * 一樣操作兩個欄位，這讓 API 變得非常乾淨。
//  * * 3. [Encapsulation (封裝)]：
//  * Setter 提供了一個絕佳的機會來檢查資料有效性（例如：可以在 setter 裡限制
//  * 溫度不能低於絕對零度），這是直接存取變數做不到的。
//  */