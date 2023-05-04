

import 'package:flutter/material.dart';

class BlocProvider<T> extends InheritedWidget {
  const BlocProvider({
    Key? key,
    required this.child,
    required this.bloc,
  }) : super(key: key,child: child);

  final T bloc;
  final Widget child;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static T? of<T>(BuildContext context) {
    final BlocProvider<T>? provider = context.dependOnInheritedWidgetOfExactType();
    return provider?.bloc;
  }
}