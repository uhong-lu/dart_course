void main(){
  const addBlue = false;
  const addRed = true;
  const addExtraColors = true;
  final colors =[
    'grey',
    'brown',
    if(addBlue)
      'blue',
    if(addRed)
      'red',
    if(addExtraColors)  
      ... ['yellow', 'green'], 
  ];
  print(colors);
  const ratings = [4.0, 4.5, 3.5];
  final restaurants = {
    'name' : 'Pizza Mario' ,
    'cuisine' : 'Italian',
    if (ratings.length > 2) ...{
      'ratings' : ratings,
      'isPopular' : true,
    }
  };
  print(restaurants);
}
