import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

class buy_stock extends StatefulWidget {
  const buy_stock({Key? key, required this.name, required this.price})
      : super(key: key);
  final String name;
  final String price;
  @override
  State<buy_stock> createState() => _buy_stockState();
}

class _buy_stockState extends State<buy_stock> {
  var Quantity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextScroll(
              widget.name,
              intervalSpaces: 10,
              velocity: Velocity(pixelsPerSecond: Offset(50, 0)),
              fadedBorder: true,
              fadeBorderVisibility: FadeBorderVisibility.auto,
              fadeBorderSide: FadeBorderSide.both,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(4, 23, 39, 1),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '\$' + widget.price,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(4, 23, 39, 1),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 32, left: 24, right: 24, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Amount',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(4, 23, 39, 1),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: 160,
                      child: TextField(
                        controller: Quantity,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(4, 23, 39, 1),
                        ),
                        cursorColor: Color.fromRGBO(3, 127, 255, 1),
                        decoration: InputDecoration(
                          prefixText: '\$ ',
                          prefixStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(4, 23, 39, 1),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16), // Adjust as needed
                          filled: true,
                          border: InputBorder.none,
                          fillColor: Color.fromRGBO(215, 233, 252, 1),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(215, 233, 252, 1)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(215, 233, 252, 1)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(215, 233, 252, 1)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(215, 233, 252, 1)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(4, 23, 39, 1),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: 160,
                      height: 48,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(215, 233, 252, 1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              '\$' + widget.price,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(3, 127, 255, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              'Type',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(4, 23, 39, 1),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: Container(
                width: 160,
                height: 48,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(233, 233, 233, 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Market',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(166, 166, 233, 1),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
       onTap: () async {
  if (Quantity.text == widget.price) {
    try {
      final documentRef = FirebaseFirestore.instance
          .collection("Funds")
          .doc("Portfolio")
          .collection('Holding')
          .doc('Company');

      // Check if the document exists
      final documentSnapshot = await documentRef.get();

      if (documentSnapshot.exists) {
        // Document exists, update it
        await documentRef.update({
          'fieldName': FieldValue.arrayUnion([widget.name]),
          'price': FieldValue.arrayUnion([Quantity.text]), // Add price value
          // Add other fields as needed
        });

        print('Data added to the document successfully');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Center(
            child: Text(
              'In your portfolio now',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
          behavior: SnackBarBehavior.floating,
          elevation: 5,
          backgroundColor: Color.fromRGBO(18, 209, 142, 1),
        ));
      } else {
        // Document does not exist, handle accordingly
        print('Document does not exist. You can handle this case here.');
        // For example, you might want to create a new document:
        await documentRef.set({
          'fieldName': [widget.name], // Initialize array with the first value
          'price': [Quantity.text], // Add price value
          // Add other fields as needed
        });

        print('New document created successfully');
      }
    } catch (e) {
      print('Error updating/creating data: $e');
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Center(
        child: Text(
          'Amount is not correct',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 5,
      backgroundColor: Color.fromRGBO(209, 18, 18, 1),
    ));
  }
},

        child: Padding(
          padding:
              const EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 24),
          child: Container(
            height: 72,
            decoration: BoxDecoration(
                color: Color.fromRGBO(3, 127, 255, 1),
                borderRadius: BorderRadius.circular(16)),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'BUY',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: buy_stock(),
//   ));
// }
