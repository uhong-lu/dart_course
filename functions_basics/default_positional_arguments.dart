//要求兩個引數 但只有一個引數被提供
// void main(){
//   foo(1);
// }

// void foo(int a, int b){
//   print('a: $a, b: $b');
// }

//use [] to make the second argument optional
// and provide a default value
void main(){
  foo(1);
  foo(1 , 3);
}

void foo(int a, [int b = 2]){
  print('a: $a, b: $b');
}

//or you can use nullable type
// void foo(int a, [int? b ]){
//   print('a: $a, b: $b');
// }

//use {} to make the second and third argument optional
// mix and match positional and named arguments
// void main(){
//   foo(1, b : 0, c:4);} 
// void foo(int a, {int b, int c}){
//   print('a: $a, b: $b');
// }




// /**
//  * 主題：從必填位置參數到選填位置參數的演進
//  * 硬核解析：探討呼叫棧 (Stack) 與參數映射 (Parameter Mapping) 的失敗與成功。
//  */

// // ---------------------------------------------------------
// // ❌ 初始問題：參數數量不匹配 (Argument Count Mismatch)
// // ---------------------------------------------------------
// // void main() {
// //   // [引數 Argument]：僅提供一個 '1'。
// //   // [編譯錯誤]：'2 positional argument(s) expected, but 1 found.'
// //   // 硬核原因：函式簽章 (Signature) 要求兩個 64-bit 空間，但呼叫端只推入了一個。
// //   foo(1); 
// // }

// // [int a, int b]：這兩個都是「必填位置參數 (Required Positional Parameters)」。
// // void foo(int a, int b) {
// //   print('a: $a, b: $b');
// // }


// // ---------------------------------------------------------
// // ✅ 解法一：選填位置參數 (Optional Positional Arguments)
// // ---------------------------------------------------------
// void main() {
//   // [foo(1)]：執行期 (Runtime) 只推入一個引數。
//   // 因為 b 有預設值，VM 會自動從常量區拷貝值到棧幀，補齊遺漏的空間。
//   foo(1);

//   // [1, 3]：推入兩個引數。第二個引數 '3' 會直接佔據變數 b 的記憶體位置。
//   foo(1, 3);
// }

// /**
//  * [int a]：必選位置參數。
//  * [[int b = 2]]：選填位置參數。
//  * - [ ]：中括號定義了一個「順序敏感」的選填作用域。
//  * - [= 2]：預設值機制。確保在沒有引數輸入時，變數 b 不會是 null。
//  */
// void foo(int a, [int b = 2]) {
//   // [$a, $b]：存取當前棧幀中的局部變數物件。
//   print('a: $a, b: $b');
// }


// // ---------------------------------------------------------
// // ✅ 解法二：可為空的選填位置參數 (Nullable)
// // ---------------------------------------------------------
// /**
//  * [int? b]：允許 b 為空。
//  * 若呼叫端未傳值，且未定義預設值 (=)，則系統初始化 b 為 null。
//  */
// void fooNullable(int a, [int? b]) {
//   print('a: $a, b: $b'); // 如果只傳 1，會印出 a: 1, b: null
// }


// // ---------------------------------------------------------
// // ✅ 解法三：具名參數 (Named Arguments) - 混合模式
// // ---------------------------------------------------------
// void mainMixed() {
//   // [1]：映射至位置參數 a。
//   // [b: 0, c: 4]：透過「標籤名稱 (Label)」映射至對應變數，順序不限。
//   fooMixed(1, b: 0, c: 4);
// }

// /**
//  * [int a]：位置參數。
//  * [{int? b, int? c}]：具名參數區塊，具備極高的可讀性與擴充性。
//  */
// void fooMixed(int a, {int? b, int? c}) {
//   print('a: $a, b: $b, c: $c');
// }