import 'package:email_client/src/blocs/contacts_bloc/contact_bloc.dart';
import 'package:email_client/src/provider.dart';
import 'package:flutter/material.dart';

class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context);

    return StreamBuilder<int>(
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          return Chip(
              backgroundColor: Colors.red,
              label: Text('${snapshot.data ?? 0}',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)));
        },
        stream: manager.contactCounter);
  }
}
