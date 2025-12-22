void main(){
  int x = 42;
  //int x = -1;
  int? maybeValue;
  if (x>0){
    maybeValue = x;
  }
  int value = maybeValue!;
  print(value);
}

// // 程式的進入點，Dart 執行時會從這裡開始
// void main() {
  
//   // 宣告一個不可為空的整數 x，並賦值為 42。這是一個正數，會觸發後面的 if 邏輯。
//   int x = 42;
  
//   // 這是一行註解掉的程式碼。如果取消註解並執行它（x = -1），那麼 if 條件就不會成立。
//   // //int x = -1;

//   // [ int? maybeValue ]：宣告一個「可為空」的整數變數。
//   // 此時 maybeValue 的初始狀態是 null (空無一物)。
//   int? maybeValue;

//   // [ if (x > 0) ]：這是一個流程檢查。因為目前 x 是 42，條件成立。
//   if (x > 0) {
//     // 進入此區塊，將 x 的值賦予 maybeValue。
//     // 此時 maybeValue 雖然型別還是 int?，但我們知道它裡面已經裝了 42。
//     maybeValue = x;
//   }

//   // [ maybeValue! ]：這是本次的主角「斷言操作符」。
//   // 雖然 maybeValue 表面上是 int? (可能為空)，但你用驚嘆號告訴編譯器：
//   // 「我保證它絕對不是 null！請把它強行當作不可為空的 int 來使用」。
//   // 執行後，maybeValue 的值被提取出來並賦予「不可為空」的變數 value。
//   int value = maybeValue!;

//   // 印出 value 的結果。在此範例中會印出 42。
//   print(value);
// }