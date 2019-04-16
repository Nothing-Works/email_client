import 'package:flutter/material.dart';

import '../models/contact.dart';

typedef Widget ContactBuilder(BuildContext context, List<Contact> contacts);

class ContactList extends StatelessWidget {
  final Stream<List<Contact>> stream;
  final ContactBuilder builder;
  const ContactList({this.stream, this.builder});

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
