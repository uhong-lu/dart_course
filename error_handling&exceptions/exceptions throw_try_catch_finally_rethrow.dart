//exceotions are common in a number of different scenarios, such as when we're dealing with network requests, or file I/O and in general any kind of operation that can fail unexpectedly
//Unlike Errors we should be able to recover when an Exception happens and Dart comes with some language features that we can use to do this
//'rethrow' is useful whenever you want to do some exception handling inside a function or method but you still want the exception to propagate to the calling function where you may do some further handling
//check out all exception types. We can create our own custom 'Exception' types by implementing 'Exception'. Or we can use any of the existing 'exception' types.
//there's a long list of excepton types which are appropriate for various use cases.

//exceptions example
// class Fraction{
//   Fraction(this.numerator, this.denominator);
//   final int numerator;
//   final int denominator;
//   double get value => numerator / denominator;
// }

// void main(){
//   final f = Fraction(3, 5);
//   print(f.value);
// }


// void main(){
//   final f = Fraction(3, 0);  //output 'infinity'
//   print(f.value);
// }


//don't want output to be infinity
//throw an exception if we try to create a 'Fraction' like this
//To handle this , we can add a constructor body and type if
//this is a specific kind of exception that is available in the Dart SDK
//we now get Unhandled exception with this type and along with a stack trace and our program is interrupted
//we can recover from this by using try-catch blocks
// class Fraction{
//   Fraction(this.numerator, this.denominator) {
//     if (denominator == 0) {
//       throw  IntegerDivisionByZeroException();
//     }
//   }
//   final int numerator;
//   final int denominator;
//   double get value => numerator / denominator;
// }

// // void main(){
// //   final f = Fraction(3, 5);
// //   print(f.value);
// // }

// void main(){
//   final f = Fraction(3, 0);
//   print(f.value);
// }

//surround with a 'try' block and a 'catch' block which gives us an argument that contains the exception that was thrown
// class Fraction{
//   Fraction(this.numerator, this.denominator) {
//     if (denominator == 0) {
//       throw  IntegerDivisionByZeroException();
//     }
//   }
//   final int numerator;
//   final int denominator;
//   double get value => numerator / denominator;
// }

// // void main(){
// //   final f = Fraction(3, 5);
// //   print(f.value);
// // }

// void main(){
//   try{
//     final f = Fraction(3, 0);
//     print(f.value);
//   } catch(e){  
//     print('Caught an exception: $e');  //still get an 'IntegerDivisionByZeroException' but no longer interrupt the program
//   }
// }


//As a proof of no longer interrupt the program, create a new function
class Fraction{
  Fraction(this.numerator, this.denominator) {
    if (denominator == 0) {
      throw  IntegerDivisionByZeroException(); //one hand we throw exceptions by using 'throw' keyword
    }
  }
  final int numerator;
  final int denominator;
  double get value => numerator / denominator;
}

void testFraction(){
   try{                        //the other hand we catch them using 'try catch' blocks
    final f = Fraction(3, 0);
    print(f.value);
  } catch(e){  
    print('Caught an exception: $e');  
  }
}

void main(){
  testFraction();
  print('Program continues...');  //is printed after 'IntegerDivisionByZeroException'
}


//the point of using 'throw' and 'catch' simtaneously is to be able to recover from exceptions and allow the program to continue running
//if this denominator was a variable, we could just use an if statement to check that it is not 0 before creating a 'Fraction' object
//Using 'throw' , 'try' and 'catch' makes it explicit that we are handling some unexpected exception. And when we use catch, we can also specify a second argument that represents the stack trace
// catch(e, st){  
//     print('Caught an exception: $e');  
//   }
//This carries a lot of useful information about where the exception happened. Not only that, but in Dart, we can use multiple and 'catch' statements to check for different kinds of exceptions.
// When we do this, this code will only execute if the exception was of this type. 
// void testFraction(){
//    try{                       
//     final f = Fraction(3, 0);
//     print(f.value);
//   } on IntegerDivisionByZeroException catch(e){  
//     print('Caught an exception: $e');  
//   }
// }


// And if we want we can add another catch and type: on Exception catch(e)
// this can be quite useful if we want to respond to different kinds of exceptions in different ways.
// void testFraction(){
//    try{                       
//     final f = Fraction(3, 0);
//     print(f.value);
//   } on IntegerDivisionByZeroException catch(e){  
//     print('Caught an exception: $e');  
//   } on Exception catch(e){
//     print('Caught a general exception: $e');
//   }
// }


// we can also add a special keyword called 'finally' at the end of this block of code
// So we can use this to execute some code regardless of whether there was an exception or not
// void testFraction(){
//    try{                       
//     final f = Fraction(3, 0);
//     print(f.value);
//   } on IntegerDivisionByZeroException catch(e){  
//     print('Caught an exception: $e');  
//   } on Exception catch(e){
//     print('Caught a general exception: $e');
//   }finally{
//     
//   }
// }


// As a proof of this 
// we can see that the output contains the exception as well as the output from this print statement
// and the output from this print statement in the main method.
// but because we run this code with a denominator of 0, this 'print(f.value);' statement is not executed because this code throws an exception.
// And instead, this catch block is excuted because the exception type matches and after that the finally block is executed.
// void testFraction(){
//    try{                       
//     final f = Fraction(3, 0);
//     print(f.value);
//   } on IntegerDivisionByZeroException catch(e){  
//     print('Caught an exception: $e');  
//   } on Exception catch(e){
//     print('Caught a general exception: $e');
//   }finally{
//     print('This is always executed');
//   }
// }

// on the other hand if we change this denominator to 5. We can see that we print this value followed by the finally block
// And then we get this line from the main method
// void testFraction(){
//    try{                       
//     final f = Fraction(3, 5);
//     print(f.value);
//   } on IntegerDivisionByZeroException catch(e){  
//     print('Caught an exception: $e');  
//   } on Exception catch(e){
//     print('Caught a general exception: $e');
//   }finally{
//     print('This is always executed');
//   }
// }



//there is also another keyword called rethrow
// We can use it inside this catch block like this
// If we set the denominator to 0 again. We can see that the output prints 'IntegerDivisionByZeroException'
// Then we get 'This is always executed' which is printed by this line in the finally block
// Then we get an unhandled exception, that's because we are rethrowing the exception after processing it. 
// Because the 'main()' method is not catching any exceptions then the program execution is interrupted
// void testFraction(){
//    try{                       
//     final f = Fraction(3, 0);
//     print(f.value);
//   } on IntegerDivisionByZeroException catch(e){  
//     print('Caught an exception: $e');
//     rethrow; 
//   } on Exception catch(e){
//     print('Caught a general exception: $e');
//   }finally{
//     print('This is always executed');
//   }
// }
































// 這份筆記整理了 Dart 語言中處理異常（Exception Handling）的核心機制。我將原始代碼依照邏輯流程分成了幾個主題區塊，並將註解翻譯成中文，同時解釋了每個步驟的程式碼作用。

// 1. 異常處理的基本概念 (Introduction)
// 這段文字說明了為什麼我們需要異常處理，以及它與嚴重錯誤（Error）的區別。

// 原始註解翻譯：

// 異常（Exceptions）在許多不同的場景中都很常見，例如處理網路請求、檔案讀寫（I/O），以及任何可能發生非預期失敗的操作。

// 與「錯誤（Errors）」不同，當異常發生時，我們應該要能夠讓程式恢復運作。Dart 提供了一些語言特性來幫助我們做到這點。

// rethrow（重新拋出）非常有用，當你想在函數內部做一些異常處理，但仍希望將異常傳遞給呼叫它的函數做進一步處理時使用。

// 2. 問題的起源：未處理的狀況
// 一開始，如果不做任何檢查，程式可能會產生非預期的結果（如無限大 Infinity）或崩潰。

// Dart
// // 定義一個分數類別
// class Fraction {
//   Fraction(this.numerator, this.denominator);
//   final int numerator;
//   final int denominator;
  
//   // 計算小數值
//   double get value => numerator / denominator;
// }

// void main() {
//   // 這裡分母是 0，在 Dart 的 double 運算中會得到 'Infinity' (無限大)
//   final f = Fraction(3, 0); 
//   print(f.value); 
// }
// 3. 主動拋出異常 (Throwing Exceptions)
// 為了避免產生無效的數據（如 Infinity），我們可以在建構子中檢查數據，並在發現問題時主動「拋出」異常中斷執行。

// Dart
// class Fraction {
//   Fraction(this.numerator, this.denominator) {
//     // 如果分母為 0，我們不希望程式繼續下去
//     if (denominator == 0) {
//       // 主動拋出一個 Dart 內建的異常類型
//       throw IntegerDivisionByZeroException();
//     }
//   }
//   final int numerator;
//   final int denominator;
//   double get value => numerator / denominator;
// }

// void main() {
//   // 嘗試建立分母為 0 的分數
//   // 結果：程式會崩潰（Crash），控制台會顯示 Unhandled exception (未處理的異常) 以及堆疊追蹤 (Stack Trace)
//   final f = Fraction(3, 0);
//   print(f.value);
// }
// 4. 捕捉異常與恢復 (Try & Catch)
// 為了不讓程式崩潰，我們使用 try 包裹危險的程式碼，並用 catch 接住錯誤。這證明了程式可以在出錯後繼續活著。

// Dart
// // ... Fraction 類別同上 ...

// void testFraction() {
//   try {
//     // 這一手：我們用 'throw' 關鍵字拋出異常
//     final f = Fraction(3, 0); 
//     print(f.value); 
//   } catch (e) {
//     // 另一手：我們用 'try catch' 區塊接住它們
//     // 這裡的 'e' 代表捕捉到的異常物件
//     print('捕捉到異常: $e'); 
//   }
// }

// void main() {
//   testFraction();
//   // 這行會被印出來！證明程式沒有崩潰，處理完異常後繼續往下執行了
//   print('程式繼續執行...'); 
// }
// 5. 指定異常類型與堆疊追蹤 (Specific Exceptions & Stack Trace)
// catch 可以更進階使用：

// 指定類型 (on)：只捕捉特定類型的錯誤。

// 堆疊追蹤 (st)：獲取錯誤發生的詳細位置資訊。

// Dart
// void testFraction() {
//   try {
//     final f = Fraction(3, 0);
//     print(f.value);
//   } 
//   // 這種寫法只會捕捉 'IntegerDivisionByZeroException' 這種類型的錯誤
//   on IntegerDivisionByZeroException catch (e) {
//     print('捕捉到除以零異常: $e');
//   } 
//   // 可以添加多個 catch。如果上面的沒抓到，這個通用的 Exception 會抓到
//   on Exception catch (e) {
//     print('捕捉到一般異常: $e');
//   }
// }

// /* 補充筆記：
// 如果需要堆疊追蹤，可以給 catch 兩個參數：
// catch (e, st) {
//   print('錯誤: $e');
//   print('發生位置: $st'); // Stack Trace 包含了很多有用的除錯資訊
// }
// */
// 6. 最終執行區塊 (Finally)
// 無論是否發生錯誤，finally 區塊裡的程式碼一定會被執行。這通常用於資源清理（如關閉檔案、資料庫連線）。

// Dart
// void testFraction() {
//   try {
//     final f = Fraction(3, 0); // 這裡出錯，跳到 catch
//     print(f.value);           // 這行不會執行
//   } 
//   on IntegerDivisionByZeroException catch (e) {
//     print('捕捉到異常: $e');   // 1. 執行 catch
//   } 
//   finally {
//     // 2. 無論上面發生什麼事，這裡最後一定會執行
//     print('這行永遠會被執行'); 
//   }
// }

// // 如果分母改成 5 (沒出錯)：
// // 1. 印出數值 -> 2. 印出 finally 區塊 -> 3. 回到 main 繼續執行
// 7. 重新拋出 (Rethrow)
// 有時候我們在函數內捕捉錯誤只是為了「紀錄 Log」，但無法解決問題，所以需要把燙手山芋往外丟，讓呼叫這個函數的人去處理。

// Dart
// void testFraction() {
//   try {
//     final f = Fraction(3, 0);
//     print(f.value);
//   } 
//   on IntegerDivisionByZeroException catch (e) {
//     print('捕捉到異常並記錄: $e');
    
//     // 使用 'rethrow' 關鍵字
//     // 這裡處理完後，把同一個異常再次丟出去
//     rethrow; 
//   } 
//   finally {
//     print('這行永遠會被執行'); 
//   }
// }

// void main() {
//   // 呼叫 testFraction
//   // 1. testFraction 內部捕捉到錯誤 -> 印出 "捕捉到異常..."
//   // 2. 執行 finally -> 印出 "這行永遠..."
//   // 3. 因為有 rethrow，錯誤被丟回 main
//   // 4. 因為 main 沒有用 try-catch 包住，程式最終在這裡崩潰 (Unhandled exception)
//   testFraction(); 
// }
// 總結
// Throw: 發現不對勁，主動報警。

// Try: 嘗試執行可能會出事的任務。

// Catch: 接住錯誤，避免程式當機。

// On: 指定只接哪一種錯誤。

// Finally: 善後工作，不管有沒有出錯都要做。

// Rethrow: 我處理一半，剩下的交給上級（呼叫者）處理。