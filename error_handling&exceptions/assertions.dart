// take away: assertions make it easier to diagnose and fix programming errors in your code


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



//compile time error  //another advantage of creating compile time constants because we can spot assertion errors before we even run the program
// class PositiveInt{
//   const PositiveInt(this.value) : assert(value >= 0, 'Value must be positive');
//   final int value;
// }

// void main(){
//   const invalidAge = PositiveInt(-1); 
//   print(invalidAge);
// }


//use assertions anywhere in code and not just in constructors
// class PositiveInt{
//   const PositiveInt(this.value) : assert(value >= 0, 'Value must be positive');
//   final int value;
// }

// void signIn(String email, String password){
//   assert(email.isNotEmpty);
//   assert(password.isNotEmpty);
// }

// void main(){
//   signIn('','password123'); 
// }
//assertion can be useful because they help us catch programming errors early
//assertions contain a so-called 'stack trace' which shows us all the functions that were currently executing when the error occurred. This contains references to code that belongs to our project as well as code that lives inside the Dart SDK or any other party packages that we're using.
//Stack trace is very useful because we can click on these links and they take us exactly to the line of code where the error took place.
//if you're  working on a big project with a lot of files, you can use thie to locate the place where things went wrong, and you can fix your code.



//Dart and Flutter SDKs also contain assertions
class PositiveInt{
  const PositiveInt(this.value) : assert(value >= 0, 'Value must be positive');
  final int value;
}

void signIn(String email, String password){
  assert(email.isNotEmpty);
  assert(password.isNotEmpty);
}

void main(){
  const list = [1,2,3];
  print(list[4]);  //this will throw an error before even reaching the assertions in signIn function
  signIn('','password123'); 
}
//Step1 get an error
//Step2 look at the stack trace
//Step2 locate the line that caused the error
//errors are subclasses of class Error


///Read!
// Eorror //ctrl + right click
