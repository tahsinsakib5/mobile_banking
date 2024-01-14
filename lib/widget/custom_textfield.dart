import 'dart:async';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String texttitle;
  final String hinrtitle;
  // final ControllerCallback? controlar;
  var controller;
  CustomTextField({
    super.key,
    required this.hinrtitle,
    // this.controlar,
    this.controller,
    required this.texttitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 40),
          child: Text(
            texttitle,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.90,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(12),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: hinrtitle,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
