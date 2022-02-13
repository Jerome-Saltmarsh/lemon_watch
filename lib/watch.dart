
import 'dart:async';

class Watch<T> {
  // variables
  T _value;
  // immutables
  final StreamController<T> _controller = StreamController.broadcast();
  // properties
  T get value => _value;
  Stream<T> get stream => _controller.stream;

  Watch(this._value, {
    void Function(T t)? onChanged
  }){
    if (onChanged != null){
      this.onChanged(onChanged);
    }
  }

  set value(T t){
    if (_value == t) return;
    _value = t;
    _controller.add(value);
  }

  void call(T t){
    value = t;
  }

  StreamSubscription onChanged(void Function(T t) function){
    return stream.listen((event) {
      function(event);
    });
  }

  bool get isNull => value == null;
  bool get isNotNull => value != null;
}