import 'private.dart';
void main(){
  final bankAccount = BankAccpunt(100);
  // bankAccount._balance = 100000;    //not in same file
  bankAccount.desposit(100);
  // print(bankAccount._balance); //not in same file
  print(bankAccount.balance);
}