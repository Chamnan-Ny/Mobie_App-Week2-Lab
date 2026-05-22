class BankAccount {
  final int accountId; 
  final String accountOwner; 
  double _balance; 

  BankAccount({
    required this.accountId,
    required this.accountOwner,
    double initialBalance = 0.0, 
  }) : _balance = initialBalance;

  double balance() {
    return _balance;
  }
  void withdraw(double amount) {
    if (amount <= 0) {
      throw Exception('Amount must be greater than 0');
    }
    if (_balance - amount < 0) {
      throw Exception(
        'Insufficient funds! Balance: \$$_balance, Tried to withdraw: \$$amount',
      );
    }
    _balance -= amount; 
    print('Withdrew \$$amount. New balance: \$$_balance');
  }

  void credit(double amount) {
    if (amount <= 0) {
      throw Exception('Amount must be greater than 0');
    }
    _balance += amount;
    print('Credited \$$amount. New balance: \$$_balance');
  }

  @override
  String toString() {
    return 'Account #$accountId | Owner: $accountOwner | Balance: \$$_balance';
  }
}
class Bank {
  final String bankName;
  final List<BankAccount> _accounts = []; 

  Bank({required this.bankName});

  BankAccount createAccount(int accountId, String accountOwner) {
    for (BankAccount acc in _accounts) {
      if (acc.accountId == accountId) {
        throw Exception('Account ID $accountId already exists!');
      }
    }

    final newAccount = BankAccount(
      accountId: accountId,
      accountOwner: accountOwner,
    );

    _accounts.add(newAccount);
    print('Account created: $newAccount');

    return newAccount; 
  }

  List<BankAccount> get accounts => _accounts;

  void showAllAccounts() {
    print('\n=== $bankName — All Accounts ===');
    if (_accounts.isEmpty) {
      print('No accounts yet.');
      return;
    }
    for (BankAccount acc in _accounts) {
      print(acc);
    }
  }
}
void main() {
  final myBank = Bank(bankName: 'ABA Bank Cambodia');

  final acc1 = myBank.createAccount(1001, 'John');
  final acc2 = myBank.createAccount(1002, 'Steven');

  acc1.credit(500.0);
  acc2.credit(1000.0); 

  acc1.withdraw(200.0); 

  myBank.showAllAccounts();

}
