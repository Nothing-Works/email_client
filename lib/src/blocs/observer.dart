import 'package:flutter/material.dart';

class Observer<T> extends StatelessWidget {
  @required
  final Stream<T> stream;
  final Function onError;
  @required
  final Function onSuccess;
  final Function onWaiting;
  const Observer({this.onError, this.onSuccess, this.stream, this.onWaiting});

  Function get _defaultOnWaiting =>
      (context) => Center(child: CircularProgressIndicator());

  Function get _defaultOnError => (context, error) => Text(error);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
          if (snapshot.hasError) {
            return (onError != null)
                ? onError(context, snapshot.error)
                : _defaultOnError(context, snapshot.error);
          }
          if (snapshot.hasData) {
            T data = snapshot.data;
            return onSuccess(context, data);
          } else {
            return (onWaiting != null)
                ? onWaiting(context)
                : _defaultOnWaiting(context);
          }
        });
  }
}
