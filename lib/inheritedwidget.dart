import 'package:flutter/material.dart';

class MyInheritedWidget extends InheritedModel<int> {
  final MyCounterWidgetState? data;

  const MyInheritedWidget(
      {super.key, required super.child, required this.data});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) =>
      child != oldWidget;

  @override
  bool updateShouldNotifyDependent(
      covariant InheritedModel<int> oldWidget, Set<int> dependencies) {
    if (dependencies.contains(1)) return true;
    return false;
  }
}

class MyCounterWidget extends StatefulWidget {
  const MyCounterWidget({super.key, required this.child});

  final Widget child;

  static MyCounterWidgetState of(BuildContext context) {
    final MyCounterWidgetState? result =
        context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!.data;
    assert(result != null, "Context is not Found");
    return result!;
  }

  @override
  State<MyCounterWidget> createState() => MyCounterWidgetState();
}

class MyCounterWidgetState extends State<MyCounterWidget> {
  int _countValue = 0;

  int get countValue => _countValue;

  void incrementCounter() {
    setState(() {
      _countValue++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      data: this,
      child: widget.child,
    );
  }
}
