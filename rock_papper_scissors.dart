import'dart:io';
import 'dart:math';

enum Move { rock, paper, scissors }
void main(){
  final rng = Random();
  while(true){
    stdout.write("Rock, papper or scissors (r/p/s) ");
    final input = stdin.readLineSync();
    if(input == 'r' || input == 'p' || input == 's'){
      var playerMove;
      if(input == 'r'){
        playerMove = Move.rock;
      } else if(input == 'p'){
        playerMove = Move.paper;
      } else {
        playerMove = Move.scissors;
      }
      final random = rng.nextInt(3);
      final  aiMove = Move.values[random];
      if(playerMove == aiMove){
        print("It's a tie! Both chose $aiMove");
      } else if((playerMove == Move.rock && aiMove == Move.scissors) ||
                (playerMove == Move.paper && aiMove == Move.rock) ||
                (playerMove == Move.scissors && aiMove == Move.paper)){
        print("You win! AI chose $aiMove");
      } else {
        print("You lose! AI chose $aiMove");
      }
    } else if(input == 'q'){
      break;
    } else {
      print("Invalid input, please try again.");
    }
  }
}