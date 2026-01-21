//program error -1<=0
// class PositiveInt{
//   const PositiveInt(this.value) : assert(value >= 0);
//   final int value;
// }

// void main(){
//   final invalidAge = PositiveInt(-1); 
//   print(invalidAge);
// }


//change assertion message //clear explanation is useful to other developers
// class PositiveInt{
//   const PositiveInt(this.value) : assert(value >= 0, 'Value must be positive');
//   final int value;
// }

// void main(){
//   final invalidAge = PositiveInt(-1); 
//   print(invalidAge);
// }

class PositiveInt{
  const PositiveInt(this.value) : assert(value >= 0, 'Value must be positive');
  final int value;
}

void main(){
  final invalidAge = PositiveInt(-1); 
  print(invalidAge);
}