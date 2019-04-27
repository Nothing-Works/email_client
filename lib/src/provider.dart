import 'package:flutter/material.dart';

class Provider<T> extends InheritedWidget {
  final T data;

  Provider({Key key, Widget child, this.data}) : super(key: key, child: child);

  static T of<T>(BuildContext context) {
    final type = _typeOf<Provider<T>>();
    return (context.inheritFromWidgetOfExactType(type) as Provider<T>).data;
  }

  static Type _typeOf<T>() => T;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
