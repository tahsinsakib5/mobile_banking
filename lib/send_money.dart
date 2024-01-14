import 'package:bankapp/color/colors.dart';
import 'package:bankapp/widget/button.dart';
import 'package:bankapp/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

class Send_money extends StatelessWidget {


  const Send_money({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:pallet.secondaryColor,
      body: SafeArea(
        child: Column(
          children: [
              
              SizedBox(
                height: 30,
              ),
               Padding(
               padding: const EdgeInsets.only(left:80),
               child: Text("Wellcome to",style: TextStyle(color:pallet.primaryColor,fontSize:20),),
             ),
             Text("Mobile Bank",style:TextStyle(color:pallet.primaryColor,fontSize:33,fontWeight:FontWeight.w500),),

            Spacer(),
            Container(
              height:MediaQuery.of(context).size.height*0.73,
              width:double.infinity,
              decoration: BoxDecoration(
                color:pallet.primaryColor,
                borderRadius:BorderRadius.only(topLeft:Radius.circular(16),topRight:Radius.circular(16))
              ),
              child:Column(
                
                children: [
            
                   SizedBox(
                    height:60,
                   ),
                  CustomTextField(hinrtitle:"Type Number", texttitle:"Number"),
                  SizedBox(
                    height:12,
                  ),
                  CustomTextField(hinrtitle:"Type amount", texttitle:"Amonunt"),
                   SizedBox(
                    height:12,
                  ),
                   CustomTextField(hinrtitle:"Type your Password", texttitle:"Password"),
            
                   
                   Spacer(),
            
                   CustomButton(button_text:"Send Money", ontapp:() {
                     
                   },),
                  SizedBox(
                    height:60,
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}

