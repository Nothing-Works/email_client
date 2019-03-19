import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../mocks/email_mock.dart';
import '../models/email.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({this.title});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Email> emails = EmailMock.fetchAll();

  List<Email> messages = <Email>[];

  Future<List<Email>> loadEmails() async {
    String content = await rootBundle.loadString('data/message.json');
    List list = json.decode(content);

    List<Email> emails = list.map((json) => Email.fromJson(json)).toList();

    return emails;
  }

  @override
  void initState() {
    loadEmails().then((onValue) {
      messages = onValue;
    });
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
          itemCount: messages.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('${messages[index].title}'),
              leading: CircleAvatar(
                child: Text('AS'),
              ),
              isThreeLine: true,
              subtitle: Text(
                '${messages[index].message}',
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
