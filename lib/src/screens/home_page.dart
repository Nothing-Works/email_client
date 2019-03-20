import 'dart:convert';

import 'package:email_client/src/models/email.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  final String title;
  HomePage({this.title});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Email> emails = <Email>[];

  Future loadEmails() async {
    var response =
        await http.get('http://www.mocky.io/v2/5c92093e32000074086bcc74');

    List list = jsonDecode(response.body);

    setState(() {
      emails = list.map((json) => Email.fromJson(json)).toList();
    });
  }

  @override
  void initState() {
    loadEmails();
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
            var email = emails[index];
            return ListTile(
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
        ),
      ),
    );
  }
}
