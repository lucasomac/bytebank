class Transfer {
  final double value;
  final int accountNumber;

  @override
  String toString() {
    return 'Transferencia{valor: $value, numeroConta: $accountNumber}';
  }

  Transfer(this.value, this.accountNumber);
}
