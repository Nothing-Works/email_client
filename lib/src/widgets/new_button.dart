import 'package:email_client/src/screens/new_email.dart';
import 'package:flutter/material.dart';

class NewButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        String backMessage = await Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => NewEmail()));

        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text('Your message was $backMessage')));
      },
      child: Icon(Icons.add),
    );
  }
}
