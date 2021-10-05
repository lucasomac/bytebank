import 'package:bytebank/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(
          'CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, accountNumber INTEGER)');
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );

  // return getDatabasesPath().then((dbPath) {
  //   final String path = join(dbPath, 'bytebank.db');
  //   return openDatabase(
  //     path,
  //     onCreate: (db, version) {
  //       db.execute(
  //           'CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, accountNumber INTEGER)');
  //     },
  //     version: 1,
  //     onDowngrade: onDatabaseDowngradeDelete,
  //   );
  // });
}

Future<int> save(Contact contact) async {
  final Database db = await getDatabase();
  return db.insert('contacts', contact.toJson());
}

Future<List<Contact>> findAll() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> results = await db.query('contacts');
  List<Contact> lista = [];
  for (var element in results) {
    lista.add(Contact.fromJson(element));
  }
  return lista;

  // return db.query('contacts').then((data) {
  //   List<Contact> lista = [];
  //   for (var element in data) {
  //     lista.add(Contact.fromJson(element));
  //   }
  //   return lista;
  // });
}
