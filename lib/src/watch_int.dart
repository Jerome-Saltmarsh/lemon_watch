import 'watch.dart';

class WatchInt extends Watch<int> {

  WatchInt(int value, {int? min, int? max}) :super(value, clamp: (int value){
    if (min != null && value < min) {
      return min;
    }
    if (max != null && value > max){
      return max;
    }
    return value;
  });

  void increment(){
    value++;
  }

  void decrement(){
    value--;
  }

  void toggleSign(){
    value = -value;
  }
}