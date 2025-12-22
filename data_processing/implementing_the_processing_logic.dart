import 'dart:io';

void main(List<String> arguments){
  if (arguments.isEmpty) {
    print('Usage: dart parsing_command_line_arguments.dart <inputFile.csv>');
    exit(1);
  } 
  final inputFile = arguments.first;
  final lines = File(inputFile).readAsLinesSync();
  final totalDurationByTag = <String, double>{};
  lines.removeAt(0); // Remove header line
  var totalDuration = 0.0;
  for (final line in lines) {
    final values = line.split(',');
    final durationStr = values[3].replaceAll('"', '');
    final duration = double.parse(durationStr);
    final tag = values[5].replaceAll('"','');
    final previousTotal = totalDurationByTag[tag] ;
    if (previousTotal == null) {
      totalDurationByTag[tag] = duration;
    } else {
      totalDurationByTag[tag] = previousTotal + duration;
    }
    totalDuration += duration;
  }
  for (var entry in totalDurationByTag.entries) {
    final duraionFormatted = entry.value.toStringAsFixed(1);
    final tag = entry.key == '' ? 'Unallocated' : entry.key;
    print('$tag: ${duraionFormatted}h');
  }
  print('Total for all tags: ${totalDuration.toStringAsFixed(1)}h');
}

// // 匯入 dart:io 函式庫，讓我們可以使用 File, exit 等與系統溝通的功能
// import 'dart:io';

// // 程式進入點，接收命令列參數 (arguments) 作為字串列表
// void main(List<String> arguments){
//   // 檢查參數列表是否為空，確保使用者有提供檔案名稱
//   if (arguments.isEmpty) {
//     // 如果沒有參數，印出正確的使用方法提示使用者
//     print('Usage: dart parsing_command_line_arguments.dart <inputFile.csv>');
//     // 以狀態碼 1 (錯誤) 強制結束程式，不再往下執行
//     exit(1);
//   } 
// }  
//   // 取得參數列表中的第一個元素，作為輸入檔案的名稱 (例如: data.csv)
//   final inputFile = arguments.first;
  
//   // 建立 File 物件並同步讀取檔案所有內容，將每一行作為字串存入 lines 列表
//   final lines = File(inputFile).readAsLinesSync();
  
//   // 建立一個空的 Map，用來儲存每個標籤 (Tag) 對應的總時數 (Duration)
//   // Key 是標籤名稱 (String)，Value 是累計時數 (double)
//   final totalDurationByTag = <String, double>{};
  
//   // 移除列表中的第一行，因為通常 CSV 第一行是標題 (Header)，不是我們要計算的數據
//   lines.removeAt(0); 
  
//   // 初始化一個變數，用來統計「所有標籤」的總時數，初始值為 0.0
//   var totalDuration = 0.0;
  
//   // 開始迴圈：遍歷 lines 列表中的每一行數據 (line)
//   for (final line in lines) {
//     // 使用逗號 (,) 將這一行字串切分成多個欄位，存入 values 列表
//     final values = line.split(',');
    
//     // 取得索引為 3 的欄位 (Duration)，並移除可能存在的雙引號 (")，確保是純數字字串
//     final durationStr = values[3].replaceAll('"', '');
    
//     // 將處理乾淨的字串轉換為雙精度浮點數 (double)，以便進行數學運算
//     final duration = double.parse(durationStr);
    
//     // 取得索引為 5 的欄位 (Tag)，同樣移除可能存在的雙引號 (")
//     final tag = values[5].replaceAll('"','');
    
//     // 嘗試從統計 Map (totalDurationByTag) 中取得該標籤目前的累計時數
//     // 如果該標籤還沒出現過，previousTotal 會是 null
//     final previousTotal = totalDurationByTag[tag];
    
//     // 判斷該標籤是否為第一次出現
//     if (previousTotal == null) {
//       // 如果是第一次出現 (null)，直接將目前的時數存入 Map
//       totalDurationByTag[tag] = duration;
//     } else {
//       // 如果已經存在，將舊的時數加上目前的時數，更新 Map 中的值
//       totalDurationByTag[tag] = previousTotal + duration;
//     }
    
//     // 不管是什麼標籤，都將時數加到「總計數器」中
//     totalDuration += duration;
//   }
  
//   // 數據處理完畢，開始輸出報告
//   // 遍歷 Map 中的每一個項目 (entry)，包含 Key (標籤) 和 Value (時數)
//   for (var entry in totalDurationByTag.entries) {
//     // 將時數 (Value) 格式化為小數點後 1 位的字串 (例如: 1.5)
//     final duraionFormatted = entry.value.toStringAsFixed(1);
    
//     // 處理空標籤：如果 Key 是空字串，顯示為 'Unallocated' (未分配)，否則顯示原標籤名
//     final tag = entry.key == '' ? 'Unallocated' : entry.key;
    
//     // 印出格式化後的報告：標籤名稱: 時數h
//     print('$tag: ${duraionFormatted}h');
//   }
  
//   // 最後印出所有標籤的總時數，同樣格式化為小數點後 1 位
//   print('Total for all tags: ${totalDuration.toStringAsFixed(1)}h');
