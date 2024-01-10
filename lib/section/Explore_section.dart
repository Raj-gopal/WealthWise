import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:wealthwise/model/company_name.dart';
import 'package:wealthwise/widgets/graph.dart';

class Explore_section extends StatefulWidget {
  const Explore_section({super.key});

  @override
  State<Explore_section> createState() => _Explore_sectionState();
}

class _Explore_sectionState extends State<Explore_section> {
  List<CompanyNameStockApi> companyName = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getname(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator(
                        color: Color.fromRGBO(3, 127, 255, 1),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: companyName.length,
                          itemBuilder: (context, index) {
                            return Container(
                                child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                        padding: EdgeInsets.only(left: 8),
                                        child: Row(children: [
                                          Text(
                                            companyName[index].name.toString(),
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 24,
                                                fontWeight: FontWeight.w700,
                                                color: Color.fromRGBO(
                                                    4, 23, 39, 1)),
                                          ),
                                          SizedBox(
                                            width: 128,
                                          ),
                                          graph_section(),
                                          SizedBox(
                                            width: 56,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                '₹455.20',
                                                style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color.fromRGBO(
                                                        4, 23, 39, 1)),
                                              ),
                                              Text(
                                                '+3.75(0.83%)',
                                                style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color.fromRGBO(
                                                        18, 209, 142, 1)),
                                              ),
                                            ],
                                          )
                                        ]))));
                          });
                    }
                  }),
            )
          ],
        ));
  }

  Future<List<CompanyNameStockApi>> getname() async {
    final response = await http.get(Uri.parse(
        'https://financialmodelingprep.com/api/v3/search?query=AA&apikey=T7P7eb7IvqOle9pHS0dnSx7mht424blu'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        companyName.add(CompanyNameStockApi.fromJson(i));
      }
      return companyName;
    } else {
      return companyName;
    }
  }
}
