
void main(){
  print(sum([]));
  print(sum([1,2]));
  print(sum([1,2,3,4]));
}

double sum(List<double> values){
  var sum = 0.0;
  for (var value in values) {
    sum += value;
  }
  return sum;
}

// // 程式進入點
// void main() {
//   // 呼叫 sum 函式並傳入一個「空清單」。預期結果應為 0.0。
//   // print 會將 sum 回傳的 double 轉為文字並印出。
//   print(sum([]));
  
//   // 呼叫 sum 函式並傳入包含 [1, 2] 的清單。預期結果為 3.0。
//   print(sum([1, 2]));
  
//   // 呼叫 sum 函式並傳入包含四個數字的清單。預期結果為 10.0。
//   print(sum([1, 2, 3, 4]));
// }

// /**
//  * 主題：計算清單總和的函式
//  * [ double ]：回傳型別。告訴呼叫者，這個函式最後會交回一個小數。
//  * [ sum ]：函式名稱。
//  * [ List<double> values ]：參數。要求呼叫者必須提供一袋裝滿 double 的清單。
//  */
// double sum(List<double> values) {
//   // [ var sum = 0.0 ]：宣告一個區域變數「累加器」。
//   // 初始值設為 0.0，用來儲存計算過程中的暫存總和。
//   var sum = 0.0;
  
//   // [ for-in 迴圈 ]：這是最直覺的遍歷方式。
//   // 它的意思是：「從 values 袋子裡，依序拿出每一顆數字，暫時稱它為 value」。
//   for (var value in values) {
//     // 將目前拿到的數字 (value) 加進累加器 (sum) 中。
//     // 這是縮寫，等同於：sum = sum + value;
//     sum += value;
//   }
  
//   // [ return sum ]：這是函式的最後一步。
//   // 將計算完畢的最終總和「吐回去」給呼叫 main() 的地方。
//   return sum;
// }


// 💻 Dart 函數底層執行機制解析針對 sum 函數在 Dart 虛擬機（Dart VM）中的運作，可拆解為以下四個硬核技術層面：1. 棧幀配置與參數傳遞 (Stack Frame & Parameter Passing)呼叫慣例 (Calling Convention)：當 sum(values) 被呼叫，VM 會在 Call Stack 配置一個新的棧幀（Stack Frame）。引用傳遞 (Pass-by-reference-value)：values 參數在棧上存儲的是指向 Heap（堆） 中 List<double> 物件的記憶體地址。局部變數配置：var sum（累加器）在棧幀中被配置為 64-bit 空間。編譯器透過 Static Type Inference 鎖定其為 IEEE 754 標準的雙精度浮點數。2. 疊加器協議實作 (Iterator Protocol Implementation)for (var value in values) 是語法糖，其底層轉換為指令級別的對象協作：取得疊加器：呼叫 values.iterator，於 Heap 建立一個 Iterator 實體。狀態檢查：執行 moveNext()。這是一個方法呼叫，移動內部指針並返回 bool。數據存取：讀取 current 屬性，將 Heap 中 List 元素的值加載（Load）至棧中的局部變數 value。3. 算術運算與指令執行 (ALU Operations)sum += value：Load：從棧中讀取 sum 與 value。Execution：將操作數送入處理器的 FPU（浮點運算單元） 執行加法指令。Store：將運算結果回寫（Overwrite）至棧幀中 sum 的原始位址。此過程不產生新物件，僅修改棧數據。4. 函數返回與棧毀損 (Return & Teardown)結果拷貝：執行 return sum 時，將棧幀中 sum 的值拷貝至 寄存器（Register） 或呼叫者預留的棧空間。棧幀彈出 (Stack Popping)：VM 銷毀該函數的棧幀，釋放所有區域變數（sum, value, iterator）的生命週期。控制權轉移：PC（程式計數器）跳回至 main 函數的後續指令位址。⚙️ 底層行為對照表代碼片段硬核機制技術細節List<double> valuesHeap Pointer棧變數指向堆中的物件，避免大數據拷貝。var sum = 0.0Stack Allocation配置 64 位元空間，執行期不進行型別檢索。for-inInterface Dispatch依賴 Iterator 介面的虛擬函數呼叫（vtable）。sum += valueMutable In-place針對棧變數進行原地更新，效率極高。return sumFrame Epilogue執行棧清理並進行數據回傳。