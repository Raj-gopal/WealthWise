
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';

class Add_Fund extends StatefulWidget {
  const Add_Fund({Key? key}) : super(key: key);

  @override
  State<Add_Fund> createState() => _Add_FundState();
}

class _Add_FundState extends State<Add_Fund> {
  var money = TextEditingController();
  final firestore = FirebaseFirestore.instance.collection('Funds');
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
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 48, left: 24, right: 24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Add Money',
                style: TextStyle(
                  color: Color(0xFF041727),
                  fontFamily: 'Montserrat',
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  '\$$amount',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(91, 91, 91, 1),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, right: 32),
                child: AutoSizeTextField(
                  controller: money,
                  fullwidth: false,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                  cursorColor: Color.fromRGBO(196, 196, 197, 1),
                  cursorHeight: 32,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$',
                    prefixStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Color.fromRGBO(91, 91, 91, 1),
                    ),
                    hintText: '0',
                    hoverColor: Color.fromRGBO(91, 91, 91, 1),
                    focusColor: Color(0xFF041727),
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Color.fromRGBO(91, 91, 91, 1),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 112,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(209, 18, 18, 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Amount should be greater than or equal to 100',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      color: Color.fromRGBO(252, 178, 185, 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          String id = 'Portfolio';
          double enteredAmount = double.tryParse(money.text.toString()) ?? 0.0;

          if (enteredAmount <= 0) {
            print('Invalid entered amount');
            return;
          }

          double totalAmount = enteredAmount + amount;

          await firestore.doc(id).set({
            'Fund': money.text.toString(),
            'id': id,
            'Amount': totalAmount,
          });

          // Fetch and update the amount after updating Firestore
          await fetchAndSetAmount();

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Center(
              child: Text(
                'Amount Added',
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
                'ADD FUND',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ),
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
