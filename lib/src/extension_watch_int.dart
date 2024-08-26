import 'watch.dart';

extension ExtensionWatchInt on Watch<int> {
  void increment() => value++;
  void decrement() => value--;
  void invertSign() => value = -value;
}