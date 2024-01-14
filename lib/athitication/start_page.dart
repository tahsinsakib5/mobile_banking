import 'package:bankapp/athitication/login_page.dart';
import 'package:bankapp/color/colors.dart';
import 'package:bankapp/widget/button.dart';
import 'package:flutter/material.dart';

class Start_page extends StatelessWidget {
  const Start_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:pallet.primaryColor,
      body:SafeArea(
        child: Column(
          children: [
            SizedBox(
              height:140,
            ),
             Padding(
               padding: const EdgeInsets.only(left:80),
               child: Text("Wellcome to",style: TextStyle(color:pallet.secondaryColor,fontSize:20),),
             ),
             Text("Mobile Bank",style:TextStyle(color:pallet.secondaryColor,fontSize:33,fontWeight:FontWeight.w500),),
             Spacer(),
            CustomButton(button_text:"Login",ontapp: () {
              Navigator.push(context, DialogRoute(context: context, builder:(context) =>LoginPage(),));
            },),
            SizedBox(
              height:20,
            ),
             CustomButton(button_text:"Create Acount",ontapp: () {
               
             },),
             SizedBox(
              height:40,
             ),
          ],
        ),
      ),
    );
  }
}
