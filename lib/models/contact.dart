class Contact {
  int? id;
  String name = "";
  int accountNumber = 0;

  Contact({this.id, required this.name, required this.accountNumber});

  Contact.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        accountNumber = json['accountNumber'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'accountNumber': accountNumber};
}
