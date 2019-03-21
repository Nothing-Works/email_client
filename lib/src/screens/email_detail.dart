import 'package:flutter/material.dart';

class EmailDetail extends StatelessWidget {
  final String title;
  final String message;

  EmailDetail(this.title, this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Text(message),
      ),
    );
  }
}
