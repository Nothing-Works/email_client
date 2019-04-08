import 'package:email_client/src/models/email.dart';
import 'package:email_client/src/repositories/email_repositories.dart';
import 'package:email_client/src/widgets/drawer/email_drawer.dart';
import 'package:email_client/src/widgets/email_list_item.dart';
import 'package:email_client/src/widgets/new_button.dart';
import 'package:flutter/material.dart';

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
    return DefaultTabController(
      child: Scaffold(
        appBar: _appBar(),
        drawer: EmailDrawer(),
        body: TabBarView(
          children: <Widget>[
            Center(child: _futureBuilder('important')),
            Center(child: _futureBuilder('other'))
          ],
        ),
        floatingActionButton: NewButton(emails),
      ),
      length: 2,
    );
  }

  void _refresh() {
    setState(() {
      emails = EmailRepository.fetchAll();
    });
  }

  void _deleteAt(Email email) {
    setState(() {
      emails.then((value) {
        value.remove(email);
      });
    });
  }

  Widget _futureBuilder(String value) {
    return FutureBuilder<List<Email>>(
        future: emails,
        builder: (BuildContext context, AsyncSnapshot<List<Email>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.none:
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.done:
              return snapshot.hasError
                  ? Text("${snapshot.error}")
                  : _listView(snapshot, value);
          }
        });
  }

  Widget _listView(AsyncSnapshot<List<Email>> snapshot, String value) {
    var list = [];
    value == 'important'
        ? list = snapshot.data
        : list = snapshot.data.reversed.toList();

    return ListView.separated(
      itemCount: list.length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (BuildContext context, int index) =>
          EmailItem(list[index], _deleteAt),
    );
  }

  Widget _appBar() {
    return AppBar(
      title: Text(widget.title),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.refresh), onPressed: _refresh)
      ],
      bottom: TabBar(
        tabs: <Widget>[Tab(text: 'Important'), Tab(text: 'Other')],
      ),
    );
  }
}
