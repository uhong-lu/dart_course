// Stream constructors
void main(){
  Stream.fromIterable([1 , 2 , 3]);
  Stream.value(10);
  Stream.error(Exception('something went wrong'));  // A Future can complete with an error // A Stream can emit an error
  Stream.empty();
  Stream.fromFuture(Future.delayed(Duration(seconds: 1), () => 42));
  Stream.periodic(Duration(seconds: 1), (index) => index);
}





// void main() {
//   // 1. 從集合 (List/Set) 建立 Stream
//   // 就像把一箱貨物直接放上輸送帶，會依序送出 1, 2, 3
//   Stream.fromIterable([1, 2, 3]);

//   // 2. 建立只有「單一數值」的 Stream
//   // 輸送帶上只有一個包裹 (10)，送完就結束
//   Stream.value(10);

//   // 3. 建立一個包含「錯誤」的 Stream
//   // 輸送帶送過來的不是禮物，而是一個「警報器」
//   // A Stream can emit an error (Stream 可以發送錯誤事件)
//   Stream.error(Exception('something went wrong'));

//   // 4. 建立一個「空」的 Stream
//   // 輸送帶啟動後，什麼都沒送，直接顯示「結束」
//   Stream.empty();

//   // 5. 從 Future 建立 Stream
//   // 把「未來會拿到的一個值」轉成 Stream
//   // 這裡模擬等待 1 秒後，收到數字 42
//   Stream.fromFuture(Future.delayed(Duration(seconds: 1), () => 42));

//   // 6. 建立週期性 (定時) 的 Stream
//   // 就像時鐘一樣，每隔 1 秒送出一個數字 (0, 1, 2, ...)
//   Stream.periodic(Duration(seconds: 1), (index) => index);
// }