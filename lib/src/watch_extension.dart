
import 'package:flutter/material.dart';
import 'package:lemon_watch/lemon_watch.dart';

extension WatchExtension<T> on Watch<T> {
  Widget build(Widget Function(T t) builder) => WatchBuilder(this, builder);
}