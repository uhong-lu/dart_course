void main(){
  const addBlue = false;
  const addRed = true;
  const extraColors = ['yellow', 'green'];
  final colors =[
    'grey',
    'brown',
    if(addBlue)
      'blue',
    if(addRed)
      'red',
      for(var color in extraColors)
      color, //法二collection for
  ];
  colors.addAll(extraColors); //法一 addAll()把list加到其他list
  print(colors);
}
