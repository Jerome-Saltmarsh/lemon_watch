# Getting Started
Lemon watch is state management solution. 
The example below is an implementation of the default flutter counter app using lemon watch.

# Example
``` dart
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lemon_watch/src.dart';

// add lemon_watch: ^1.1.0 dependency to pubspec.yaml

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final count = Watch(0, clamp: (int value) => min(value, 10));

  MyApp({super.key}) {
    count.onChanged(onCountChanged);
  }

  void onCountChanged(int value){
     print("onCountChanged($value)");
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Lemon Watch Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lemon Watch Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:'
              ),
              WatchBuilder(count, (countValue) => Text(
                '$countValue',
                style: Theme.of(context).textTheme.headlineMedium,
              )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => count.value++,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
}
```