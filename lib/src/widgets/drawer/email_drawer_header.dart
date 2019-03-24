import 'package:flutter/material.dart';

class EmailDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountEmail: Text('andy@gmail.com'),
      accountName: Text('Andy Song'),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(
            'https://avatars1.githubusercontent.com/u/18606648?s=460&v=4'),
      ),
      otherAccountsPictures: <Widget>[
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(title: Text('Adding new account...'));
                });
          },
          child: CircleAvatar(
            child: Icon(Icons.add),
          ),
        )
      ],
    );
  }
}
