import 'contact.dart';

class Transaction {
  late final double value;
  late final Contact contact;

  Transaction(
    this.value,
    this.contact,
  );

  Transaction.fromJson(Map<String, dynamic> json)
      : value = json['value'],
        contact = Contact.fromJson(json['contact']);

  Map<String, dynamic> toJson() =>
      {'value': value, 'contact': contact.toJson()};

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contact}';
  }
}
