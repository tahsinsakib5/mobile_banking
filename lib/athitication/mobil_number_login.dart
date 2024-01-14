import 'package:bankapp/widget/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MobileNumberLogin extends StatefulWidget {
  final String verifiacationId;
   MobileNumberLogin({super.key, required this.verifiacationId});

  @override
  State<MobileNumberLogin> createState() => _MobileNumberLoginState();
}

class _MobileNumberLoginState extends State<MobileNumberLogin> {
 final TextEditingController codecrolar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
            Padding(
                padding: EdgeInsets.only(left:35),
                child: Text("Veryfy Code",style:TextStyle(fontSize:17,fontWeight:FontWeight.w500),),
              ),
              Padding(
               padding: const EdgeInsets.all(8.0),
               child: Center(
                 child: Container(
                  width:MediaQuery.of(context).size.width*0.90,
                   child: TextField(
                    controller:codecrolar,
                    decoration: InputDecoration(
                     border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:BorderSide.none
                     ),
                     isDense: true,
                           contentPadding: const EdgeInsets.all(12),
                     fillColor:Color.fromARGB(255, 255, 255, 255),
                     filled:true,
                     hintText:"Code"
                     
                   ),),
                 ),
               ),
             ),
             
             SizedBox(
              height:60,
             ),

             CustomButton(button_text:"Send Code", ontapp:() {
                final credamcial = PhoneAuthProvider.credential(verificationId:widget.verifiacationId, smsCode:codecrolar.text);
             },)

        ],
      ),
    );
  }
}