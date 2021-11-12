
import 'package:flutter/widgets.dart';

import 'watch.dart';

class WatchBuilder<T> extends StatelessWidget {
  final Watch<T> value;
  final Widget Function(T? t) builder;

  WatchBuilder(this.value, this.builder);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: value.stream,
      initialData: value.value,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        return builder(snapshot.data);
      },
    );
  }
}