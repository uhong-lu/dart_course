void main(){
    var person = <String, dynamic>{
    'name': 'Alice',
    'age': 20,
    'city': 'New York',
  };
  var weight = person['weight'] ;
  print(weight); 
  if(weight == null){ 
    print('no value');
  }else{
    print(weight);
  }
}