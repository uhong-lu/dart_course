// Example of public variable and methods in Dart
class BankAccpunt{
  BankAccpunt(this.balance);
  double balance;       //public variable


void desposit(double amount){
  balance += amount;
}

void withdraw(double amount){
  if(balance > amount){
    balance -= amount;
  } 
}
}
void main(){
  final bankAccount = BankAccpunt(100);
  bankAccount.balance = 100000;
}