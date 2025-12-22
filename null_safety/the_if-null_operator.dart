void main(){
  int x = -1;
  int? maybeValue;
  if (x > 0) {
    maybeValue = x;
  }
  // int value = maybeValue == null ? 0 : maybeValue; 法一 ternary operator
  int value = maybeValue ?? 0 ;  //法二 if-null operator
  print(value);
}// when to use ! vs. ??
// Ans: If you have a default value that you want to assign this value or expression is null, then it makes sense to use the if-null operator. Instead, if you are sure that a value or expression will never be null at runtime.

//補充: augmented assignment with if-null operator
// void main(){
//   int x = -1;
//   int? maybeValue;
//   if (x > 0) {
//     maybeValue = x;
//   }
//   maybeValue ??= 0; 
//   int value = maybeValue;  
//   print(value);
// }