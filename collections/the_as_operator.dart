void main(){
  // var person = <String, dynamic>{
  //   'name': 'Alice',
  //   'age': 20,
  //   'city': 'New York'
  // };
  // var name = person['name'];
  // print(name);
    var person = <String, dynamic>{
    'name': 'Alice',
    'age': 20,
    'city': 'New York'
  };
  var name = person['name'] as String;
  //String  name = person['name'];
  print(name);
}