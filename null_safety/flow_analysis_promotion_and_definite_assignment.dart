void main(){
  int x =10;
  int sign;     //法一 if/else statement，邏輯條件較複雜使用此方法
  // int sign = x >= 0 ? 1 : -1; 法二 三元運算子 (Ternary Operator)
  if (x >= 0){
    sign = 1;
  } else {
    sign = -1;
  }
  print(sign);
}