import 'package:firebase_core/firebase_core.dart';
import 'package:bankapp/athitication/start_page.dart';
import 'package:bankapp/home_page.dart';
import 'package:bankapp/qr_code_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}
