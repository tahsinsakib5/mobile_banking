

import 'package:bankapp/widget/service_container.dart';
import 'package:flutter/material.dart';

class Resent_Service extends StatelessWidget {
  const Resent_Service({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
               Service_container(imagename:"assets/send_money.png",title:"Send money",clik:() {
                 
               },),
        
               Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Text("987779274739"),
                  Text("sakib")
                ],
               ),
              
              ],
            ),
             Text(" 089873877878")
          ],
        ),
      ),
    );
  }
}

