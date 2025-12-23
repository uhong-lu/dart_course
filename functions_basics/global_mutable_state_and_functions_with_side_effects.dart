var counter = 1;//mutable global state it will affect all the code that reads that variable
                //Andrew says never do this in real code
const bitsInByte = 8; //Named global constants are better than hardcoded values
//counter is mutable and can change at runtime
//bitsInByte is immutable and cannot change at runtime this make it safe to use it inside this program


void foo(){
  print('*' * counter);
  counter++; //has side effect , it modifies the contents of a variable that is declared outside its own scope.
             //not pure function
}

void main(){
  const kilobit = 1024 * bitsInByte; 
  const megabit = 1024 * kilobit; 
  foo(); //call function in the same way but get a different result each time
  foo();
  foo();
}