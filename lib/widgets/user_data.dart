

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class userdata extends StatefulWidget {
  const userdata({super.key});

  @override
  State<userdata> createState() => _userdataState();
}

class _userdataState extends State<userdata> {


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
    return Padding(
              padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
              child: Container(
                height: 176,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color.fromRGBO(3, 127, 255, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 17,left: 20),
                  child: Row(
                    children: [
                    //Left side Data
                    
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //left side data
                          Container(
                            child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Text
                                Text(
                                  'Current',
                                  style: TextStyle(
                                      color: Color.fromRGBO(215, 233, 252, 1),
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                    
                                // Data
                                Text(
                                  '\$$amount',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                    
                          //right side data
                          Container(
                            child: Column(
                
                               crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Text
                                Text(
                                  'Invested',
                                  style: TextStyle(
                                      color: Color.fromRGBO(215, 233, 252, 1),
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                    
                                // Data
                                Text(
                                  '\$$amount',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                
                    SizedBox(
                      width: 128,
                    ),
                
                    //Right side Data
                
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          //upper side data
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                //Text
                                Text(
                                  'Total returns',
                                  style: TextStyle(
                                      color: Color.fromRGBO(215, 233, 252, 1),
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                
                                // Data
                                Text(
                                  '\$763.39',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                
                          //lower side data
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                //Text
                                Text(
                                  '1D returns',
                                  style: TextStyle(
                                      color: Color.fromRGBO(215, 233, 252, 1),
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                
                                // Data
                                Text(
                                  '\$42.25',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
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
