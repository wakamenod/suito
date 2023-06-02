enum TransactionType {
  income(value: incomeValue),
  expense(value: expenseValue);

  const TransactionType({required this.value});

  final int value;

  static const int incomeValue = 1;
  static const int expenseValue = 2;
}

extension TransactionTypeX on TransactionType {
  static TransactionType fromValue(int value) {
    switch (value) {
      case TransactionType.incomeValue:
        return TransactionType.income;
      case TransactionType.expenseValue:
        return TransactionType.expense;
      default:
        throw ArgumentError('Invalid TransactionType value');
    }
  }
}
