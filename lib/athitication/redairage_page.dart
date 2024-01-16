
import 'package:bankapp/athitication/start_page.dart';
import 'package:bankapp/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RedairagePage extends StatelessWidget {
  const RedairagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder:(context, snapshot) {
      if(snapshot.hasData){
        return HomePage();
      }else{
        return StartPage();
      }
    },);
  }
}