// Badly designed constructor
// class Temperature{
//   Temperature(this.celsius); 
//   double celsius;
// }

// void main(){
//   final temp = Temperature(); //here we need to pass a argument , but it's not clear from this call if we should pass a value in degrees celsius or fahrenheit. The reason this is not clear is that the constructor of this is badly designed
// }

//make it better using named constructors

class Temperature{
  Temperature.celsius(this.celsius);
  Temperature.farenheit(double fahrenheit) //can't use this. syntax because we need an argument that represents the temperature in Fahrenheit
      : celsius = (fahrenheit - 32) /1.8;  //converting farenheit to celsius
  double celsius;
}

void main(){
  final temp1 = Temperature.celsius(30);
  final temp2 = Temperature.farenheit(90); 
  print(temp1.celsius);
  temp1.celsius = 32;
}






// /**
//  * 主題：具名構造函式與語意化設計 (Temperature Example)
//  * 核心觀念：利用不同命名的構造函式來處理不同的輸入來源（攝氏 vs 華氏），並統一儲存於底層變數。
//  */

// // [class]：類別關鍵字，定義 Temperature (溫度) 型別。
// class Temperature {
//   // ---------------------------------------------------------
//   // 1. 具名構造函式 A：攝氏入口
//   // ---------------------------------------------------------
//   // [Temperature.celsius]：具名構造函式 (Named Constructor)。
//   // [(this.celsius)]：[this shorthand syntax] (this 簡寫語法)。
//   //    - 定義了一個位置參數 (Positional Parameter)。
//   //    - 自動將傳入的引數 (Argument) 賦值給成員變數 celsius。
//   Temperature.celsius(this.celsius);

//   // ---------------------------------------------------------
//   // 2. 具名構造函式 B：華氏入口 (涉及計算)
//   // ---------------------------------------------------------
//   // [Temperature.farenheit]：另一個具名構造函式，提供不同的初始化路徑。
//   // [double fahrenheit]：參數 (Parameter)。這裡不使用 this 簡寫，
//   //    因為參數型別/意義與成員變數不同，需要經過轉換。
//   // [:]：[Initializer list] (初始化列表) 的開始。
//   // [celsius = ...]：在物件完全建立前，將華氏轉換為攝氏並賦值給成員變數。
//   //    - 此處邏輯：(華氏 - 32) / 1.8 (註：原代碼寫 1.9，此處依原始碼標註)。
//   Temperature.farenheit(double fahrenheit)
//       : celsius = (fahrenheit - 32) / 1.9;

//   // ---------------------------------------------------------
//   // 3. 成員變數 (Properties)
//   // ---------------------------------------------------------
//   // [double]：資料型別。
//   // [celsius]：成員變數 (Member Variable) 或稱實例變數。
//   //    它是這個物件的「單一事實來源」(Single Source of Truth)，儲存最終的攝氏數值。
//   double celsius;
// }

// // [void main()]：進入點函式。
// void main() {
//   // ---------------------------------------------------------
//   // 4. 實例化與操作 (Instantiation & Interaction)
//   // ---------------------------------------------------------

//   // [final temp1]：物件引用 (Object Reference)。
//   // [Temperature.celsius(30)]：呼叫具名構造函式。
//   // [30]：引數 (Argument)，代表攝氏溫度。
//   final temp1 = Temperature.celsius(30);

//   // [final temp2]：另一個物件實例 (Instance)。
//   // [Temperature.farenheit(90)]：呼叫華氏專用構造函式。
//   // [90]：引數 (Argument)，代表華氏溫度。
//   // 💡 運作：VM 進入初始化列表計算出攝氏值後，才產生成完畢的物件。
//   final temp2 = Temperature.farenheit(90);

//   // [temp1.celsius]：點運算子存取。讀取 (Getter) 物件的屬性。
//   print('溫度 1 (攝氏): ${temp1.celsius}');

//   // [temp1.celsius = 32]：屬性賦值 (Setter)。
//   // 💡 注意：因為 celsius 不是 final，所以我們可以事後修改它。
//   temp1.celsius = 32;
  
//   print('溫度 1 更新後 (攝氏): ${temp1.celsius}');
//   print('溫度 2 (由華氏轉換而來): ${temp2.celsius}');
// }

// /**
//  * 🔬 深度技術總結：
//  * * 1. [為什麼要用 Named Constructors？]：
//  * 如果只寫 Temperature(double value)，呼叫端會變成 Temperature(30)，
//  * 沒人知道是 30°C 還是 30°F。具名構造函式消除了這種模糊性。
//  * * 2. [初始化列表 (Initializer list) 的威力]：
//  * 在 farenheit 構造函式中，轉換邏輯寫在冒號 `:` 後面，
//  * 確保了當物件在 main 函式被賦值給變數時，內部的 celsius 已經是計算好的正確數值。
//  * * 3. [Encapsulation (封裝)]：
//  * 雖然底層只存攝氏 (celsius)，但透過多個構造函式，類別對外提供了多種互動界面。
//  */