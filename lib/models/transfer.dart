class Transfer {
  final double value;
  final int accountNumber;

  @override
  String toString() {
    return 'Transfer{value: $value, accountNumber: $accountNumber}';
  }

  Transfer(this.value, this.accountNumber);
}
