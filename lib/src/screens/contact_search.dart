import 'package:flutter/material.dart';

import '../blocs/contacts_bloc/contact_bloc.dart';
import '../models/contact.dart';

class ContactSearch extends SearchDelegate {
  final ContactManager manager;

  ContactSearch(this.manager);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(onPressed: () {}, icon: Icon(Icons.clear))];
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
    return StreamBuilder<List<Contact>>(
        stream: manager.filteredContactList(query: query),
        builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              var contacts = snapshot.data;
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
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
