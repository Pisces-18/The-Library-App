import 'package:flutter/material.dart';

import '../resources/dimens.dart';

class TitleAndSeeMoreView extends StatefulWidget {
  final String title;
  final bool isAudio;
  final bool seeMore;
  final Function(String,bool) onTapSeeMore;
  TitleAndSeeMoreView(this.title,this.onTapSeeMore,{this.isAudio=false,this.seeMore=true});
  @override
  State<TitleAndSeeMoreView> createState() => _TitleAndSeeMoreViewState();
}

class _TitleAndSeeMoreViewState extends State<TitleAndSeeMoreView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              widget.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: TEXT_REGULAR_3X,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Visibility(
            visible: widget.seeMore,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  widget.onTapSeeMore(widget.title,widget.isAudio);
                });
              },
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }
}
