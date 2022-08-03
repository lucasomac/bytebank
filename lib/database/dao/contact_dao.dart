import 'package:sqflite/sqflite.dart';

import '../../models/contact.dart';
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
    List<Contact> list = [];
    for (var element in results) {
      list.add(Contact.fromJson(element));
    }
    return list;
  }

  Future<int> update(Contact contact) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> contactMap = contact.toJson();
    return db.update(
      _tableName,
      contactMap,
      where: '$_idField = ?',
      whereArgs: [contact.id],
    );
  }

  Future<int> delete(int id) async {
    final Database db = await getDatabase();
    return db.delete(
      _tableName,
      where: '$_idField = ?',
      whereArgs: [id],
    );
  }
}
