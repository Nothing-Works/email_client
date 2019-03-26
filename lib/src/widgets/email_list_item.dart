import 'package:email_client/src/models/email.dart';
import 'package:email_client/src/screens/email_detail.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmailItem extends StatelessWidget {
  final Email email;
  final Future<List<Email>> emails;
  final int index;

  EmailItem(this.email, this.emails, this.index);

  void _goToDetail(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                EmailDetail(email.title, email.message)));
  }

  Widget _text(String value) {
    return Text(
      value,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      child: ListTile(
        onTap: () => _goToDetail(context),
        title: Text('${email.title}'),
        leading: CircleAvatar(child: Text('AS')),
        isThreeLine: true,
        subtitle: _text(email.message),
      ),
      key: ObjectKey(email.message),
      onDismissed: (DismissDirection direction) {
        emails.then((onValue) {
          onValue.removeAt(index);
        });
      },
      background: Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.centerRight,
        color: Colors.red[300],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.trash,
              color: Colors.white,
            ),
            SizedBox(height: 4),
            Text('Delete', style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }
}
