import 'package:email_client/src/blocs/contacts_bloc/contact_bloc.dart';
import 'package:email_client/src/provider.dart';
import 'package:flutter/material.dart';

import '../models/contact.dart';

typedef Widget ContactBuilder(BuildContext context, List<Contact> contacts);

class ContactList extends StatelessWidget {
  final ContactBuilder builder;
  const ContactList({this.builder});

  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context);

    return StreamBuilder<List<Contact>>(
        stream: manager.contactListNow,
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
}
