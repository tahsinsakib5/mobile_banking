

import 'package:bankapp/athitication/code_pike.dart';
import 'package:bankapp/widget/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MobileNumberLogin extends StatefulWidget {
  
  MobileNumberLogin();

  @override
  State<MobileNumberLogin> createState() => _MobileNumberLoginState();
}

class _MobileNumberLoginState extends State<MobileNumberLogin> {
  final TextEditingController MobileNumbercrolar = TextEditingController();

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
              "User Phone Number",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.90,
                child: TextField(
                  controller:MobileNumbercrolar,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                      isDense: true,
                      contentPadding: const EdgeInsets.all(12),
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      filled: true,
                      hintText: "Number"),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          CustomButton(
            button_text: "Send code",
            ontapp: ()async{
           
              singup();
                  
            },
          )
        ],
      ),
    );
  }
    Future singup() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber:MobileNumbercrolar.text,
                      verificationCompleted: (e) {
                        print(e);
                      },
                      verificationFailed: (e) {
                        print(e);
                      },
                      codeSent: (String verificationId, int? token) async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>Codepicar(verifiacationId:verificationId),
                            ));
                      },
                      codeAutoRetrievalTimeout: (e) {});
  
  }
}
