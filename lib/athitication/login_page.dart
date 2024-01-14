import 'package:bankapp/athitication/mobil_number_login.dart';
import 'package:bankapp/color/colors.dart';
import 'package:bankapp/home_page.dart';
import 'package:bankapp/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final TextEditingController numbercontrolar = TextEditingController();
final TextEditingController passwordcontrolar = TextEditingController();
final TextEditingController lastnamecontrolar = TextEditingController();
final TextEditingController citycontrolar = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pallet.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),

              const Center(
                  child: Text(
                "SingUp",
                style: TextStyle(
                    color: pallet.secondaryColor,
                    fontSize: 35,
                    fontWeight: FontWeight.w500),
              )),
              const Center(
                  child: Text(
                "Mobile Bank",
                style: TextStyle(color: pallet.secondaryColor, fontSize: 17),
              )),
              const SizedBox(
                height: 40,
              ),
              //Numer one textfield
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "User Phone Number",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: TextField(
                    controller: numbercontrolar,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none),
                        isDense: true,
                        contentPadding: const EdgeInsets.all(12),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Number"),
                  ),
                ),
              ),

              const SizedBox(
                height: 12,
              ),
              //Number tow text field
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "User Frist Name",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: TextField(
                    controller: passwordcontrolar,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none),
                        isDense: true,
                        contentPadding: const EdgeInsets.all(12),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Type Frist name"),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // NUnmber three texfield
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "User Last Name",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none),
                        isDense: true,
                        contentPadding: const EdgeInsets.all(12),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Type Last name"),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // Number fore textfield
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "User City",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: TextField(
                    controller: citycontrolar,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none),
                        isDense: true,
                        contentPadding: const EdgeInsets.all(12),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Type your City"),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              CustomButton(
                button_text: "Sing in",
                ontapp: () async {
                  print(numbercontrolar.text);

                  await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: numbercontrolar.text,
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
                              builder: (context) => MobileNumberLogin(
                                  verifiacationId: verificationId),
                            ));
                      },
                      codeAutoRetrievalTimeout: (e) {});

                  //  String? userid = await singup();
                  //  if(userid!=null){
                  //   Map<String,dynamic>data ={
                  //     "user_amount":200,
                  //     "user_name":numbercontrolar.text,
                  //     "name":passwordcontrolar.text,
                  //      "city":citycontrolar.text,
                  //   };
                  //   await userdata(userid, data);
                  //  }
                  //   await Navigator.push(context,DialogRoute(context: context, builder:(context) =>HomePage()));
                },
              ),

              IconButton(
                  onPressed: () {
                    // FirebaseAuth.instance.signOut();

                    Navigator.push(
                        context,
                        DialogRoute(
                            context: context,
                            builder: (context) => const HomePage()));
                  },
                  icon: const Icon(Icons.abc_sharp))
            ],
          ),
        ),
      ),
    );
  }

  Future singup() async {
    var userid = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: numbercontrolar.text, password: passwordcontrolar.text);

    return userid.user!.uid;
  }

  Future userdata(String uid, Map<String, dynamic> data) async {
    await FirebaseFirestore.instance.collection("User_data").doc(uid).set(data);
  }
}
