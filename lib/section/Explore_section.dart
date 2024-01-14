import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:wealthwise/model/company_name.dart';
import 'package:wealthwise/screen/detail.dart';
import 'package:wealthwise/widgets/graph.dart';

class Explore_section extends StatefulWidget {
  const Explore_section({super.key});

  @override
  State<Explore_section> createState() => _Explore_sectionState();
}

class _Explore_sectionState extends State<Explore_section> {
  // List<CompanyNameStockApi> companyName = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 24, left: 24, right: 16),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getname(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container(
                        alignment: Alignment.center,
                        height: 64,
                        width: 64,
                        child: CircularProgressIndicator(
                          color: Color.fromRGBO(3, 127, 255, 1),
                        ),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data?.results.length,
                          itemBuilder: (context, index) {
                            return Container(
                                height: 72,
                                padding: EdgeInsets.only(top: 8),
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                const stock_detail()),
                                      );
                                    },
                                    child: Container(
                                        // padding: EdgeInsets.only(left: 8),
                                        child: Row(children: [
                                      Container(
                                        width: 64,
                                        child: Text(
                                          snapshot.data!.results[index].t
                                              .toString(),
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color:
                                                  Color.fromRGBO(4, 23, 39, 1)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 40,
                                      ),
                                      // graph_section(),
                                      SizedBox(
                                        width: 136,
                                      ),
                                      Container(
                                        width: 104,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              RichText(
                                                maxLines: 1,
                                                textAlign: TextAlign.right,
                                                text: TextSpan(
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: "＄",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Color.fromRGBO(
                                                              4, 23, 39, 1)),
                                                    ),
                                                    TextSpan(
                                                      text: snapshot.data!
                                                          .results[index].vw
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Color.fromRGBO(
                                                              4, 23, 39, 1)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              RichText(
                                                maxLines: 1,
                                                textAlign: TextAlign.right,
                                                text: TextSpan(
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: snapshot
                                                                      .data!
                                                                      .results[
                                                                          index]
                                                                      .c -
                                                                  snapshot
                                                                      .data!
                                                                      .results[
                                                                          index]
                                                                      .o >=
                                                              0
                                                          ? '+'
                                                          : '',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: snapshot
                                                                          .data!
                                                                          .results[
                                                                              index]
                                                                          .c -
                                                                      snapshot
                                                                          .data!
                                                                          .results[
                                                                              index]
                                                                          .o >=
                                                                  0
                                                              ? Color.fromRGBO(
                                                                  18,
                                                                  209,
                                                                  142,
                                                                  1)
                                                              : Color.fromRGBO(
                                                                  209,
                                                                  18,
                                                                  18,
                                                                  1)),
                                                    ),
                                                    TextSpan(
                                                      text: (snapshot
                                                                  .data!
                                                                  .results[
                                                                      index]
                                                                  .c -
                                                              snapshot
                                                                  .data!
                                                                  .results[
                                                                      index]
                                                                  .o)
                                                          .toStringAsFixed(2),
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: snapshot
                                                                          .data!
                                                                          .results[
                                                                              index]
                                                                          .c -
                                                                      snapshot
                                                                          .data!
                                                                          .results[
                                                                              index]
                                                                          .o >=
                                                                  0
                                                              ? Color.fromRGBO(
                                                                  18,
                                                                  209,
                                                                  142,
                                                                  1)
                                                              : Color.fromRGBO(
                                                                  209,
                                                                  18,
                                                                  18,
                                                                  1)),
                                                    ),
                                                    TextSpan(
                                                      text: '%',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: snapshot
                                                                          .data!
                                                                          .results[
                                                                              index]
                                                                          .c -
                                                                      snapshot
                                                                          .data!
                                                                          .results[
                                                                              index]
                                                                          .o >=
                                                                  0
                                                              ? Color.fromRGBO(
                                                                  18,
                                                                  209,
                                                                  142,
                                                                  1)
                                                              : Color.fromRGBO(
                                                                  209,
                                                                  18,
                                                                  18,
                                                                  1)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                      )
                                    ]))));
                          });
                    }
                  }),
            )
          ],
        ));
  }

  Future<CompanyNameStockApi> getname() async {
    final response = await http.get(Uri.parse(
        'https://api.polygon.io/v2/aggs/grouped/locale/us/market/stocks/2023-01-11?adjusted=true&apiKey=h8gjI2GQTJ1KibD7oZXacUGOhTS5qKKq'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return CompanyNameStockApi.fromJson(data);
    } else {
      return CompanyNameStockApi.fromJson(data);
    }
  }
}
