import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HoldingScreen extends StatefulWidget {
  const HoldingScreen({Key? key}) : super(key: key);

  @override
  State<HoldingScreen> createState() => _HoldingScreenState();
}

class _HoldingScreenState extends State<HoldingScreen> {
  final CollectionReference holdingCollection = FirebaseFirestore.instance
      .collection('Funds')
      .doc('Portfolio')
      .collection('Holding');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: holdingCollection.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(
              color: Color.fromRGBO(3, 127, 255, 1),
            );
          }

          if (snapshot.hasError || snapshot.data == null) {
            return Container(
              child: Text('Error loading data'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var holdingData =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;

              var fieldNames = holdingData['fieldName'] as List<dynamic>;
              var prices = holdingData['price'] as List<dynamic>;

              return Column(
                children: List.generate(
                  fieldNames.length,
                  (subIndex) => Padding(
                    padding: const EdgeInsets.only(top: 24, left: 24, right: 16),
                    child: Container(
                      padding: const EdgeInsets.only(top:16),
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${fieldNames[subIndex]}',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(4, 23, 39, 1)),
                          ),
                          
                          Text(
                            '\$ ${prices[subIndex]}',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(4, 23, 39, 1)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HoldingScreen(),
  ));
}
