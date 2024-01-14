import 'package:bankapp/color/colors.dart';
import 'package:flutter/material.dart';

class Service_container extends StatelessWidget {
  final String imagename;
  final String title;
  final VoidCallback clik;
  const Service_container({
    super.key, required this.imagename, required this.title, required this.clik,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap:clik,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:20),
        child: Column(
          children: [
            Container(
              height:60,
              decoration:BoxDecoration(
                color:pallet.serviceColor,
                borderRadius:BorderRadius.circular(20)
                
              ),
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(imagename,color:pallet.secondaryColor,),
              ),
            ),
      
             SizedBox(
              height:5,
             ),
            Text(title,style:TextStyle(color:pallet.secondaryColor),)
          ],
        ),
      ),
    );
  }
}