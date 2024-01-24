import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wealthwise/model/TIME_SERIES_INTRADAY.dart';
import 'package:wealthwise/model/company_name.dart';
import 'package:wealthwise/widgets/graph.dart';

class StockDetail extends StatefulWidget {
  const StockDetail({Key? key}) : super(key: key);

  @override
  _StockDetailState createState() => _StockDetailState();
}

class _StockDetailState extends State<StockDetail> {
  var currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 0,
          forceMaterialTransparency: true,
          title: Row(
            children: [
              Text(
                'Stock',
                style: TextStyle(
                  color: Color(0xFF041727),
                  fontFamily: 'Montserrat',
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                width: 176,
              ),
              // search icon
              SizedBox(
                height: 24,
                width: 24,
                child: Image(
                  image: AssetImage('assets/image/search 1.png'),
                ),
              ),
              SizedBox(
                width: 24,
              ),
              // profile icon
              SizedBox(
                height: 45,
                width: 45,
                child: Image(
                  image: AssetImage('assets/image/man 1.png'),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BasicData(),
              SizedBox(
                height: 24,
              ),
             
              Container(height: 292, child: CandlestickGraph()),
             
              SizedBox(
                height: 24,
              ),
             
              Container(
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color.fromRGBO(233, 233, 233, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                            setState(() {
                              currentindex = 0;
                            });
                          },
                        child: AnimatedContainer(
                          height: 26,
                          width: 48,
                          duration: Duration(milliseconds: 100),
                          //curve: Curves.fastOutSlowIn,
                          decoration: BoxDecoration(
                              color: currentindex == 0
                                  ? Color.fromRGBO(3, 127, 255, 1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8)),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              '1D',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: currentindex == 0
                                      ? Color.fromRGBO(215, 233, 252, 1)
                                      : Color.fromRGBO(166, 166, 166, 1)),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                            setState(() {
                              currentindex = 1;
                            });
                          },
                        child: AnimatedContainer(
                          height: 26,
                          width: 48,
                          duration: Duration(milliseconds: 100),
                          //curve: Curves.fastOutSlowIn,
                          decoration: BoxDecoration(
                              color: currentindex == 1
                                  ? Color.fromRGBO(3, 127, 255, 1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8)),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              '1W',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: currentindex == 1
                                      ? Color.fromRGBO(215, 233, 252, 1)
                                      : Color.fromRGBO(166, 166, 166, 1)),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                            setState(() {
                              currentindex = 2;
                            });
                          },
                        child: AnimatedContainer(
                          height: 26,
                          width: 48,
                          duration: Duration(milliseconds: 100),
                          //curve: Curves.fastOutSlowIn,
                          decoration: BoxDecoration(
                              color: currentindex == 2
                                  ? Color.fromRGBO(3, 127, 255, 1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8)),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              '1M',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: currentindex == 2
                                      ? Color.fromRGBO(215, 233, 252, 1)
                                      : Color.fromRGBO(166, 166, 166, 1)),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                            setState(() {
                              currentindex = 3;
                            });
                          },
                        child: AnimatedContainer(
                          height: 26,
                          width: 48,
                          duration: Duration(milliseconds: 100),
                         // curve: Curves.fastOutSlowIn,
                          decoration: BoxDecoration(
                              color: currentindex == 3
                                  ? Color.fromRGBO(3, 127, 255, 1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8)),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              '1Y',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: currentindex == 3
                                      ? Color.fromRGBO(215, 233, 252, 1)
                                      : Color.fromRGBO(166, 166, 166, 1)),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                            setState(() {
                              currentindex = 4;
                            });
                          },
                        child: AnimatedContainer(
                          height: 26,
                          width: 48,
                          duration: Duration(milliseconds: 100),
                       //   curve: Curves.fastOutSlowIn,
                          decoration: BoxDecoration(
                              color: currentindex == 4
                                  ? Color.fromRGBO(3, 127, 255, 1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8)),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              '5Y',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: currentindex == 4
                                      ? Color.fromRGBO(215, 233, 252, 1)
                                      : Color.fromRGBO(166, 166, 166, 1)),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                            setState(() {
                              currentindex = 5;
                            });
                          },
                        child: AnimatedContainer(
                          height: 26,
                          width: 48,
                          duration: Duration(milliseconds: 100),
                         // curve: Curves.fastOutSlowIn,
                          decoration: BoxDecoration(
                              color: currentindex == 5
                                  ? Color.fromRGBO(3, 127, 255, 1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8)),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'ALL',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: currentindex == 5
                                      ? Color.fromRGBO(215, 233, 252, 1)
                                      : Color.fromRGBO(166, 166, 166, 1)),
                            ),
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
      ),
    );
  }
}

class BasicData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CompanyNameStockApi>(
      future: getCompanyName(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            height: 80,
            width: 80,
            child: CircularProgressIndicator(
              color: Color.fromRGBO(3, 127, 255, 1),
            ),
          );
        } else {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  snapshot.data!.results[0].t.toString(),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(4, 23, 39, 1),
                  ),
                ),
                Text(
                  '＄' + snapshot.data!.results[0].vw.toString(),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(4, 23, 39, 1),
                  ),
                ),
                RichText(
                  maxLines: 1,
                  textAlign: TextAlign.right,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: snapshot.data!.results[0].c -
                                    snapshot.data!.results[0].o >=
                                0
                            ? '+'
                            : '',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: snapshot.data!.results[0].c -
                                      snapshot.data!.results[0].o >=
                                  0
                              ? Color.fromRGBO(18, 209, 142, 1)
                              : Color.fromRGBO(209, 18, 18, 1),
                        ),
                      ),
                      TextSpan(
                        text: (snapshot.data!.results[0].c -
                                snapshot.data!.results[0].o)
                            .toStringAsFixed(2),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: snapshot.data!.results[0].c -
                                      snapshot.data!.results[0].o >=
                                  0
                              ? Color.fromRGBO(18, 209, 142, 1)
                              : Color.fromRGBO(209, 18, 18, 1),
                        ),
                      ),
                      TextSpan(
                        text: '%',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: snapshot.data!.results[0].c -
                                      snapshot.data!.results[0].o >=
                                  0
                              ? Color.fromRGBO(18, 209, 142, 1)
                              : Color.fromRGBO(209, 18, 18, 1),
                        ),
                      ),
                      TextSpan(
                        text: ' (1D)',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: snapshot.data!.results[0].c -
                                      snapshot.data!.results[0].o >=
                                  0
                              ? Color.fromRGBO(18, 209, 142, 1)
                              : Color.fromRGBO(209, 18, 18, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

Future<CompanyNameStockApi> getCompanyName() async {
  final response = await http.get(Uri.parse(
      'https://api.polygon.io/v2/aggs/grouped/locale/us/market/stocks/2023-01-11?adjusted=true&apiKey=h8gjI2GQTJ1KibD7oZXacUGOhTS5qKKq'));
  var data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    return CompanyNameStockApi.fromJson(data);
  } else {
    throw Exception('Failed to load company name');
  }
}


Future<TimeSeriesIntraday> getIntraday() async {
  final response = await http.get(Uri.parse(
      'https://api.polygon.io/v2/aggs/grouped/locale/us/market/stocks/2023-01-11?adjusted=true&apiKey=h8gjI2GQTJ1KibD7oZXacUGOhTS5qKKq'));
  var data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    return TimeSeriesIntraday.fromJson(data);
  } else {
    throw Exception('Failed to load company name');
  }
}