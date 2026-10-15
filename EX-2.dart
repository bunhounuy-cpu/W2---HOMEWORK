class BankAccount {
  final int _accountId;
  final String _accountName;
  double _balance;

  BankAccount(this._accountId, this._accountName) : _balance = 0;

  int get accountId => _accountId;
  String get accountName => _accountName;
  double get balance => _balance;

  void withdraw(double amount) {
    if (_balance < amount) {
      throw Exception('Insufficient balance for withdrawal!');
    }
    _balance -= amount;
  }

  void credit(double amount) {
    _balance += amount;
  }
}

class Bank {
  final String _name;
  final List<BankAccount> _accounts = [];

  Bank(this._name);

  BankAccount createAccount(int accountId, String accountName) {
    final bool exist = _accounts.any((e) => e.accountId == accountId);
    if (exist) throw Exception('Account with ID $accountId already exists!');
    BankAccount account = BankAccount(accountId, accountName);
    _accounts.add(account);
    return account;
  }
}

void main() {
  Bank myBank = Bank("CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
