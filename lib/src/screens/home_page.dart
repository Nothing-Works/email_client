import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String title;
  HomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('Title $index'),
              leading: CircleAvatar(
                child: Text('AS'),
              ),
              isThreeLine: true,
              subtitle: Text(
                  'sub title which is very very long and everyone can see it and read it'),
            );
          },
        ),
      ),
    );
  }
}
