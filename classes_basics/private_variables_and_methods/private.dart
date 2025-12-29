// Example of private variable and methods in Dart
class BankAccpunt {
  BankAccpunt(this._balance);
  double _balance; //private variable  //we can declare things to be private at the file level
  double get balance => _balance; //public getter

  void desposit(double amount) {
    _balance += amount;
  }

  void withdraw(double amount) {
    if (_balance > amount) {
      _balance -= amount;
    }
  }
}
