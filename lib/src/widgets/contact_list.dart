import 'package:flutter/material.dart';

import '../models/contact.dart';

class ContactList extends StatelessWidget {
  final Stream<List<Contact>> stream;
  final Function builder;
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
              var contacts = snapshot.data;
              return builder(context, contacts);
          }
        });
  }
}
