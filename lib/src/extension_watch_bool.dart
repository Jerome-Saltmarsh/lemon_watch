import 'watch.dart';

extension ExtensionWatchBool on Watch<bool> {
  void toggle() => value = !value;
  void setFalse() => value = false;
  void setTrue() => value = true;
}
