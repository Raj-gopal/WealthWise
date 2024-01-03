import 'package:flutter/material.dart';

class TTabbar extends StatelessWidget implements PreferredSizeWidget {
  const TTabbar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      
      tabs: tabs,
      
      padding: EdgeInsets.only(left: 16),
      enableFeedback: false,
      
      physics: BouncingScrollPhysics(),
      isScrollable: true,
      
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Color.fromRGBO(215, 233, 252, 1),
        
      ),
      unselectedLabelColor: Color.fromRGBO(166, 166, 166, 1),
      labelColor: Color.fromRGBO(3, 127, 255, 1),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(290);
}
