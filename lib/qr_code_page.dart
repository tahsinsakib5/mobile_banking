import 'package:bankapp/color/colors.dart';
import 'package:flutter/material.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pallet.primaryColor,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height:250,
            width:MediaQuery.of(context).size.width,
            child:Image.asset("assets/qrcode.png",),
          )
        ],
      ),
    );
  }
}