import 'package:email_client/src/overseer.dart';
import 'package:email_client/src/screens/calendar.dart';
import 'package:flutter/material.dart';

import './provider.dart';
import './screens/contact.dart';
import './screens/home_page.dart';
import './ugly_provider.dart';

class EmailApp extends StatefulWidget {
  @override
  _EmailAppState createState() => _EmailAppState();
}

class _EmailAppState extends State<EmailApp> {
  void _setIndex(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Provider(
        data: Overseer(),
        child: UglyProvider(
            child: MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                    primarySwatch: Colors.indigo, accentColor: Colors.red),
                home: Scaffold(
                    body: <Widget>[
                      HomePage(title: 'Email App'),
                      ContactPage(),
                      CalendarPage()
                    ].elementAt(_selectedIndex),
                    bottomNavigationBar: BottomNavigationBar(
                        onTap: _setIndex,
                        currentIndex: _selectedIndex,
                        items: <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                              icon: Icon(Icons.mail), title: Text('Inbox')),
                          BottomNavigationBarItem(
                              icon: Icon(Icons.people), title: Text('Contact')),
                          BottomNavigationBarItem(
                              icon: Icon(Icons.calendar_today),
                              title: Text('Calendar'))
                        ])))));
  }
}
