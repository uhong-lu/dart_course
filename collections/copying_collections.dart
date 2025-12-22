void main(){
  final list = [1, 2, 3];
  final copy1 = list; //實際上是創造一個新的reference指向同一個collection
  copy1[0] = 0;
  final copy2 = [...list ];  //創造一個新的collection並複製內容
  copy2[2] = 4;
  print(list); // Output: [0, 2, 3]
  print(copy1); // Output: [0, 2, 3]
  print(copy2); // Output: [0, 2, 4]
}