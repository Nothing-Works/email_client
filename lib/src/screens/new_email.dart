import 'package:email_client/src/models/email.dart';
import 'package:flutter/material.dart';

class NewEmail extends StatefulWidget {
  @override
  _NewEmailState createState() => _NewEmailState();
}

class _NewEmailState extends State<NewEmail> {
  String to;
  String subject;
  String body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New one'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: TextField(
                onChanged: (value) {
                  to = value;
                },
                decoration: InputDecoration(
                    labelText: 'To',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            ListTile(
              title: TextField(
                onChanged: (value) {
                  subject = value;
                },
                decoration: InputDecoration(
                    labelText: 'Subject',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Divider(),
            ListTile(
              title: TextField(
                onChanged: (value) {
                  body = value;
                },
                maxLines: 9,
                decoration: InputDecoration(
                    labelText: 'Body',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            ListTile(
              title: RaisedButton(
                onPressed: () {
                  Navigator.pop(context, Email(message: body, title: subject));
                },
                child: Text('Send'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
