void main(){
  // Map<String, String> person = 
  // Map<String, double> person = 
  // Map<String, dynamic> person =
  // var person = <String, dynamic>{};
  var person = {
    'name': 'Alice',
    'age': 20,
    // 'age': 30,
    // 'age': 40,
    'city': 'New York'
  };
  var name = person['name'];
  print(name);
  person['age'] = 25;
  print(person);
  person['country'] = 'USA';
  print(person);
}