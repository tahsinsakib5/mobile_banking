import 'package:bankapp/color/colors.dart';
import 'package:bankapp/color/model.dart';
import 'package:bankapp/qr_code_page.dart';
import 'package:bankapp/send_money.dart';
import 'package:bankapp/widget/resent_service.dart';
import 'package:bankapp/widget/service_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pallet.primaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QrCodePage(),
              ));
        },
        child: Icon(Icons.qr_code),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Service")
      ]),
      body: SafeArea(
        child: FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            // if(snapshot.hasData){
            return Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        color: pallet.secondaryColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Tahsin Sakib",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  CircleAvatar(
                                    radius: 29,
                                    child: CircleAvatar(
                                      radius: 27.0,
                                      child: Icon(Icons.person),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 45,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: pallet.primaryColor,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                  child: Text(
                                "00\$",
                                style: TextStyle(fontSize: 18),
                              )),
                            ),
                            Text(
                              "Money",
                              style: TextStyle(color: pallet.primaryColor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 180,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Card(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Service_container(
                                  imagename: "assets/send_money.png",
                                  title: "Transfer",
                                  clik: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Send_money(),
                                        ));
                                  },
                                ),
                                Service_container(
                                  imagename: "assets/send_money.png",
                                  title: "Payment",
                                  clik: () {},
                                ),
                                Service_container(
                                  imagename: "assets/send_money.png",
                                  title: "Information",
                                  clik: () {},
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Service_container(
                                  imagename: "assets/online_payment.png",
                                  title: "Send money",
                                  clik: () {},
                                ),
                                Service_container(
                                  imagename: "assets/send_money.png",
                                  title: "Send money",
                                  clik: () {},
                                ),
                                Service_container(
                                  imagename: "assets/send_money.png",
                                  title: "Send money",
                                  clik: () {
                                    getdata();
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Transaksi Tarekhir",
                              style: TextStyle(fontSize: 16),
                            ),
                            TextButton(onPressed: () {}, child: Text("more"))
                          ],
                        ),
                      ),
                      Column(
                        children: [Resent_Service(), Resent_Service()],
                      )
                    ],
                  ),
                ),
              ],
            );
            // }

            // else{
            //   return Center(child: CircularProgressIndicator());
            // }
          },
        ),
      ),
    );
  }

  Future getdata() async {
    List alluser = [];
    var allUserData =
        await FirebaseFirestore.instance.collection("User_data").get();

    for (var doc in allUserData.docs) {
      var amount = doc.get("user_name");
      var name = doc.get("name");
      print(name);
      var data = UserModel(userAmount: amount, name: name);
      alluser.add(data);
      print(data.userAmount);
    }
    return alluser;
  }
}
