import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

class ContactDao {
  static const String tableSql =
      'CREATE TABLE $_tableName($_idField INTEGER PRIMARY KEY, $_nameField TEXT, $_accountNumberField INTEGER)';
  static const String _tableName = 'contacts';
  static const String _idField = 'id';
  static const String _nameField = 'name';
  static const String _accountNumberField = 'accountNumber';

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    return db.insert(_tableName, contact.toJson());
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> results = await db.query(_tableName);
    List<Contact> lista = [];
    for (var element in results) {
      lista.add(Contact.fromJson(element));
    }
    return lista;
  }
}
