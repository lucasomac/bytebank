class Contact {
  int? id;
  String name = "";
  int accountNumber = 0;

  Contact({this.id, required this.name, required this.accountNumber});

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    accountNumber = json['accountNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['accountNumber'] = accountNumber;
    return data;
  }
}
