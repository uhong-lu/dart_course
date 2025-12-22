// Rewrite this code so that the shoppingList variable is initialized using collection-if, collection-for or spreads, and the program output is the same.
void main() {
  const apples = 6;
  const bananas = 5;
  const addGrains = true;
  final shoppingList = {
    if (apples > 0)
      'apples': apples,
    if (bananas > 0)
      'bananas': bananas,
    if (addGrains) ...{
      'pasta': '500g',
      'rice': '1kg',
    }
  };
  print(shoppingList);
}