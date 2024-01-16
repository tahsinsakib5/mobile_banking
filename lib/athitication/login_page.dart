
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

final TextEditingController Fristnamecontrolar = TextEditingController();
final TextEditingController lasnamecontrolar = TextEditingController();
final TextEditingController Professioncontrolar = TextEditingController();
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
                  "User Frist Name",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: TextField(
                    controller:Fristnamecontrolar,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none),
                        isDense: true,
                        contentPadding: const EdgeInsets.all(12),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Frist Name"),
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
                  "User Last Name",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: TextField(
                    controller:lasnamecontrolar,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none),
                        isDense: true,
                        contentPadding: const EdgeInsets.all(12),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Last name"),
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
                  "User Profesion",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: TextField(
                    controller:Professioncontrolar,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none),
                        isDense: true,
                        contentPadding: const EdgeInsets.all(12),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "PRofession"),
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
                 
                 try{
                     var uid =   FirebaseAuth.instance.currentUser!.phoneNumber;
                
                   if(uid!=null){
                    Map<String,dynamic>data ={
                      "user_amount":200,
                      "user_name":Fristnamecontrolar.text+lasnamecontrolar.text,
                      "Profassion":Professioncontrolar.text,
                       "city":citycontrolar.text,
                    };
                    await userdata(uid, data);
                   }
                    await Navigator.push(context,DialogRoute(context: context, builder:(context) =>HomePage()));
                 }catch(e){
                  print("some thing wrong");
                 }
                   
                   
            
                },
              ),

             
            ],
          ),
        ),
      ),
    );
  }



  Future userdata(String uid, Map<String, dynamic> data) async {
    await FirebaseFirestore.instance.collection("User_data").doc(uid).set(data);
  }
}
