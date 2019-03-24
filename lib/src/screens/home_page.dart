import 'package:email_client/src/models/email.dart';
import 'package:email_client/src/repositories/email_repositories.dart';
import 'package:email_client/src/widgets/email_list_item.dart';
import 'package:email_client/src/widgets/new_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  final String title;
  HomePage({this.title});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Email>> emails;

  @override
  void initState() {
    super.initState();
    emails = EmailRepository.fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      drawer: Drawer(
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
                  label:
                      Text('8', style: TextStyle(fontWeight: FontWeight.bold)),
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
                  label:
                      Text('9', style: TextStyle(fontWeight: FontWeight.bold)),
                  backgroundColor: Colors.blue[100]),
            ),
            ListTile(
              title: Text('Trash'),
              leading: Icon(FontAwesomeIcons.trash),
              trailing: Chip(
                  label:
                      Text('2', style: TextStyle(fontWeight: FontWeight.bold)),
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
      ),
      body: Center(
        child: FutureBuilder<List<Email>>(
            future: emails,
            builder:
                (BuildContext context, AsyncSnapshot<List<Email>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                case ConnectionState.done:
                  return snapshot.hasError
                      ? Text("${snapshot.error}")
                      : _listView(snapshot);
              }
            }),
      ),
      floatingActionButton: NewButton(emails),
    );
  }

  void _refresh() {
    setState(() {
      emails = EmailRepository.fetchAll();
    });
  }

  Widget _listView(AsyncSnapshot<List<Email>> snapshot) {
    var list = snapshot.data;
    return ListView.separated(
      itemCount: list.length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (BuildContext context, int index) => EmailItem(list[index]),
    );
  }

  Widget _appBar() {
    return AppBar(
      title: Text(widget.title),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.refresh), onPressed: _refresh)
      ],
    );
  }
}
