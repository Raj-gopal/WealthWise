import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Add_Fund extends StatelessWidget {
  const Add_Fund({super.key});

  @override
  Widget build(BuildContext context) {
    var money = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 48,
        ),
        child: Column(
          children: [
            Center(
              child: Text(
                'Add Money',
                style: TextStyle(
                  color: Color(0xFF041727),
                  fontFamily: 'Montserrat',
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  '\$400',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(91, 91, 91, 1),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '\$',
                      style: TextStyle(
                        color: Color(0xFF041727),
                        fontFamily: 'Montserrat',
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      width: 32,
                      child: TextField(
                        controller: money,
                        cursorColor:  Color.fromRGBO(196, 196, 197, 1),
                        cursorHeight: 32,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '0',
                          hoverColor: Color.fromRGBO(91, 91, 91, 1),
                          focusColor: Color(0xFF041727),
                          hintStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                          ),
                          
                           border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
