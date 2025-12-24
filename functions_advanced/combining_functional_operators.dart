void main(){
  const emails = [  //suppose that we have a list of email addresses
    'abc@abc.com',
    'me@example.com',
    'john@gmail.com',
    'katy@yahoo.com',
  ];
  const knownDomains = ['gmail.com', 'yahoo.com']; //supose we have a list of knownDomains
  //extract all the unknown domains from this list of emails. To do this we can use some of the functional operators that we have learned. 
  //(abc.com, example.co.uk)

//version 1  
//     final unknownDomains = emails
//       .map((email) => email.split('@').last)        //So given an email in this format,what this expression does it to split it in two components, using the @ as the separator, and then we can use '.last' to return the right hand side.
//   print(unknownDomains);                            
// }

//version 2  
//   final unknownDomains = emails
//       .map((email) => email.split('@').last)              
//       .where((domain) => !knownDomains.contains(domain));//So if we print the 'unknownDomains', and we run thid program,then we get all these domains in the output.But what we actually want to do is to only return the domains that dont belong to this list.And to do this we can chain another functional operator, at thr end of this expression.In other words, here we can type .where and then we can use the (domain) to return not knownDomains. And note here I've chosen to name this variable 'domain' because we're applying the 'where' operator to the result of the previous step, which returns a list of domains. So contains will be true if a given domain belongs to this list. And here we can negate this condition so that this expression will return false if the domain belongs to this list. As a result this line filter out all the known domains. We can now see that the output is what we want.
//   print(unknownDomains);                            
// }
//The reson all this code is valid is that each one of these operators returns an 'iterable' object. And because iterables support all these functional operators, then we can chain them up in sequence using the dot access operator. By the way if we want we can even move all this logic inside a separate function, so that we can reuse it when we neef it. 


//version 2 functional style
//this can save us a lot of work and make our code easier to write and easier to read because we can understand what each individual step does.
  final unknownDomains = getUnknownDomains(emails, knownDomains);
  print(unknownDomains);                            
}

Iterable<String> getUnknownDomains(                          //to do this we can declare a functon that an 'Iterable of type String' we could call this 'getUnknownDomains', and this will take two arguments, a list of emails and a list of knownDomains. And because all this logic can be written as a single expression,then here we can use the arrow operator,and then we can take this code from here and paste it here.and then we can call thie function and pass the email and knownDomains as an argument.
List<String> emails, List<String> knownDomains) => emails //By the way we can implement this same function using for loops and if statements, however the resulting code becomes a lot more complex.
      .map((email) => email.split('@').last)
      .where((domain) => !knownDomains.contains(domain));


//version 2 functional style alternative implementation
//On the other hand this implerative style is harder to work with, because we have to write a sequence of steps,and use control flow statements in order to produce the result that we want.
Iterable<String> getUnknownDomains2(List<String> emails, List<String> knownDomains){
  var result = <String>[];
  for (var email in emails) {
    final domain = email.split('@').last;
    if (!knownDomains.contains(domain)) {
      result.add(domain);
    }
  }
  return result;
}  

//To be clear not saying that functional programming is always better than imperative programming but as you make progress in your programming journey, try to keep im mind that both styles exist,anf choose the one that makes your code easier to read on case by case basis and we have just seen the functional style works great when need to manipulate collections like this





// /**
//  * 主題：函數式操作符鏈接 (Combining Functional Operators)
//  * 核心觀念：利用 Iterable 協議，將資料經過一連串的「轉換 (map)」與「過濾 (where)」。
//  */

// void main() {
//   // [const]：編譯期常數標籤。 
//   // [emails]：List<String> 物件，作為資料源。
//   const emails = [
//     'abc@abc.com',
//     'me@example.com',
//     'john@gmail.com',
//     'katy@yahoo.com',
//   ];

//   // [knownDomains]：另一個 List<String> 物件，用於過濾基準。
//   const knownDomains = ['gmail.com', 'yahoo.com'];

//   // ---------------------------------------------------------
//   // 核心：函數式風格呼叫 (Functional Style)
//   // ---------------------------------------------------------
  
//   // [getUnknownDomains]：呼叫下方定義的高階函式。
//   // [emails, knownDomains]：傳入兩個清單物件的引用。
//   final unknownDomains = getUnknownDomains(emails, knownDomains);
  
//   // [print]：輸出結果。此時 unknownDomains 是一個 Iterable (abc.com, example.com)。
//   print('未知網域 (函數式): $unknownDomains');
// }

// /**
//  * [Version 1: Functional Style (函數式風格)]
//  * [Iterable<String>]：回傳型別，是一個延遲計算的字串序列。
//  * [=>]：胖箭頭運算子，用於單行表達式的回傳。
//  * [emails]：List 物件（資料源）。
//  */
// Iterable<String> getUnknownDomains(List<String> emails, List<String> knownDomains) => 
//   emails
//       // 1. [map]：轉換階段。將每個 email 變成其網域部分。
//       // - [email]：匿名函式參數。
//       // - [split('@').last]：字串切割並取最後一部分 (網域)。
//       // - 結果：傳回一個包含所有網域的 MappedIterable。
//       .map((email) => email.split('@').last)
      
//       // 2. [where]：過濾階段。接續上一步傳回的 Iterable 繼續處理。
//       // - [domain]：前一步產出的網域字串。
//       // - [!knownDomains.contains(domain)]：過濾邏輯 (Predicate)。
//       // - [contains]：檢查 domain 是否存在於已知清單中。
//       // - [!]：邏輯非 (Negation)，若不在清單中則保留。
//       .where((domain) => !knownDomains.contains(domain));

// /**
//  * [Version 2: Imperative Style (指令式風格)]
//  * [getUnknownDomains2]：相同的邏輯，但使用明確的控制流。
//  */
// Iterable<String> getUnknownDomains2(List<String> emails, List<String> knownDomains) {
//   // [result]：手動建立一個可變的「空清單」物件。
//   var result = <String>[]; 
  
//   // [for-in]：顯式迭代。
//   // [email]：由 Iterator 逐一取出的字串。
//   for (var email in emails) {
//     // [domain]：暫存變數，儲存切割後的結果。
//     final domain = email.split('@').last;
    
//     // [if]：手動控制判斷邏輯。
//     if (!knownDomains.contains(domain)) {
//       // [add]：副作用操作，修改 result 清單的狀態。
//       result.add(domain);
//     }
//   }
  
//   // [return]：傳回填寫完畢的實體清單。
//   return result;
// }

// /**
//  * 🔬 硬核機制解析：
//  * 1. [Method Chaining]：為什麼可以 .map().where()？ 
//  * 因為 map 回傳 Iterable，而 Iterable 類別剛好定義了 where 方法。
//  * 2. [Pipe Architecture]：這就像資料流經過濾水器。
//  * 第一層濾網 (map) 改變形狀，第二層濾網 (where) 決定留不留。
//  * 3. [Lazy vs Eager]：
//  * - 函數式版本是「延遲」的，只有在 print 時才會開始切字串。
//  * - 指令式版本是「立即」的，在 for 迴圈跑完時，記憶體裡已經佔好空間了。
//  */