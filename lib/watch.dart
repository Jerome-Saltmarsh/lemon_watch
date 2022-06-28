
import 'dart:async';

class Watch<T> {
  // variables
  T _value;
  // immutables
  final StreamController<T> _controller = StreamController.broadcast();
  // properties
  T get value => _value;
  Stream<T> get stream => _controller.stream;

  /// Allows you to control the values which are allowed inside of this watch
  /// useful for clamping values etc
  T Function(T t)? clamp;

  bool isNullable<T>() => null is T;

  Watch(this._value, {
    void Function(T t)? onChanged,
    this.clamp,
  }){
    if (clamp != null){
        this._value = clamp!(_value);
    }
    if (onChanged != null){
      this.onChanged(onChanged);
    }
  }

  set value(T t){
    if (_value == t) return;

    if (clamp != null){
      t = clamp!(t);
    }
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