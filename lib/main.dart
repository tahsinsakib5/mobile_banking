import 'package:bankapp/athitication/redairage_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:const FirebaseOptions( apiKey: "AIzaSyD_5AicChQmFiak9-ugNmL7mZahkrB7Nxg",
  authDomain: "againagain-5c676.firebaseapp.com",
  projectId: "againagain-5c676",
  storageBucket: "againagain-5c676.appspot.com",
  messagingSenderId: "750130826880",
  appId: "1:750130826880:web:a86edf0f8e9c124eb26065",
  measurementId: "G-1HLFMENMQE")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RedairagePage(),
    );
  }
}
