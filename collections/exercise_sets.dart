// Given two integer sets a and b, write a program to calculate the set of the elements that belong to either a or b, but not both.
// For example, given the following:
// const a = { 1, 3 };const b = { 3, 5 };
// The program should print {1, 5}.
// Then, calculate and print the sum of all the items in the resulting set.

void main() {
  const a = {1, 3};
  const b = {3, 5};
  var result = a.union(b).difference(a.intersection(b));
  print(result);
  var sum = 0;
  for (var item in result) {
    sum += item;
  }
  print(sum);
}

