import 'package:flutter/material.dart';

import './screens/calendar.dart';
import './screens/contact.dart';
import './screens/home_page.dart';

class EmailApp extends StatefulWidget {
  @override
  _EmailAppState createState() => _EmailAppState();
}

class _EmailAppState extends State<EmailApp> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.indigo, accentColor: Colors.red),
      home: Scaffold(
          body: <Widget>[
            HomePage(title: 'Email App'),
            ContactPage(),
            CalendarPage()
          ].elementAt(_selectedIndex),
          bottomNavigationBar:
              BottomNavigationBar(items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.mail), title: Text('Inbox')),
            BottomNavigationBarItem(
                icon: Icon(Icons.people), title: Text('Contact')),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), title: Text('Calendar'))
          ])),
    );
  }
}
