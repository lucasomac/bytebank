import 'package:bytebank/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, accountNumber INTEGER)');
      },
      version: 1,
      onDowngrade: onDatabaseDowngradeDelete,
    );
  });
}

Future<int> save(Contact contact) {
  return createDatabase().then((db) {
    return db.insert('contacts', contact.toJson());
  });
}

Future<List<Contact>> findAll() {
  return createDatabase().then((db) {
    return db.query('contacts').then((data) {
      List<Contact> lista = [];
      for (var element in data) {
        lista.add(Contact.fromJson(element));
      }
      return lista;
    });
  });
}