import 'package:flutter/material.dart';
import 'package:wealthwise/screen/profile_screen.dart';
import 'package:wealthwise/section/Explore_section.dart';
import 'package:wealthwise/section/Holding_screen.dart';
import 'package:wealthwise/widgets/user_data.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final List<Widget> tabViews = [
    Explore_section(),
    HoldingScreen(),
    Text('data'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0,
        forceMaterialTransparency: true,
        title: Row(
          children: [
            Text(
              'Investments',
              style: TextStyle(
                color: Color(0xFF041727),
                fontFamily: 'Montserrat',
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              width: 72,
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
                        builder: (context) => const profile_screen()),
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
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 240,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    userdata(),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  dividerColor: Colors.transparent,
                  padding: EdgeInsets.only(left: 16),
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
                            'Explore',
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
                            'Holdings',
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
                            'My Watchlist',
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
            SliverFillRemaining(
              child: TabBarView(
                children: tabViews,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
