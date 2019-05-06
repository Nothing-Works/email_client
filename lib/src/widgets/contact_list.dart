import 'package:flutter/material.dart';

import '../models/contact.dart';

typedef Widget ContactBuilder(BuildContext context, List<Contact> contacts);

class ContactList extends StatelessWidget {
  final Stream stream;
  final ContactBuilder builder;
  const ContactList({this.builder, this.stream});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Contact>>(
        stream: stream,
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
