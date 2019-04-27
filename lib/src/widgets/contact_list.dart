import 'package:email_client/src/blocs/contacts_bloc/contact_bloc.dart';
import 'package:email_client/src/provider.dart';
import 'package:flutter/material.dart';

import '../models/contact.dart';

typedef Widget ContactBuilder(BuildContext context, List<Contact> contacts);

class ContactList extends StatelessWidget {
  final String query;
  final ContactBuilder builder;
  const ContactList({this.builder, this.query});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Contact>>(
        stream: _stream(Provider.of<ContactManager>(context)),
        builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              return builder(context, snapshot.data);
          }
        });
  }

  Stream<List<Contact>> _stream(ContactManager manager) => query == null
      ? manager.contactListNow
      : manager.filteredContactList(query: query);
}
