import 'package:email_client/src/models/email.dart';
import 'package:email_client/src/repositories/email_repositories.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  HomePage({this.title});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Email>> emails;

  @override
  void initState() {
    super.initState();
    emails = EmailRepository.fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<List<Email>>(
            future: emails,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var list = snapshot.data;
                return ListView.separated(
                  itemCount: list.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                  itemBuilder: (BuildContext context, int index) {
                    var email = list[index];
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
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}
