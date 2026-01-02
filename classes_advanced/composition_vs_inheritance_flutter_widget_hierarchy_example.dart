abstract class Widget{}

class Text extends Widget {
  Text(this.text);
  final String text;
}

class Button extends Widget {
  Button({required this.child, this.onPressed});
  final Widget child;
  final void Function()? onPressed;
}


void main(){
  final button = Button(
    child: Text('Hello'),
    onPressed: () => print('Button Pressed'),
  );
}

//bottom line: compoosition and inheritance are both very important.
// you can use composition to model has-a relationships, use inheritance to model is-a relationships.


// // [abstract class]: 抽象類別。
// // 1. 定義了一個「概念」而非實體。你不能直接用 Widget() 來建立物件，因為「一個 Widget」是什麼並沒有定義清楚。
// // 2. 它是所有 UI 元件的「祖先」。
// abstract class Widget {}


// // ---------------------------------------------------------
// // Case A: 葉節點元件 (Leaf Widget) - Text
// // ---------------------------------------------------------

// // [extends Widget]: 繼承。
// // 意義：Text "是一個 (is-a)" Widget。它繼承了 Widget 的所有特性（雖然這裡 Widget 是空的）。
// class Text extends Widget {
  
//   // [Constructor]: 構造函式。
//   // [Text(this.text)]: 這是 Dart 的 "this shorthand syntax" (this 簡寫語法)。
//   // 1. 它定義了一個位置參數 (Positional Argument)。
//   // 2. 當你呼叫 Text('Hello') 時，'Hello' 會自動被賦值給下方的 text 屬性。
//   // 3. 這省去了寫 "text = text" 的冗長步驟。
//   Text(this.text);

//   // [final String text]: 成員變數 (Property)。
//   // 1. [final]: 表示不可變 (Immutable)。Flutter 的 Widget 設定好後就不應該被修改，若要改變畫面，應建立新的 Widget。
//   // 2. [String]: 儲存要顯示的文字內容。
//   final String text;
// }

// // ---------------------------------------------------------
// // Case B: 容器/組合元件 (Composite Widget) - Button
// // ---------------------------------------------------------

// // [extends Widget]: Button 也 "是一個" Widget。
// class Button extends Widget {
  
//   // [Named Parameters]: 具名參數 ({...})。
//   // 使用大括號 {} 包裹參數，呼叫時必須寫出參數名稱 (如 child: ...)，這在 Flutter 中是標準寫法，增加可讀性。
//   Button({
//     required this.child, // [required]: 必填。按鈕裡面一定要有東西，不然無法顯示。
//     this.onPressed,      // 選填。如果沒傳入，預設為 null (通常代表按鈕為禁用狀態)。
//   });

//   // [Composition Key Point (組合的關鍵)]:
//   // 這裡的 child 屬性型別是 Widget。
//   // 意義：Button "擁有一個 (has-a)" Widget。
//   // 這就是「組合」。我們不繼承 Text 來做按鈕，而是讓按鈕「持有」一個 Text (或其他 Widget)。
//   final Widget child;

//   // [Function Type]: 函式型別定義。
//   // 1. [void]: 這個函式執行完不回傳任何值。
//   // 2. [Function()]:這是一個函式，且不接受任何參數。
//   // 3. [?]: Nullable。代表這個變數可以是 null (也就是使用者可能沒設定點擊事件)。
//   final void Function()? onPressed;
// }

// void main() {
//   // [Instantiation]: 實例化。建立一個 Button 物件。
//   final button = Button(
    
//     // [Composition in Action (組合實戰)]:
//     // 我們將一個 Text 物件 (Text('Hello')) 傳遞給 Button 的 child 參數。
//     // 這就像是把積木 (Text) 嵌在另一個積木 (Button) 上面。
//     // 優勢：如果明天你想把文字換成圖片，只要傳入 Image(...) 即可，不用修改 Button 的程式碼。
//     child: Text('Hello'),

//     // [Anonymous Function]: 匿名函式 (Lambda)。
//     // [() => ...]: 胖箭頭語法。當按鈕被按下時，執行箭頭後的指令。
//     // 這整段邏輯被當作一個「物件」傳給了 onPressed 參數。
//     onPressed: () => print('Button Pressed'),
//   );
// }
// ```

// ---

// ### 🎓 初學者筆記總結

// #### 1. Inheritance (繼承) vs. Composition (組合)
// * **繼承 (`extends`)**：
//     * **關係**：**Is-a** (它是一個...)。
//     * **例子**：`Button extends Widget`。
//     * **目的**：定義規範與身分。所有的 UI 元件在骨子裡都必須是 `Widget`，這樣 Flutter 框架才認得它們，才能把它們畫在螢幕上。
//     * **Flutter 的限制**：通常只繼承一層（直接繼承自 Widget 或 StatelessWidget/StatefulWidget）。

// * **組合 (`child` 屬性)**：
//     * **關係**：**Has-a** (它擁有一個...)。
//     * **例子**：`Button` has a `child` (which is a `Text`)。
//     * **目的**：**彈性與擴充**。
//     * **為什麼 Flutter 愛用組合？**
//         如果用繼承，想要一個紅色的按鈕，你得寫 `RedButton`；想要一個有圖案的紅色按鈕，你得寫 `ImageRedButton`。這會導致「類別大爆炸」。
//         用組合的話，你只要這樣寫：
//         ```dart
//         Container( // 紅色
//           color: Colors.red,
//           child: Button( // 按鈕
//             child: Image(...) // 圖片
//           )
//         )