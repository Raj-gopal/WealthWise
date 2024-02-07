import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

class buy_stock extends StatefulWidget {
  const buy_stock({Key? key}) : super(key: key);

  @override
  State<buy_stock> createState() => _buy_stockState();
}

class _buy_stockState extends State<buy_stock> {
  var Quality = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextScroll(
              'Indian Railway Finance Corp',
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
              '₹2,090.75',
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
                      'Quantity',
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
                        controller: Quality,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(4, 23, 39, 1),
                        ),
                        cursorColor: Color.fromRGBO(3, 127, 255, 1),
                        decoration: InputDecoration(
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
                            padding: const EdgeInsets.only(left:8),
                            child: Text(
                              '₹2,090.75',
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
            SizedBox(height: 32,),
            Text('Type',  style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(4, 23, 39, 1),
              ),),
              SizedBox(height: 16,),
              
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: buy_stock(),
  ));
}
