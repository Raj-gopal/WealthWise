import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wealthwise/model/financials.dart';
import 'package:http/http.dart' as http;

class Overview_section extends StatefulWidget {
  const Overview_section({super.key});

  @override
  State<Overview_section> createState() => _Overview_sectionState();
}

class _Overview_sectionState extends State<Overview_section> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Fundamentals',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          FutureBuilder<Financial>(
              future: getfinancial(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data == null) {
                  return Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      color: Color.fromRGBO(3, 127, 255, 1),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data?.results.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Mkt Cap',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color:
                                              Color.fromRGBO(166, 166, 166, 1),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 24,
                                      ),
                                      Text(snapshot.data!.results[0].financials
                                          .balanceSheet[0]!.value
                                          .toString()),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(),
                          ],
                        ),
                      );
                    },
                  );
                }
              })
        ]),
      ),
    );
  }
}

Future<Financial> getfinancial() async {
  final response = await http.get(Uri.parse(
      'https://api.polygon.io/vX/reference/financials?ticker=AAPL&apiKey=h8gjI2GQTJ1KibD7oZXacUGOhTS5qKKq'));
  var data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    return Financial.fromJson(data);
  } else {
    return Financial.fromJson(data);
  }
}
