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

class _Send_moneyState extends State<Send_money> {


  var numberController = TextEditingController();
   var  amountController = TextEditingController();
    var passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pallet.secondaryColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 80),
              child: Text(
                "Wellcome to",
                style: TextStyle(color: pallet.primaryColor, fontSize: 20),
              ),
            ),
            const Text(
              "Mobile Bank",
              style: TextStyle(
                  color: pallet.primaryColor,
                  fontSize: 33,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Container(
                height: MediaQuery.of(context).size.height * 0.73,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: pallet.primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),

                        
                        IconButton(onPressed:() {
                          qrscren();
                        }, icon:Icon(Icons.qr_code,size:30,)),

                    CustomTextField(
                        
                        hinrtitle: "Type Number",
                        texttitle: "Number", controlar:numberController),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextField(
                        hinrtitle: "Type amount", texttitle: "Amonunt",controlar:numberController),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextField(
                        hinrtitle: "Type your Password", texttitle: "Password",controlar:numberController),
                    const Spacer(),
                    CustomButton(
                      button_text: "Send Money",
                      ontapp: () {
                       passwordController.text="sakib";
                      },
                    ),
                    const SizedBox(
                      height: 60,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

   Future <void> qrscren()async{
    var qescren = await FlutterBarcodeScanner.scanBarcode("#fff6666", "cancel",true ,ScanMode.QR);

    setState(() {
      numberController.text=qescren;
    });
   }
}