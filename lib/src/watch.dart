
import 'dart:async';

class Watch<T> {
  T _value;
  final StreamController<T> _controller = StreamController.broadcast();
  T get value => _value;
  Stream<T> get stream => _controller.stream;

  /// Gets called before a value is set, allows control over the range of values allowed
  T Function(T t)? clamp;

  // bool isNullable<T>() => null is T;

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

  StreamSubscription onChanged(void Function(T t) function) =>
    stream.listen(function);
}