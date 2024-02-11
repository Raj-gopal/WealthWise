// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wealthwise/screen/Add_Fund.dart';

class profile_screen extends StatefulWidget {
  const profile_screen({super.key});

  @override
  State<profile_screen> createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {

 double amount = 0.0;

  Future<void> fetchAndSetAmount() async {
    var fetchedAmount = await fetchData();
    setState(() {
      amount = fetchedAmount;
    });
  }

  @override
  void initState() {
    super.initState();
    // Fetch initial amount when the widget is initialized
    fetchAndSetAmount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0,
        forceMaterialTransparency: true,
        title: Row(
          children: [
            Text(
              'My Profile',
              style: TextStyle(
                color: Color(0xFF041727),
                fontFamily: 'Montserrat',
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 88,
                  width: 88,
                  child: Image(
                    image: AssetImage('assets/image/man 1.png'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rajgopal Kumar',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(4, 23, 39, 1),
                        ),
                      ),
                      Text('rajgk0000@gmail.com',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(166, 166, 166, 1),
                          )),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Divider(
                color: Color.fromRGBO(166, 166, 166, .2),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Design(
                    headline: 'Add fund',
                    subline: '\$$amount',
                    buttontext: 'ADD MONEY',
                    image: Image.asset('assets/image/AddFund.png'),
                  ).build(context),
                ),

                SizedBox(
                  width: 16,
                ),

                Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Design(
                    headline: 'Transactions',
                    subline: 'History',
                    buttontext: 'VIEW',
                    image: Image.asset('assets/image/Transactions.png'),
                  ).build(context),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Design(
                    headline: 'Withdraw',
                    subline: '\$$amount',
                    buttontext: 'AMOUNT',
                    image: Image.asset('assets/image/Withdraw.png'),
                  ).build(context),
                ),

                SizedBox(
                  width: 16,
                ),

                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Design(
                    headline: 'All order',
                    subline: 'Track orders',
                    buttontext: 'VIEW',
                    image: Image.asset('assets/image/All order.png'),
                  ).build(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Design {
  Design({
    required this.headline,
    required this.subline,
    required this.buttontext,
    required this.image,
  });

  final String headline;
  final String subline;
  final String buttontext;
  final Image image;

  Widget build(BuildContext context) {
    return Container(
      height: 172,
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Color.fromRGBO(247, 247, 247, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 56,
              width: 56,
              child: CircleAvatar(
                child: image,
              ),
            ),
            Text(
              headline,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(4, 23, 39, 1),
              ),
            ),
            Text(
              subline,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(91, 91, 91, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) =>Add_Fund()));
                },
                child: Container(
                  height: 48,
                  width: 158,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Color.fromRGBO(215, 233, 252, 1),
                  ),
                  child: Center(
                      child: Text(
                    buttontext,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(3, 127, 255, 1),
                    ),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


Future<double> fetchData() async {
  var collection = FirebaseFirestore.instance.collection('Funds');
  var documentSnapshot = await collection.doc('Portfolio').get();

  if (documentSnapshot.exists) {
    Map<String, dynamic> data = documentSnapshot.data()!;
    var amount = data['Amount'];
    print('Fetched Amount: $amount');
    return amount is double ? amount : 0.0;
    
  }
  return 0.0;
}