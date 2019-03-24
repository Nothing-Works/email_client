import 'package:email_client/src/models/email.dart';
import 'package:email_client/src/screens/new_email.dart';
import 'package:flutter/material.dart';

class NewButton extends StatelessWidget {
  final Future<List<Email>> emails;
  NewButton(this.emails);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        Email email = await Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => NewEmail()));

        emails.then((onValue) {
          onValue.add(email);
        });

        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text('${email.message} ${email.title} ')));
      },
      child: Icon(Icons.add),
    );
  }
}
