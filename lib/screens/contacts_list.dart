import 'package:flutter/material.dart';

import '../components/progress.dart';
import '../database/dao/contact_dao.dart';
import '../models/contact.dart';
import 'contact_form.dart';
import 'transaction_form.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: FutureBuilder<List<Contact>?>(
        initialData: const [],
        future: _dao.findAll(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Contact>?> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return const Progress('Loading data...');
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data!;
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return _ContactItem(
                    contacts[index],
                    onClick: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              TransactionForm(contacts[index])));
                    },
                  );
                },
                itemCount: contacts.length,
              );
          }
          return const Center(
              child: Text('Temporary error. Please, try again later.'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                  MaterialPageRoute(builder: (context) => const ContactForm()))
              .then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;
  final Function onClick;

  const _ContactItem(
    this.contact, {
    Key? key,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
        title: Text(
          contact.name,
          style: const TextStyle(fontSize: 24),
        ),
        subtitle: Text(contact.accountNumber.toString(),
            style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
