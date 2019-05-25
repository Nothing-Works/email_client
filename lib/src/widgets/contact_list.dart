import 'package:email_client/src/blocs/observer.dart';
import 'package:flutter/material.dart';

import '../models/contact.dart';

typedef Widget ContactBuilder(BuildContext context, List<Contact> contacts);

class ContactList extends StatelessWidget {
  final Stream stream;
  final ContactBuilder builder;
  const ContactList({this.builder, this.stream});
  @override
  Widget build(BuildContext context) {
    return Observer<List<Contact>>(
        onWaiting: (context) => LinearProgressIndicator(),
        stream: stream,
        onSuccess: (context, data) => builder(context, data));
  }
}
