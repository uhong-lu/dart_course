void main(){
  // var countries = {'Italy', 'UK', 'Russia'};
  // countries[0];
  // countries.elementAt(0);
  // countries.add('Iceland');
  // print(countries);
  // countries.add('Italy');
  // print(countries);
  // countries.remove('Italy');
  // print(countries);
  // countries.first;
  // countries.last;
  // countries.length;
  // countries.contains('UK');
  var euCountries = {'Italy', 'UK', 'Russia'};
  var asianCountries = { 'India', 'China', 'Russia'};
  print(euCountries.union(asianCountries));
  print(euCountries.intersection(asianCountries));
  print(euCountries.difference(asianCountries));
  print(asianCountries.difference(euCountries));
  for (var country in euCountries) {
    print(country);
  }
}