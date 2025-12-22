import 'dart:io';

void main(List<String> arguments){
  if (arguments.isEmpty) {
    print('Usage: dart parsing_command_line_arguments.dart <inputFile.csv>');
    exit(1);
  } 
  final inputFile = arguments.first;
  final lines = File(inputFile).readAsLinesSync();
  for (final line in lines) {
    print(line);
  }
}