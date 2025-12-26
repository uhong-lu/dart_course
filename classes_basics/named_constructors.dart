class Complex {
  
  const Complex(this.re, this.im);
  final double re;
  final double im;
}

void main(){
  //Some special comoplex numbers
  // 0 + i * 0
  final zero = Complex(0, 0);
  // 1 + i * 0
  final identity = Complex(1, 0);
  // a + i * 0
  final real = Complex(3, 0);
  // 0 + i * b
  final imaginary = Complex(0, 4);
}




// class Complex {
  
//   const Complex(this.re, this.im);
//   const Complex.zero() : re = 0, im = 0;
//   const Complex.identity() : re = 1, im = 0;
//   const Complex.real(this.re) : im = 0;
//   const Complex.imaginary(this.im) : re = 0;
//   final double re;
//   final double im;
// }


// void main(){
//   //Some special comoplex numbers
//   // 0 + i * 0
//   final zero = Complex.zero();
//   // 1 + i * 0
//   final identity = Complex.identity();
//   // a + i * 0
//   final real = Complex.real(3);
//   // 0 + i * b
//   final imaginary = Complex.imaginary(4);
// }










// /**
//  * 主題：具名構造函式 (Named Constructors)
//  * 核心觀念：提供多個清晰的初始化路徑，並結合 Initializer Lists (初始化列表) 處理預設值。
//  */

// // [class]：類別關鍵字，定義 Complex 型別。
// class Complex {
//   // ---------------------------------------------------------
//   // 1. 主構造函式 (Default/Generative Constructor)
//   // ---------------------------------------------------------
//   // [const]：允許建立編譯期常數。
//   // [this.re, this.im]：[this shorthand syntax] 語法糖。
//   //    - 定義了兩個位置參數 (Positional Parameters)。
//   //    - 自動將傳入的引數 (Arguments) 分別賦值給屬性 re 和 im。
//   const Complex(this.re, this.im);

//   // ---------------------------------------------------------
//   // 2. 具名構造函式 (Named Constructors)
//   // ---------------------------------------------------------
  
//   // [Complex.zero]：具名構造函式，名稱格式為「類別名.別名」。
//   // [()]：此構造函式不接收任何參數 (No arguments)。
//   // [:]：[Initializer list] (初始化列表) 的開始。
//   // [re = 0, im = 0]：直接在初始化列表中給予成員變數固定值。
//   // [;]：因為沒有函式體 {}，直接以分號結束。
//   const Complex.zero() : re = 0, im = 0;

//   // [Complex.identity]：定義單位複數 (1 + 0i)。
//   // [:]：初始化列表，在物件誕生前設定狀態。
//   const Complex.identity() : re = 1, im = 0;

//   // [Complex.real]：專門用來建立只有實部 (Real part) 的複數。
//   // [(this.re)]：結合簡寫語法，接收一個參數並賦值給 re 屬性。
//   // [:]：初始化列表，將不需外部輸入的 im 屬性強制設定為 0。
//   const Complex.real(this.re) : im = 0;

//   // [Complex.imaginary]：專門用來建立純虛數 (Pure imaginary number)。
//   // [(this.im)]：接收參數並賦值給 im。
//   // [:]：初始化列表，將 re 屬性強制設定為 0。
//   const Complex.imaginary(this.im) : re = 0;

//   // ---------------------------------------------------------
//   // 3. 不可變成員屬性 (Properties)
//   // ---------------------------------------------------------
//   // [final]：確保物件一旦建立，內部數值便不可更改，滿足 const 建構子的要求。
//   final double re; // 實部 (Real)
//   final double im; // 虛部 (Imaginary)
// }

// // [void main()]：執行進入點。
// void main() {
//   // ---------------------------------------------------------
//   // 4. 實例化動作 (Object Instantiations)
//   // ---------------------------------------------------------

//   // [Complex.zero()]：呼叫具名構造函式。
//   // [zero]：指向 Heap 中一個 re=0, im=0 的物件實例 (Instance)。
//   final zero = Complex.zero();

//   // [Complex.identity()]：呼叫專屬的單位複數建構入口。
//   final identity = Complex.identity();

//   // [Complex.real(3)]：
//   // [3]：引數 (Argument)，傳給構造函式的 this.re。
//   // 結果物件：re 為 3.0, im 為 0.0。
//   final real = Complex.real(3);

//   // [Complex.imaginary(4)]：
//   // [4]：引數，傳給構造函式的 this.im。
//   // 結果物件：re 為 0.0, im 為 4.0。
//   final imaginary = Complex.imaginary(4);
  
//   // [print] 測試輸出結果
//   print('Zero: ${zero.re} + ${zero.im}i');
//   print('Real: ${real.re} + ${real.im}i');
// }

// /**
//  * 🔬 深度技術解析：
//  * * 1. [為什麼要用 Named Constructors？]：
//  * 傳統構造函式只能靠參數順序或具名參數區分。
//  * 但當你有完全不同的「初始化場景」時（例如從 JSON 建立 vs 從 預設值 建立），
//  * 具名構造函式能提供最直觀的語義。
//  * * 2. [初始化列表 (Initializer list) 的優勢]：
//  * 在執行 `Complex.real(this.re) : im = 0` 時，im 的設定發生在物件「完全成形」之前。
//  * 這對於 final 變數來說是必經之路，且效能比在大括號 {} 內賦值更高。
//  * * 3. [混合使用]：
//  * 你可以同時使用 this 語法糖（接收參數）和 初始化列表（設定固定值），如 real 構造函式所示。
//  */