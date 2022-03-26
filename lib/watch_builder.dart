
import 'package:flutter/widgets.dart';
import 'advanced_watch.dart';

import 'watch.dart';

class WatchBuilder<T> extends StatelessWidget {
  final Watch<T> watch;
  final Widget Function(T t) builder;

  WatchBuilder(this.watch, this.builder);

  bool isNullable<T>() => null is T;

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

class NullableWatchBuilder<T> extends StatelessWidget {
  final Watch<T> watch;
  final Widget Function(T? t) builder;

  NullableWatchBuilder(this.watch, this.builder);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: watch.stream,
      initialData: watch.value,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        return builder(snapshot.data);
      },
    );
  }
}

Widget _buildEmpty(BuildContext context){
  return const SizedBox();
}


class AdvancedWatchBuilder<T> extends StatelessWidget {
  final AdvancedWatch<T> watch;
  final Widget Function(T value, T previous) builder;
  late final WidgetBuilder _nullBuilder;

  AdvancedWatchBuilder(this.watch, this.builder, {WidgetBuilder? nullBuilder}){
    _nullBuilder = nullBuilder ?? _buildEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StreamData<T>>(
      stream: watch.stream,
      initialData: watch.state,
      builder: (BuildContext context, AsyncSnapshot<StreamData<T>> snapshot) {
        final data = snapshot.data;
        if (data == null){
          return _nullBuilder(context);
        }
        return builder(data.value, data.previous);
      },
    );
  }
}