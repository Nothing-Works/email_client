import 'dart:convert';

import 'package:email_client/src/models/email.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  final String title;
  HomePage({this.title});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Email> emails = <Email>[];

  Future<List<Email>> loadEmails() async {
    List list = json.decode(await rootBundle.loadString('data/message.json'));

    return list.map((json) => Email.fromJson(json)).toList();
  }

  @override
  void initState() {
    loadEmails().then((onValue) => emails = onValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: emails.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('${emails[index].title}'),
              leading: CircleAvatar(
                child: Text('AS'),
              ),
              isThreeLine: true,
              subtitle: Text(
                '${emails[index].message}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        ),
      ),
    );
  }
}
