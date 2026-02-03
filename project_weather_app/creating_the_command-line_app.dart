// first add a defensive check, make sure call this with at least one argument
void main(List<String> arguments) {
  if(arguments.length != 1){
    print('Syntax: dart bin/main.dart <city>');
    return;
  }
  final city = arguments.first;
  print(city);
}// terminal type 'dart bin/main.dart London' 
// pass an argument then the city name is printed