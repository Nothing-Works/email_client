import 'package:email_client/src/blocs/contacts_bloc/contact_bloc.dart';
import 'package:email_client/src/provider.dart';
import 'package:flutter/material.dart';

import '../models/contact.dart';
import '../widgets/contact_list.dart';

class ContactSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(onPressed: () => query = '', icon: Icon(Icons.clear))];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Center(child: Text('Type at least 3 letters to search'));
    }
    return ContactList(
        stream: Provider.of<ContactManager>(context)
            .filteredContactList(query: query),
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
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
