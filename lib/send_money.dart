import 'package:bankapp/color/colors.dart';
import 'package:bankapp/widget/button.dart';
import 'package:bankapp/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Send_money extends StatefulWidget {


  const Send_money({super.key});

  @override
  State<Send_money> createState() => _Send_moneyState();
}


final TextEditingController numbercontroller= TextEditingController();
final TextEditingController amountcontrolar= TextEditingController();
final TextEditingController passwordcontrolar= TextEditingController();

var controlaertest ="Wellcome to";
 

class _Send_moneyState extends State<Send_money> {
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
               child: Text(controlaertest,style: TextStyle(color:pallet.primaryColor,fontSize:20),),
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
                     IconButton(onPressed:() {
                       qrcodscane();
                     }, icon:Icon(Icons.qr_code,size:38,)),
                   SizedBox(
                    height:30,
                   ),
                  
                   

                  CustomTextField(hinrtitle:"Type Number", texttitle:"Number",controlar:numbercontroller,),
                  SizedBox(
                    height:12,
                  ),
                  CustomTextField(hinrtitle:"Type amount", texttitle:"Amonunt",controlar:numbercontroller),
                   SizedBox(
                    height:12,
                  ),
                   CustomTextField(hinrtitle:"Type your Password", texttitle:"Password",controlar:passwordcontrolar,),
            
                   
                   Spacer(),
            
                   CustomButton(button_text:"Send Money", ontapp:() {
                    
                     setState(() {
                        controlaertest="sakib";
                     });
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

   Future<void> qrcodscane()async{

    var qr_code = await FlutterBarcodeScanner.scanBarcode("#ff6666","Cencal", true,ScanMode.QR);
         if(!mounted)return;
         setState(() {
        qr_code=numbercontroller.text.toString();
         });
   }
}

