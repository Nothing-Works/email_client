import 'package:flutter/material.dart';

import '../mocks/email_mock.dart';
import '../models/email.dart';

class HomePage extends StatelessWidget {
  final String title;

  final List<Email> emails = EmailMock.fetchAll();

  HomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: emails.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('${emails[index].title}'),
              leading: CircleAvatar(
                child: Text('AS'),
              ),
              isThreeLine: true,
              subtitle: Text('${emails[index].message}'),
            );
          },
        ),
      ),
    );
  }
}
