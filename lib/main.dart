import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(VoluntariosApp());
}

class VoluntariosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VoluntaRios',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}
