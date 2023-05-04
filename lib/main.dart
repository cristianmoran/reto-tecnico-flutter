import 'package:flutter/material.dart';
import 'package:reto_tecnico/src/di/dependencies_provider.dart' as di;

import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //DI
  di.init();

  runApp(MyApp());
}
