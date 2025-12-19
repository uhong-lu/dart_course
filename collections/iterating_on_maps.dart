void main(){
    var person = <String, dynamic>{
    'name': 'Alice',
    'age': 20,
    'city': 'New York',
  };
  // for(var item in person){}
  for(var key in person.keys){
    print(key);
    print(person[key]);
  }
  for(var value in person.values){
    print(value);
  }
  for(var entry in person.entries){
    print('${entry.key}: ${entry.value}');
  }
}