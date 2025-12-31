import 'package:equatable/equatable.dart';

class Point extends{
  const Point(this.x, this.y);
  final int x;
  final int y;


  @override
  String toString() => 'Point($x, $y)';

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;
  @override
  bool operator ==(covariant Point other) {
    return x == other.x && y == other.y;
  }

  Point operator +(Point other) {
    return Point(x + other.x, y + other.y);
  }

  Point operator *(int other) {
    return Point(x * other, y * other);
  }
}

void main() {
  // make this compile by overriding the + operator
  print(Point(1, 1) + Point(2, 0)); // should print: Point(3, 1)
  // make this compile by overriding the * operator
  print(Point(2, 1) * 5); // should print: Point(10, 5)
}








// 這份 `Object` 類別的原始碼是 Dart 語言的靈魂，它定義了所有物件最底層的行為。其中 `hashCode` 是一個非常深奧且重要的概念。

// 以下為你整理出關於 `hashCode` 最完整的介紹，分為**概念、運算原理、規則、以及實作技巧**四個維度。

// ---

// ### 一、 什麼是 `hashCode`？ (基本概念)

// `hashCode`（雜湊碼）是一個 **整數 (int)**，它代表了一個物件在某一時刻的「數位指紋」。

// * **它的用途**：主要用於**快速尋找**。在 `HashMap`（鍵值對）或 `HashSet`（集合）中，電腦不會一個一個比對物件是否相等，而是先看 `hashCode` 把物件丟進不同的「桶子 (Buckets)」裡，藉此大幅提升搜尋速度。
// * **搜尋效率比較**：
// * **一般 List**：搜尋一個東西要從頭看到尾（時間複雜度 ）。
// * **Hash 集合**：先算 `hashCode` 直接跳到目標位置（平均時間複雜度 ）。



// ---

// ### 二、 `hashCode` 與 `==` 的神聖契約 (The Contract)

// 在原始碼中，`Object` 類別強調了一條鐵律：**如果你覆寫了 `==` 運算子，你就「必須」同時覆寫 `hashCode`。**

// 這兩者之間有一套不可違背的邏輯：

// 1. **若 A == B 為真**：那麼 `A.hashCode` **必須等於** `B.hashCode`。
// * *原因*：如果兩個人被判定是同一個人（相等），但他們被丟進不同的桶子（hashCode 不同），那 `Map` 就會找不到他們。


// 2. **若 A.hashCode == B.hashCode**：兩者**不一定**相等（這稱為「雜湊碰撞 Collision」）。
// * *原因*：就像兩個人剛好同姓（同一桶子），但他們不一定是同一個人。這時 `Map` 會在同一個桶子內進一步用 `==` 來確認。


// 3. **若 A != B**：`hashCode` 最好不同，但相同也合法。
// * *提示*：雜湊碰撞越少，效能就越好。



// ---

// ### 三、 原始碼中的 `hashCode` 實作方式

// 從你提供的原始碼中，我們可以看到三種處理 `hashCode` 的方式：

// #### 1. 預設行為 (Identity)

// ```dart
// external int get hashCode;

// ```

// * `external` 代表這是在 Dart 虛擬機 (VM) 底層實作的。
// * **預設規則**：每個物件的 `hashCode` 是根據它在記憶體中的唯一身分產生的。除非是同一個實體，否則 `hashCode` 幾乎不會重複。

// #### 2. 多欄位組合：`Object.hash` (新版 Dart 2.14+)

// 當你的類別有很多個欄位需要參與比較時，原始碼提供了 `static int hash(...)` 方法：

// ```dart
// static int hash(Object? object1, Object? object2, ...) { ... }

// ```

// 它會把傳進去的參數（最多 20 個）依照順序進行複雜的位元運算，回傳一個合併後的雜湊值。

// #### 3. 集合處理：`Object.hashAll` 與 `hashAllUnordered`

// * **`hashAll`**：適合 `List`。順序不同，結果就不同。
// * **`hashAllUnordered`**：適合 `Set`。只要內容物一樣，順序不同也會回傳相同的 `hashCode`。

// ---

// ### 四、 常見的陷阱 (Pitfalls)

// 1. **使用非 final 欄位計算 hashCode**：
// 如果你在物件建立後修改了影響 `hashCode` 的變數，那麼這個物件在 `Set` 或 `Map` 中就會變成「失蹤人口」，因為它算出來的桶子位置變了，但它人還在舊的桶子裡。
// 2. **效能低落的實作**：
// 如果你寫 `int get hashCode => 1;`（所有物件都回傳 1），這是合法的，但這會讓你的 `Map` 變成一個普通的 `List`，搜尋效能從  慘跌到 。
// 3. **忘記同步**：
// 覆寫了 `==` 卻沒覆寫 `hashCode`。這會導致兩個內容完全一樣的物件，無法在 `Set` 中被去重。

// ### 🚀 總結

// `hashCode` 是為了讓物件能被**高效地分類與檢索**。在 Dart 中，請記住這個口訣：**「要平等 (`==`)，就要同碼 (`hashCode`)；要防呆，就用 `Object.hash`。」**








// Dart Object 類別：原始碼註釋翻譯與核心筆記

// Object 是 Dart 中除了 null 以外所有類別的基石。以下將原始碼中的重要註釋翻譯為中文，並整理出開發者必須掌握的「硬核」筆記。

// 1. 類別總體定義 (Class Definition)

// 原始註釋翻譯：
// 「除了 null 之外，所有 Dart 物件的基類。因為 Object 是非空類別層級結構的根，所以每個非 Null 的 Dart 類別都是 Object 的子類。當你定義一個類別時，你應該考慮覆寫 toString 以返回描述該類別實例的字串。」

// 💡 核心筆記：

// 絕對繼承：在 Dart 中，你不需要寫 extends Object，系統會自動幫你加上。

// Null 的例外：在 Null Safety 之後，Object 代表「不為空的萬物」。

// 2. 相等運算子 (operator ==) 的四條戒律

// 原始註釋翻譯：
// 「預設行為是只有當兩個物件是『同一個物件』時才返回 true。覆寫此方法時，必須遵循『等價關係』，包含：」

// 全體性 (Total)：必須對所有引數返回布林值，絕不能拋出錯誤。

// 自反性 (Reflexive)：對於任何物件 o，o == o 必須為真。

// 對稱性 (Symmetric)：若 o1 == o2 為真，則 o2 == o1 也必須為真。

// 傳遞性 (Transitive)：若 o1 == o2 且 o2 == o3 為真，則 o1 == o3 必須為真。

// 💡 核心筆記：

// 一致性：除非物件被修改，否則比較的結果在一段時間內應該保持不變。

// 連動義務：原始碼明確要求：「若覆寫了 ==，就必須覆寫 hashCode」。

// 3. 雜湊碼 (hashCode) 的運作邏輯

// 原始註釋翻譯：
// 「雜湊碼是一個代表物件狀態的整數，會影響 == 的比較。預設的雜湊碼僅代表物件的『身分 (Identity)』。如果覆寫了 == 以使用物件狀態，則雜湊碼也必須更改以代表該狀態，否則該物件將無法用於 Set 和 Map 等基於雜湊的資料結構。」

// 💡 核心筆記：

// 碰撞 (Collision)：不相等的物件允許擁有相同的 hashCode，但如果碰撞太頻繁，會降低 HashMap 的效率（從 $O(1)$ 退化到 $O(n)$）。

// 同步性：相等的物件（== 為 true）絕對要有相同的 hashCode。

// 4. toString 與 noSuchMethod

// 原始註釋翻譯：

// toString：「提供物件的文字表示，主要用於偵錯 (Debugging) 或記錄 (Logging)。」

// noSuchMethod：「當存取不存在的方法或屬性時觸發。類別可以覆寫此方法，以為無效的動態調用提供自定義行為（例如 Mock 物件）。」

// 💡 核心筆記：

// noSuchMethod 只有在變數型別為 dynamic 時才會被觸發。

// 5. 現代雜湊工具 (Static Hash Methods)

// 這是 Dart 2.14 之後新增的強大工具，原始碼中展示了三種計算方式：

// A. Object.hash (合併固定數量的變數)

// 原始註釋：「通過數值組合每個引數的 hashCode。這保證了在單次程式執行期間的一致性。」

// 筆記：它能處理最多 20 個參數，甚至連 null 也能正確處理。

// B. Object.hashAll (順序相關的集合)

// 原始註釋：「按疊代順序合併元素的雜湊碼。hashAll([o]) 的結果不等於 o.hashCode。」

// 筆記：如果你有一個 List 且順序很重要，請用這個。

// C. Object.hashAllUnordered (順序無關的集合)

// 原始註釋：「以獨立於順序的方式合併元素的雜湊碼。」

// 筆記：如果你在處理 Set（集合內容一樣但順序可能不同），這能確保算出相同的雜湊值。

// 💎 總結：原始碼給開發者的底層提醒

// 身分 vs 狀態：預設的 Object 只認「身分」（你在記憶體哪裡）；覆寫後的類別認「狀態」（你的資料內容）。

// 安全第一：operator == 絕不能噴錯（Never throw）。

// 效能關鍵：hashCode 的品質決定了 Map 和 Set 的執行速度。

// 不可變性建議：雖然原始碼沒明說，但 hashCode 最好只根據 final 欄位來計算，以維持一致性。