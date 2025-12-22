void main(){
  const x = -1;
  var maybeValue;
  if (x > 0) {
    maybeValue = x;
  }
  maybeValue ??= 0; 
  final value = maybeValue;  
  print(value);
}