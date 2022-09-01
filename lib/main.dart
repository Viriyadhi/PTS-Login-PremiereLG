import 'package:flutter/material.dart';
import 'common/app_theme_data.dart';
import 'ui/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Practice',
      theme: AppThemeData.getTheme(),
      home: const Login(),
    );
  }
}
