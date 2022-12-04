import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';

class MultipleChipView extends StatefulWidget {
  final List<String> tabList;
  final Function(String) onTapChip;
  MultipleChipView(this.tabList,this.onTapChip);

  @override
  State<MultipleChipView> createState() => _MultipleChipViewState();
}

class _MultipleChipViewState extends State<MultipleChipView> {
  @override
  Widget build(BuildContext context) {
    // return Chip(
    //   padding: EdgeInsets.symmetric(
    //       horizontal: MARGIN_MEDIUM, vertical: MARGIN_SMALL),
    //   backgroundColor: Colors.white,
    //   side: BorderSide(color: SMS_CODE_COLOR),
    //   label: Row(
    //     children: tabList.map((type) => TabSelectView(type,(text)=>onTapChip(text))).toList(),
    //   ),
    // );
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
          itemCount: widget.tabList.length,
          physics: ScrollPhysics(),
          itemBuilder: (BuildContext context,int index){
        return GestureDetector(
            onTap: (){
              setState(() {
                widget.onTapChip(widget.tabList[index]);
              });
            },
            child: TabSelectView(widget.tabList[index]));
      }),
    );
  }
}

class TabSelectView extends StatefulWidget {
  final String text;

  TabSelectView(this.text);

  @override
  State<TabSelectView> createState() => _TabSelectViewState();
}

class _TabSelectViewState extends State<TabSelectView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM),
      //height: 25,

      decoration: BoxDecoration(
          color: Colors.white,
          border:
          (widget.text == "Comics" || widget.text == "Uploads" || widget.text == "In progress")
              ? null
              : Border(right: BorderSide(color: SMS_CODE_COLOR))),
      child: Center(
          child: Text(
            widget.text,
            style: TextStyle(color: SMS_CODE_COLOR),
          )),
    );
  }
}