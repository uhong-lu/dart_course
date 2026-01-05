// Exercise
// Given the following (incomplete) program:

// class Person {
//   Person({required this.name, required this.age});
//   final String name;
//   final int age;
//   // TODO: Implement fromJson
//   // TODO: Implement toJson
// }
 
// void main() {
//   final person = Person.fromJson({
//     'name': 'Andrea',
//     'age': 36,
//   });
//   final json = person.toJson();
//   print(json);
// }
// Implement a factory fromJson constructor so that it’s possible to create Person instances from a map of key-value pairs. This should handle the case where the name and age values are missing or have the wrong type.
// Implement a toJson() method so that a Person instance can be converted back to a Map<String, Object>.


class Person {
  Person({required this.name, required this.age});
  final String name;
  final int age;

  factory Person.fromJson(Map<String, Object> json) {
    final name = json['name'];
    final age = json['age'];

    if (name is String && age is int) {
    return Person(name: name, age: age);
    }
    throw StateError('Could not read name or age');
  }
  // TODO: Implement toJson
  Map<String, Object> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }
}
 
void main() {
  final person = Person.fromJson({
    'name': 'Alice',
    'age': 21,
  });
  final json = person.toJson();
  print(json);
}











// /**
//  * 主題：JSON Serialization (序列化)
//  * 核心：資料的「打包」與「拆包」。
//  */

// // [class Person]：定義「人」這個物件的設計圖。
// class Person {
//   // [Person({ ... })]：普通構造函式。
//   // 負責把資料存入 [this.name] 和 [this.age]。
//   Person({required this.name, required this.age});

//   // [final]：一旦資料存進來 (記憶體寫入)，就不准再改。
//   final String name;
//   final int age;

//   // ---------------------------------------------------------
//   // 1. 反序列化 (Factory Constructor: fromJson)
//   // 動作：拆包 (Map -> Object)
//   // ---------------------------------------------------------
  
//   // [factory]：工廠建構子。告訴電腦：「給我原料，我負責生產出一個 Person 物件給你」。
//   // [(Map<String, Object> json)]：原料袋。
//   //    - Key (String): 標籤 (如 'name')。
//   //    - Value (Object): 內容 (如 'Alice')。
//   factory Person.fromJson(Map<String, Object> json) {
//     // [提取資料]：從 Map 中根據 Key 把值拿出來。
//     final name = json['name'];
//     final age = json['age'];

//     // [型別檢查 (Type Guard)]：
//     // 雖然 Map 說裡面裝的是 Object，但我們必須確認它們真的是 String 和 int。
//     // 這一步是為了防止「爛資料」導致程式崩潰。
//     if (name is String && age is int) {
//       // [return Person(...)]：
//       // 1. 呼叫上方的普通構造函式。
//       // 2. 在 Heap 記憶體中，切一塊新空間，建立一個 Person 物件。
//       // 3. 把 name 和 age 填進去。
//       // 4. 把這個新物件回傳出去。
//       return Person(name: name, age: age);
//     }
    
//     // [Error]：如果資料格式不對，拋出錯誤，拒絕生產。
//     throw StateError('Could not read name or age');
//   }

//   // ---------------------------------------------------------
//   // 2. 序列化 (Method: toJson)
//   // 動作：打包 (Object -> Map)
//   // ---------------------------------------------------------

//   // [Map<String, Object>]：回傳型別。承諾會吐出一個標準的 Map 格式。
//   Map<String, Object> toJson() {
//     // [return { ... }]：建立一個新的 Map 物件。
//     // [去向]：
//     // 1. 讀取當前物件的 this.name ('Alice')。
//     // 2. 讀取當前物件的 this.age (21)。
//     // 3. 把這些資料塞進一個全新的 Map 裡回傳。
//     return {
//       'name': name,
//       'age': age,
//     };
//   }
// }

// void main() {
//   // ---------------------------------------------------------
//   // 3. 執行流程追蹤 (Runtime Flow)
//   // ---------------------------------------------------------

//   // [Step A: 讀取 JSON]
//   // 1. 呼叫 Person.fromJson 工廠。
//   // 2. 傳入一個 Map (原料)。
//   // 3. 工廠生產出一個 Person 物件，存放在 Heap 記憶體中。
//   // 4. 變數 person 指向這個物件。
//   final person = Person.fromJson({
//     'name': 'Alice',
//     'age': 21,
//   });

//   // [Step B: 轉回 JSON]
//   // 1. 呼叫 person 物件的 toJson 方法。
//   // 2. 方法內部讀取 person 的資料。
//   // 3. 產生一個新的 Map 物件回傳。
//   // 4. 變數 json 指向這個新的 Map。
//   final json = person.toJson();

//   // [print]：印出 Map 的內容。
//   // Output: {name: Alice, age: 21}
//   print(json);
// }