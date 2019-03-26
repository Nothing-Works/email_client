import 'package:email_client/src/models/email.dart';
import 'package:email_client/src/screens/email_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class EmailItem extends StatelessWidget {
  final Email email;
  final Future<List<Email>> emails;
  final int index;

  EmailItem(this.email, this.emails, this.index);

  void _goToDetail(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                EmailDetail(email.title, email.message)));
  }

  Widget _text(String value) {
    return Text(
      value,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: ListTile(
        onTap: () => _goToDetail(context),
        title: Text('${email.title}'),
        leading: CircleAvatar(child: Text('AS')),
        isThreeLine: true,
        subtitle: _text(email.message),
      ),
      key: ObjectKey(email.message),
      delegate: SlidableDrawerDelegate(),
      actionExtentRatio: 0.25,
      actions: <Widget>[
        IconSlideAction(
          caption: 'Archive',
          color: Colors.blue,
          icon: Icons.archive,
          onTap: () {},
        ),
        IconSlideAction(
          caption: 'Share',
          color: Colors.indigo,
          icon: Icons.share,
          onTap: () {},
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'More',
          color: Colors.black45,
          icon: Icons.more_horiz,
          onTap: () {},
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {},
        ),
      ],
    );
  }
}
