import 'package:bankapp/athitication/login_page.dart';
import 'package:bankapp/color/colors.dart';
import 'package:bankapp/widget/button.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pallet.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 140,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 80),
              child: Text(
                "Wellcome to",
                style: TextStyle(color: pallet.secondaryColor, fontSize: 20),
              ),
            ),
            const Text(
              "Mobile Bank",
              style: TextStyle(
                  color: pallet.secondaryColor,
                  fontSize: 33,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            CustomButton(
              button_text: "Login",
              ontapp: () {
                Navigator.push(
                    context,
                    DialogRoute(
                      context: context,
                      builder: (context) => const LoginPage(),
                    ));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              button_text: "Create Acount",
              ontapp: () {},
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
