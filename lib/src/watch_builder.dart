
import 'package:flutter/widgets.dart';

import 'watch.dart';

class WatchBuilder<T> extends StatelessWidget {
  final Watch<T> watch;
  final Widget Function(T t) builder;

  WatchBuilder(this.watch, this.builder);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: watch.stream,
      initialData: watch.value,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        return builder(snapshot.data as T);
      },
    );
  }
}
