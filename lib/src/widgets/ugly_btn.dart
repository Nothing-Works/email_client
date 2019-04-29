import 'package:email_client/src/ugly_provider.dart';
import 'package:flutter/material.dart';

class UglyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FlatButton(
      onPressed: UglyProvider.of(context).increment, child: Icon(Icons.add));
}
