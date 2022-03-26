
import 'dart:async';


typedef void Changed<T>(T value, T previous);

class StreamData<T> {
   T value;
   T previous;
   StreamData(this.value, this.previous);
}

class AdvancedWatch<T> {
  // state
  final StreamController<StreamData<T>> _controller = StreamController.broadcast();

  late StreamData<T> state;

  // properties
  Stream<StreamData<T>> get stream => _controller.stream;

  AdvancedWatch(T _value, {
    Changed? onChanged
  }){
    state = StreamData(_value, _value);
    if (onChanged != null) {
      listen(onChanged);
    }
  }
  
  T get value => state.value;

  set value(T t){
    if (state.value == t) return;
    state.previous = state.value;
    state.value = t;
    _controller.add(state);
  }

  StreamSubscription listen(Function changed){
    return stream.listen((StreamData<T> state){
      changed(state.value, state.previous);
    });
  }
}


