void main(){
  const list = [1, 2, 3];
  // foreach法
  // list.forEach((value) => print(value));
  list.forEach(print);//is valid  when you call forEach you can either define an anonymous function and pass it as an argument or you can pass an existing named function as an argument provided that it has a compatible type.
  //dart is implicitly passing the function argument that is provided by forEach to the print statement

  //for loop法
  for (var value in list) {
    print(value);
  }
}