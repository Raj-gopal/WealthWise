import 'package:flutter/material.dart';
import 'package:wealthwise/screen/Buy_Stock.dart';
import 'package:wealthwise/screen/profile_screen.dart';
import 'package:wealthwise/section/Overview_section.dart';
import 'package:wealthwise/widgets/graph.dart';

class StockDetail extends StatefulWidget {
  const StockDetail(
      {Key? key, required this.name, required this.price, required this.ret})
      : super(key: key);

  final String name;
  final String price;
  final String ret;

  @override
  _StockDetailState createState() => _StockDetailState();
}

class _StockDetailState extends State<StockDetail> {
  var currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const profile_screen(),
                  ),
                );
              },
              child: SizedBox(
                height: 45,
                width: 45,
                child: Image(
                  image: AssetImage('assets/image/man 1.png'),
                ),
              ),
            ),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: BasicData(
                          name: widget.name,
                          price: widget.price,
                          ret: widget.ret,
                        ),
                      ),
                      SizedBox(height: 24),
                         Container(height: 292, child: CandlestickGraph()),
                      SizedBox(height: 24),
                      tab(),
                      SizedBox(height: 32),
                    ],
                  ),
                ),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      dividerColor: Colors.transparent,
                      enableFeedback: false,
                      isScrollable: true,
                      splashFactory: NoSplash.splashFactory,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Color.fromRGBO(215, 233, 252, 1),
                      ),
                      unselectedLabelColor: Color.fromRGBO(166, 166, 166, 1),
                      labelColor: Color.fromRGBO(3, 127, 255, 1),
                      tabs: [
                        Tab(
                          child: Container(
                            width: 104,
                            decoration: BoxDecoration(),
                            child: Center(
                              child: Text(
                                'Overview',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            width: 104,
                            decoration: BoxDecoration(),
                            child: Center(
                              child: Text(
                                'Rating',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            width: 104,
                            decoration: BoxDecoration(),
                            child: Center(
                              child: Text(
                                'News',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                OverviewSection(name: widget.name),
                Text('Rate'),
                Text('News'),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: bottom(),
    );
  }

  Container bottom() {
    return Container(
      height: 112,
      color: Colors.white,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Center(
                child: Text(
                  'Not available',
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
          },
          child: Container(
            height: 64,
            width: 185 - 8,
            decoration: BoxDecoration(
              color: Color.fromRGBO(209, 18, 18, .5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'SELL',
                textAlign: TextAlign.center,
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
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => buy_stock(name: widget.name, price: widget.price,)),
            );
          },
          child: Container(
            height: 64,
            width: 185 - 8,
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 127, 255, 1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'BUY',
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
      ]),
    );
  }

  Container tab() {
    return Container(
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
    );
  }
}

class BasicData extends StatelessWidget {
  final String name;
  final String price;
  final String ret;

  BasicData({required this.name, required this.price, required this.ret});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$name',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(4, 23, 39, 1),
            ),
          ),
          Text(
            '\$' + '$price',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(4, 23, 39, 1),
            ),
          ),
          Text(
            '$ret' + '%' + ' (1D)',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: double.parse(ret.toString()) >= 0
                  ? Color.fromRGBO(18, 209, 142, 1)
                  : Color.fromRGBO(209, 18, 18, 1),
            ),
          ),
        ],
      ),
    );
  }
}

// Future<CompanyNameStockApi> getCompanyName() async {
//   final response = await http.get(Uri.parse(
//       'https://api.polygon.io/v2/aggs/grouped/locale/us/market/stocks/2023-01-11?adjusted=true&apiKey=h8gjI2GQTJ1KibD7oZXacUGOhTS5qKKq'));
//   var data = jsonDecode(response.body.toString());

//   if (response.statusCode == 200) {
//     return CompanyNameStockApi.fromJson(data);
//   } else {
//     throw Exception('Failed to load company name');
//   }
// }

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverAppBarDelegate(this.tabBar);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          tabBar,
          Container(
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
