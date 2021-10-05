import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _numberAccountController =
      TextEditingController();

  final TextEditingController _nameController = TextEditingController();
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Contact"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              style: const TextStyle(fontSize: 24.0),
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Full Name",
                hintText: "",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _numberAccountController,
                style: const TextStyle(fontSize: 24.0),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Account Number",
                  hintText: "",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: const Text("Create"),
                  onPressed: () => _criaContact(context),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _criaContact(BuildContext context) {
    final Contact contact = Contact(
        name: _nameController.text,
        accountNumber: int.parse(_numberAccountController.text));
    _dao.save(contact).then((value) => Navigator.pop(context));
  }
}
