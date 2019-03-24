import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmailDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
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
                        return AlertDialog(
                            title: Text('Adding new account...'));
                      });
                },
                child: CircleAvatar(
                  child: Icon(Icons.add),
                ),
              )
            ],
          ),
          ListTile(
            title: Text('Inbox'),
            leading: Icon(FontAwesomeIcons.inbox),
            trailing: Chip(
                label:
                    Text('11', style: TextStyle(fontWeight: FontWeight.bold)),
                backgroundColor: Colors.blue[100]),
          ),
          ListTile(
            title: Text('Draft'),
            leading: Icon(FontAwesomeIcons.edit),
            trailing: Chip(
                label: Text('8', style: TextStyle(fontWeight: FontWeight.bold)),
                backgroundColor: Colors.blue[100]),
          ),
          ListTile(
            title: Text('Archive'),
            leading: Icon(FontAwesomeIcons.archive),
            trailing: Chip(
                label:
                    Text('21', style: TextStyle(fontWeight: FontWeight.bold)),
                backgroundColor: Colors.blue[100]),
          ),
          ListTile(
            title: Text('Sent'),
            leading: Icon(FontAwesomeIcons.paperPlane),
            trailing: Chip(
                label: Text('9', style: TextStyle(fontWeight: FontWeight.bold)),
                backgroundColor: Colors.blue[100]),
          ),
          ListTile(
            title: Text('Trash'),
            leading: Icon(FontAwesomeIcons.trash),
            trailing: Chip(
                label: Text('2', style: TextStyle(fontWeight: FontWeight.bold)),
                backgroundColor: Colors.blue[100]),
          ),
          Divider(),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(FontAwesomeIcons.cog),
              ),
            ),
          )
        ],
      ),
    );
  }
}
