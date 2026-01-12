//給extension名字 : NumberParsing
extension NumberParsing on String{
  int? toIntOrNull() => int.tryParse(this);
}
