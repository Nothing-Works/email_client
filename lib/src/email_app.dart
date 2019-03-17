import 'package:flutter/material.dart';

import './screens/home_page.dart';

class EmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blueGrey, accentColor: Colors.red),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
