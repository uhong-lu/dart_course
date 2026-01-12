// Case1: Defines an extension on List<int> to add a sum method
// extension IterableX on List<int> {
//   int sum() => reduce((value, element) => value + element);
// }

// void main() {
//   final sum = [1,2,3].sum(); 
//   print(sum);
// }

// Case2: Defines an extension on List<num> to deal with both int and double
// extension IterableX on List<num> {
//   num sum() => reduce((value, element) => value + element);
// }

// void main() {
//   final sum1 = [1.0,2.0,3.0].sum(); 
//   final sum = [1,2,3].sum(); 
//   print(sum);
// }

// in case2: if we want to have more specific return types based on the input type, need a generic type constraint
// void main() {
//   double sum1 = [1.0,2.0,3.0].sum(); 
//   int sum = [1,2,3].sum(); 
//   print(sum);
// }

// Case3: Defines an extension with a generic type constraint to return specific types
extension IterableX<T extends num> on Iterable<T> {
  T sum() => reduce((value, element) => (value + element) as T);
  }

void main() {
  double sum1 = [1.0,2.0,3.0].sum(); 
  int sum = [1,2,3].sum(); 
  print(sum);
  print(sum1);
}
