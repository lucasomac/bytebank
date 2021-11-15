import 'contact.dart';

class Transaction {
  late final double value;
  late final Contact contact;

  Transaction(
    this.value,
    this.contact,
  );

  Transaction.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    contact = Contact.fromJson(json['contact']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['contact'] = contact;
    return data;
  }

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contact}';
  }
}
