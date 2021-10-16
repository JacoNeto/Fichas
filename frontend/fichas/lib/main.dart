import 'package:fichas/app.dart';
import 'package:flutter/material.dart';

void main() {
  // needed to initialize runApp with FireBase
  WidgetsFlutterBinding.ensureInitialized();

  runApp(Fichas());
}
