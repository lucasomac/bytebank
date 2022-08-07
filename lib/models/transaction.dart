import 'contact.dart';

class Transaction {
  late final String id;
  late final double? value;
  late final Contact contact;

  Transaction(
    this.id,
    this.value,
    this.contact,
  );

  Transaction.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        value = json['value'],
        contact = Contact.fromJson(json['contact']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'value': value, 'contact': contact.toJson()};

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contact}';
  }
}
