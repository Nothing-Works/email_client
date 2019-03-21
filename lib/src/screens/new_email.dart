import 'package:flutter/material.dart';

class NewEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New one'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Compose new message',
                style: Theme.of(context).textTheme.title),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context, 'Love');
                  },
                  child: Text('Love'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context, 'Hate');
                  },
                  child: Text('Hate'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
