const global = 15;// global scope can be accessed anywhere
//global scopes can declare functions enumerations and other types

void main() { // a scope is a block of code that is defined inside curly braces,and can contain multiple statements
  const a = 10; // lexical scope
  print(a);
  if(a>5){
    const b = 5;
    print(b);
    const a = 5; //we can declare multiple variables with the same name in different scopes,dart will always use the variable that is defined in the closest scope
    print(a); // a is defined in the parent scope
  }
  //print(b); // This will cause an error because 'b' is not defined in this scope
}