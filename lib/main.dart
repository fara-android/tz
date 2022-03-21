import 'package:flutter/material.dart';
import 'package:tz/screens/auth/auth_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: AuthScreen(),
    );
  }
}
