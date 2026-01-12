
import 'number_parsing.dart';

void main(){
  int.tryParse('123');
  '123'.toIntOrNull(); //String class dont have to int or null
  '456'.toIntOrNull();
}

