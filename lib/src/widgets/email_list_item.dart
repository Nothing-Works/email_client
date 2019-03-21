import 'package:email_client/src/models/email.dart';
import 'package:email_client/src/screens/email_detail.dart';
import 'package:flutter/material.dart';

class EmailItem extends StatelessWidget {
  final Email email;

  EmailItem(this.email);

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
    return ListTile(
      onTap: () => _goToDetail(context),
      title: Text('${email.title}'),
      leading: CircleAvatar(child: Text('AS')),
      isThreeLine: true,
      subtitle: _text(email.message),
    );
  }
}
