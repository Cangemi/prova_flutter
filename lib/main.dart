// Usruários para teste: 'name 1' até 'name 10'
// Senha para teste: 'pass1' até 'pass10'

import 'package:flutter/material.dart';
import 'screens/login.dart';

void main() async {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: login(),
  ));
}