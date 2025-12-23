// void main() {
//   const multiplier = 10;
//   const list = [1, 2, 3];
//   final result = list.map((x) => x * multiplier);
//   print(result);
// }

//展開來看 X 跟 multiplier scope
//when we declare an anonymous function that uses some variables that are dsfined outside its own scope then that function is called a closure
void main(){
  const multiplier = 10;
  const list = [1, 2, 3];
  final result = list.map((x){
    return x * multiplier;
  });
  print(result);
}
//in practical terms this is quite a subtle distinction 'closure' 'anonymous function'