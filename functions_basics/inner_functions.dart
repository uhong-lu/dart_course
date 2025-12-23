const global = 15;
void main(){
  const a =10;
  print(global);
  print(a);
  void foo(int b){ //inner function IT IS DEFINED A LOCAL SCOPE
  print(global);
  print(b);
  print(a); //this function now has access to enclosing scope
  }  
  foo(20);
}


