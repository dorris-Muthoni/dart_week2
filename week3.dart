
// 1. Encapsulation - A class that hides sensitive data using private variables and controlled access.
class BankAccount {
  // Private variables (Encapsulation)
  double _balance;
  String _accountHolder;

  // Constructor
  BankAccount(this._accountHolder, this._balance);

  // Getter for balance (Encapsulation)
  double get balance => _balance;

  // Setter for accountHolder (Encapsulation)
  set accountHolder(String name) {
    if (name.isNotEmpty) {
      _accountHolder = name;
    }
  }

  // Method to deposit money
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
    } else {
      print("Deposit amount must be positive.");
    }
  }

  // Method to withdraw money
  void withdraw(double amount) {
    if (amount <= _balance) {
      _balance -= amount;
    } else {
      print("Insufficient balance.");
    }
  }
}

// 2. Inheritance - A subclass that inherits properties and methods from the superclass.
class SavingsAccount extends BankAccount {
  // Additional property for SavingsAccount
  double interestRate;

  // Constructor
  SavingsAccount(String holder, double balance, this.interestRate) : super(holder, balance);

  // Method to calculate interest
  void calculateInterest() {
    double interest = balance * (interestRate / 100);
    print("Interest earned: \$${interest}");
  }
}

// 3. Polymorphism - Demonstrating method overriding where subclasses implement their own versions of the method.
class CurrentAccount extends BankAccount {
  // Constructor for CurrentAccount
  CurrentAccount(String holder, double balance) : super(holder, balance);

  // Overriding withdraw method for CurrentAccount
  @override
  void withdraw(double amount) {
    if (amount <= balance + 500) { // Overdraft allowed
      balance -= amount;
      print("Withdrawal successful. New balance: \$${balance}");
    } else {
      print("Exceeded overdraft limit.");
    }
  }
}

// 4. Abstraction - Abstract class with abstract methods that must be implemented in subclasses.
abstract class Account {
  String accountNumber;
  
  // Abstract method
  void displayAccountDetails();

  // Concrete method
  void showBalance(double balance) {
    print("Account balance: \$${balance}");
  }
}

class CheckingAccount extends Account {
  @override
  void displayAccountDetails() {
    print("This is a Checking Account with account number: $accountNumber");
  }
}

void main() {
  // Encapsulation: Using BankAccount class
  BankAccount account1 = BankAccount("John Doe", 5000);
  print("Initial Balance: \$${account1.balance}");
  account1.deposit(1500);
  account1.withdraw(3000);
  print("Final Balance: \$${account1.balance}");

  // Inheritance and Polymorphism: Using SavingsAccount and CurrentAccount
  SavingsAccount savings = SavingsAccount("Alice", 10000, 5);
  savings.calculateInterest();
  
  CurrentAccount current = CurrentAccount("Bob", 2000);
  current.withdraw(2500); // Should allow withdrawal with overdraft

  // Abstraction: Using CheckingAccount
  CheckingAccount checking = CheckingAccount();
  checking.accountNumber = "12345ABC";
  checking.displayAccountDetails();
  checking.showBalance(5000);
}
