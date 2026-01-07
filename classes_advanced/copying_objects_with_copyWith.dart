class Credentials{
  const Credentials({this.email = '', this.password = ''} );
  final String email;
  final String password;


  Credentials copywith({
    String? email,
    String? password,
    }) {
      return Credentials(
        email: email ?? this.email,
        password: password ?? this.password,
      );
    }
  @override
  String toString() => 'Credentials(email: $email, password: $password)';
  }

void main() {
  const credentials = Credentials();

  final updated1 = credentials.copywith(email: 'me@example.com');
  print(updated1);
  final updated2 = updated1.copywith(password: 'new_password');
  print(updated2);
}





// 在 Flutter 開發中，我們經常使用 final 屬性來確保資料安全。但如果資料不能改，我們該怎麼更新它？答案就是 copyWith 模式：我們不修改舊的，而是拿舊的資料去印出一份新的。

// /**
//  * 主題：copyWith 方法與不可變物件更新
//  * 核心：Immutable (不可變) 物件一旦建立就不能改。要更新它，我們必須建立一個「副本 (Copy)」，
//  * 並在過程中替換掉我們想改的部分。
//  */

// // [class Credentials]：定義一個憑證類別，用來存帳號密碼。
// class Credentials {
//   // [const Constructor]：常數建構子。
//   // [this.email = '']：使用預設值，如果沒傳 email，預設為空字串。
//   const Credentials({this.email = '', this.password = ''});

//   // [final]：這些變數是「唯讀」的。一旦設定，這輩子都不能改。
//   final String email;
//   final String password;

//   // ---------------------------------------------------------
//   // 1. copyWith 方法：更新資料的魔法
//   // ---------------------------------------------------------

//   // [Credentials]：回傳型別。這個方法會吐出一個全新的 Credentials 物件。
//   // [copyWith]：方法名稱。這是 Flutter 社群的通用命名慣例。
//   // [{String? email, String? password}]：參數是「可為空」的。
//   //    - 如果你傳了 email，我就用你的。
//   //    - 如果你沒傳 (null)，我就沿用舊的。
//   Credentials copywith({
//     String? email,
//     String? password,
//   }) {
//     // [return Credentials(...)]：呼叫建構子，生產一個新物件。
//     return Credentials(
//       // [email: email ?? this.email]：這行是 copyWith 的靈魂！
//       //    - [email] (左邊)：新物件的 email 屬性。
//       //    - [email] (右邊)：參數傳進來的 email (可能是 null)。
//       //    - [??] (If-null)：如果是 null，就用右邊的值。
//       //    - [this.email]：舊物件原本的 email。
//       // 翻譯：如果你給了新 email，就用新的；不然就用舊的。
//       email: email ?? this.email,
      
//       // 同上邏輯。
//       password: password ?? this.password,
//     );
//   }

//   // [toString]：覆寫，讓我們 print 時能看到內容。
//   @override
//   String toString() => 'Credentials(email: $email, password: $password)';
// }

// void main() {
//   // ---------------------------------------------------------
//   // 2. 記憶體流動 (Memory Flow)
//   // ---------------------------------------------------------

//   // [Step 1: 初始狀態]
//   // 建立第一個物件 (假設地址為 0x001)。
//   // 內容：email='', password=''
//   const credentials = Credentials();
  
//   // [Step 2: 第一次更新]
//   // 呼叫 copywith。參數只給了 email。
//   // 邏輯：email 用新的 'me@example.com'，password 用舊的 ''。
//   // 結果：產生第二個物件 (0x002)。
//   // 變數 updated1 指向 0x002。
//   final updated1 = credentials.copywith(email: 'me@example.com');
//   print(updated1); // Credentials(email: me@example.com, password: )

//   // [Step 3: 第二次更新]
//   // 拿 0x002 來改。參數只給了 password。
//   // 邏輯：email 用舊的 (0x002 的 'me@example.com')，password 用新的 'new_password'。
//   // 結果：產生第三個物件 (0x003)。
//   final updated2 = updated1.copywith(password: 'new_password');
//   print(updated2); // Credentials(email: me@example.com, password: new_password)
  
//   // 💡 重點：原本的 credentials (0x001) 從頭到尾都沒變過！這就是不可變性。
// }