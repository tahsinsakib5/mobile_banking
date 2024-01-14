
import 'package:bankapp/color/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String button_text;
  final VoidCallback ontapp;
  const CustomButton({
    
    super.key, required this.button_text, required this.ontapp,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed:ontapp,child:Container(
      height:50,
      width:MediaQuery.of(context).size.width*0.90,
      decoration: BoxDecoration(
        color:pallet.secondaryColor,
        borderRadius:BorderRadius.circular(10)
        
      ),
            
      child:Center(child: Text(button_text,style: TextStyle(color:Colors.white,fontSize:16),)),
    ),);
  }
}