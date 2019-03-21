import 'package:email_client/src/models/email.dart';
import 'package:email_client/src/repositories/email_repositories.dart';
import 'package:email_client/src/screens/email_detail.dart';
import 'package:email_client/src/screens/new_email.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  HomePage({this.title});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Email>> emails;

  void _refresh() {
    setState(() {
      emails = EmailRepository.fetchAll();
    });
  }

  Widget _listView(AsyncSnapshot<List<Email>> snapshot) {
    var list = snapshot.data;
    return ListView.separated(
      itemCount: list.length,
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        var email = list[index];
        return ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        EmailDetail(email.title, email.message)));
          },
          title: Text('${email.title}'),
          leading: CircleAvatar(
            child: Text('AS'),
          ),
          isThreeLine: true,
          subtitle: Text(
            '${email.message}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    emails = EmailRepository.fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: _refresh)
        ],
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => NewEmail()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
