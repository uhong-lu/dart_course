// Example of private variable and methods in Dart in same file
class BankAccpunt{
  BankAccpunt(this._balance);
  double _balance;       //private variable


void desposit(double amount){
  _balance += amount;
}

void withdraw(double amount){
  if(_balance > amount){
    _balance -= amount;
  } 
}
}
void main(){
  final bankAccount = BankAccpunt(100);
  bankAccount._balance = 100000;
}