import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';



class Add_Fund extends StatelessWidget {
  const Add_Fund({super.key});

  @override
  Widget build(BuildContext context) {
    var money = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 48, left: 24, right: 24
        ),
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
                  '\$400 available',
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
                  // minWidth: 100,
                  //   textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
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
              SizedBox(height: 112,),

              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(209, 18, 18, 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text('Amount should be greater than or equal to 100',
                  style:  TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      color: Color.fromRGBO(252, 178, 185, 1),
                    ),),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: (){
  //          Navigator.pushReplacement(
  //   context,
  //   MaterialPageRoute(builder: (context) => onboarding_Screen()),
  // );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 24, left: 24, right: 24 ,bottom: 24),
          child: Container(
            height: 72,
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 127, 255, 1),
              borderRadius: BorderRadius.circular(16)
            ),
            child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'ADD FUND',
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
