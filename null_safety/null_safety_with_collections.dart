void main(){
  // const cities = <String>['London', 'Paris', null]; //Dart不可以接受，null safety enabled
  // const cities = ['London', 'Paris', null];  Dart可以接受
  const cities = <String?>['London', 'Paris', null]; //Dart可以接受 <String?>
  for (var city in cities) {
      //不能直接  print(city.toUpperCase());
    if(city != null){
      print(city.toUpperCase());
    }
  }
}

// // 程式的進入點
// void main() {
//   // [ 案例 1：嚴格模式 (非同步註解掉) ]
//   // 如果寫成 <String>，代表清單內「每一項都必須是字串」，絕對不能有 null。
//   // 若放入 null，編譯器會報錯：The element type 'Null' can't be assigned to the list type 'String'.
//   // const cities = <String>['London', 'Paris', null]; 

//   // [ 案例 2：推斷模式 ]
//   // 如果不寫型別，Dart 會根據內容物自動推斷。因為裡面有字串也有 null，
//   // 它會聰明地推斷這是一個 List<String?>。
//   // const cities = ['London', 'Paris', null]; 

//   // [ 案例 3：明確宣告可為空的清單 (Nullable Elements) ]
//   // <String?> 代表這個清單是一個「裝著『可能為空的字串』的盒子」。
//   // 這裡我們明確允許清單內包含 null 粒子。
//   const cities = <String?>['London', 'Paris', null]; 

//   // 使用 for-in 迴圈遍歷清單中的每一個元素。
//   // 此時變數 city 的型別會被自動推斷為 String? (可為空的字串)。
//   for (var city in cities) {
    
//     // [ 錯誤嘗試 ]
//     // 因為 city 可能是 null，你不能直接呼叫 .toUpperCase()。
//     // 如果直接寫 print(city.toUpperCase()); 編譯器會攔截你，保護程式不閃退。
    
//     // [ 流程分析與型別晉升 (Flow Analysis & Promotion) ]
//     // 透過 if 檢查確認 city 不是 null。
//     if (city != null) {
//       // 在這個 { } 括號區塊內，city 已經從 String? 「晉升」為 String。
//       // 因為 Dart 確定它絕對有值，所以現在可以安全地呼叫字串的方法了！
//       print(city.toUpperCase());
//     } else {
//       // 如果 city 是 null，則會走到這裡（本範例中我們選擇不處理 null 分支）。
//       print('發現一個空位置！');
//     }
//   }
// }