
void main(){
  const name = 'Alice';
  const age = 30;
  print ('My name is $name and I am $age years old.');//如果在大型的專案 重複用print 遇到要更改格式很麻煩
  describe(name, age);
  const name2 = 'Lucy';
  const age2 = 25;
  print ('My name is $name2 and I am $age2 years old.');
  describe(name2, age2);
  describe('Howard', 23) ;// 只要是正確的參數型態 就可以直接帶入 不需要先宣告
}

void describe(String name, int age){
  print ('My name is $name and I am $age years old.');
}