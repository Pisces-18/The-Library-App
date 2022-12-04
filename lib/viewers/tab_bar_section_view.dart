import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';

class TabBarSectionView extends StatefulWidget {
  final String tab1;
  final String tab2;
  final int initial;
  final Function(int) onTabTabBar;
  TabBarSectionView(this.tab1,this.tab2,this.onTabTabBar,this.initial);
  @override
  State<TabBarSectionView> createState() => _TabBarSectionViewState();
}

class _TabBarSectionViewState extends State<TabBarSectionView> {
  int index=0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.initial,
      length: 2,
      child: TabBar(

          onTap: (i) {
            setState(() {
              index = i;
              widget.onTabTabBar(index);
             debugPrint("Tab Index===>$index");
            });
          },
          labelColor: Colors.blue,
          unselectedLabelColor: SMS_CODE_COLOR,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            Tab(
              child: Text(
                widget.tab1,
                style: TextStyle(
                    fontSize: TEXT_REGULAR, fontWeight: FontWeight.w500),
              ),
            ),
            Tab(
              child: Text(
                widget.tab2,
                style: TextStyle(
                    fontSize: TEXT_REGULAR, fontWeight: FontWeight.w500),
              ),
            ),
          ],),
    );
  }
}
