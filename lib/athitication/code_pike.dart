

import 'package:bankapp/athitication/login_page.dart';

import 'package:bankapp/widget/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Codepicar extends StatefulWidget {
  final String verifiacationId;
  Codepicar({super.key, required this.verifiacationId});

  @override
  State<Codepicar> createState() => _CodepicarState();
}

class _CodepicarState extends State<Codepicar> {
  final TextEditingController codecrolar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 35),
            child: Text(
              "Veryfy Code",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.90,
                child: TextField(
                  controller: codecrolar,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                      isDense: true,
                      contentPadding: const EdgeInsets.all(12),
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      filled: true,
                      hintText: "Code"),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          CustomButton(
            button_text: "Login",
            ontapp: ()async{
              final credamcial = PhoneAuthProvider.credential(
                  verificationId: widget.verifiacationId,
                  smsCode: codecrolar.text);

                 try{
                     await FirebaseAuth.instance.signInWithCredential(credamcial);
                    await Navigator.push(context,MaterialPageRoute(builder: (context) =>LoginPage(),));
                   
                 }catch(e){
                  print("something wrong");
                 }
               
              
                  
            },
          )
        ],
      ),
    );
  }
}
