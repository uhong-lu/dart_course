//位置參數
void main(){
  final person = decribe('Andrea',36);
  print (person);
}

String decribe(String name, int age){
  return 'My name is $name and I am $age years old';
}

//具名參數
void main(){
  final person = decribe(name : 'Andrea',age : 36);
  print (person);
}

String decribe({String name, int age}){
  return 'My name is $name and I am $age years old';
}

// // --- 案例一：位置參數 (Positional Arguments) ---
// // 特性：資料的意義由傳入的「物理順序」決定。

// // [void]：回傳型別，表示主程式執行完畢後不回傳任何數據物件。
// // [main]：函式名稱，身為程式唯一的進入點 (Entry Point)。
// void main() {
//   // [final]：宣告一個不可變的變數「標籤」。
//   // [person]：變數名稱（物件引用），用來接收函式回傳的字串物件。
//   // [describe(...)]：呼叫函式物件。
//   // ['Andrea']：傳入的第一個參數值，型別為 String 字面值。
//   // [36]：傳入的第二個參數值，型別為 int 字面值。
//   final person = describe('Andrea', 36);
  
//   // 呼叫內建 print 函式，將 person 引用指向的字串物件輸出至控制台。
//   print(person);
// }

// // [String]：回傳型別，承諾此函式結束後會交回一個 String 物件。
// // [describe]：自定義函式標籤。
// // [String name]：位置參數一。進入函式後，第一個值會被賦予給區域變數「name」。
// // [int age]：位置參數二。進入函式後，第二個值會被賦予給區域變數「age」。
// String describe(String name, int age) {
//   // [return]：回傳指令。
//   // ['$name', '$age']：字串插值語法，會存取區域變數 name 與 age 的值。
//   return 'My name is $name and I am $age years old';
// }


// // --- 案例二：具名參數 (Named Arguments) ---
// // 特性：使用大括號 {} 包裹，參數的意義由「標籤名稱」決定。

// // 注意：在現代 Dart (Null Safety) 中，具名參數必須處理「可能為空」的問題，
// // 因此通常會用到 `required` 或給予「預設值」。
// void main() {
//   // [name: 'Andrea']：使用名稱標籤傳入資料，這讓呼叫端具備極高的可讀性。
//   // [age: 36]：即使把 age 放前面、name 放後面，結果也是一樣的。
//   final person = describeWithNamed(name: 'Andrea', age: 36);
  
//   print(person);
// }

// // [String]：定義回傳物件型別。
// // [{...}]：大括號代表這是一個具名參數區塊，所有參數預設都是選填的 (Optional)。
// // [required String name]：加入「required」關鍵字。
// //   這代表編譯器會強制檢查呼叫端是否提供了 name，若沒提供會報錯。
// // [int age = 0]：給予「預設值 0」。
// //   如果呼叫端沒有傳入 age，則此區域變數會自動初始化為 0，避免 null 導致的錯誤。
// String describeWithNamed({required String name, int age = 0}) {
//   // [name]：引用具名參數傳進來的資料物件。
//   // [age]：引用傳入的值或預設值。
//   return 'My name is $name and I am $age years old';
// }