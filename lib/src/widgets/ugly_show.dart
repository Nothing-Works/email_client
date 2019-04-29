import 'package:email_client/src/ugly_provider.dart';
import 'package:flutter/material.dart';

class UglyShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Center(child: Text(UglyProvider.of(context).counter.toString()));
}
