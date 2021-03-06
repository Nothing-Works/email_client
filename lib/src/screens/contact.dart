import 'package:email_client/src/blocs/contact_bloc/contact_bloc.dart';
import 'package:email_client/src/provider.dart';
import 'package:email_client/src/widgets/contact_counter.dart';
import 'package:flutter/material.dart';

import './contact_search.dart';
import '../models/contact.dart';
import '../widgets/contact_list.dart';
import '../widgets/drawer/email_drawer.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ContactManager manager = Provider.of(context).fetch(ContactManager);
    manager.inFilter.add('');
    return Scaffold(
        appBar: AppBar(
          title: Text('Contacts'),
          actions: <Widget>[
            ContactCounter(),
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: ContactSearch());
                }),
            Padding(padding: EdgeInsets.only(right: 16))
          ],
        ),
        drawer: EmailDrawer(),
        body: ContactList(
            stream: manager.fetchContactList,
            builder: (BuildContext context, List<Contact> contacts) {
              return ListView.separated(
                  itemCount: contacts?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    var contact = contacts[index];
                    return ListTile(
                        leading: CircleAvatar(),
                        title: Text(contact.name),
                        subtitle: Text(contact.email));
                  },
                  separatorBuilder: (context, index) => Divider());
            }));
  }
}
