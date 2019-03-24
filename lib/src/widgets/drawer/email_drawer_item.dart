import 'package:email_client/src/styles/email_drawer.dart';
import 'package:flutter/material.dart';

class EmailDrawerItem extends StatelessWidget {
  final String text;
  final String total;
  final IconData icon;

  const EmailDrawerItem({Key key, this.text, this.total, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      leading: Icon(icon),
      trailing: Chip(
          label: Text(total, style: drawerItemText),
          backgroundColor: drawerItemChipColor),
    );
  }
}
