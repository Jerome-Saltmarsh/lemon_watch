import 'watch.dart';

class WatchBool extends Watch<bool> {

  WatchBool(bool value) :super(value);

  void toggle(){
    value = !value;
  }

  void setFalse(){
    value = false;
  }

  void setTrue(){
    value = true;
  }
  
  void set(bool value){
    this.value = value;
  }
}
