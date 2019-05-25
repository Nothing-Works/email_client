import 'package:email_client/src/blocs/contact_bloc/contact_bloc.dart';
import 'package:email_client/src/blocs/observer.dart';
import 'package:email_client/src/provider.dart';
import 'package:flutter/material.dart';

class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer<int>(
        onSuccess: (context, data) => Chip(
            backgroundColor: Colors.red,
            label: Text('${data ?? 0}',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))),
        stream: Provider.of(context).fetch(ContactManager).contactCounter);
  }
}
