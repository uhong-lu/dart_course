// --- CSV 處理邏輯虛擬碼 (Pseudocode) ---

// 1. 讀取輸入檔案的所有行
// lines = readFile(inputFile)

// 2. 移除第一行（標題行，例如：Date, Duration, Tag...）
// lines.removeAt(0)

// 3. 建立一個空的 Map 來儲存每個標籤的總時數
// totalDurationByTag = {}

// 4. 逐行處理剩餘的數據
// for (line in lines) {
// 將每一行按逗號拆分成一個個數值
// values = line.split(',')

// 提取我們要的資訊：時數 (Duration) 與 標籤 (Tag)
// 假設時數在第 4 欄 (index 3)，標籤在第 6 欄 (index 5)
// duration = double.parse(values[3])
// tag = values[5]

// 累加該標籤的總時數
// 如果標籤還不存在，預設從 0 開始加
// totalDurationByTag[tag] = (totalDurationByTag[tag] ?? 0) + duration
// }

// 5. 處理完畢後，印出最後的統計報告
// for (entry in totalDurationByTag.entries) {
// print('${entry.key}: ${entry.value.toStringAsFixed(1)}h')
// }