import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';

class ShelvesTitleAndNumberOfBookView extends StatelessWidget {
  final String title;
  final double titleSize;
  final int bookCount;
  ShelvesTitleAndNumberOfBookView(this.title,this.titleSize,this.bookCount);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(fontSize: titleSize,fontWeight: FontWeight.w500,color: Colors.black),),
        Text("$bookCount books",style: TextStyle(fontSize: TEXT_REGULAR,fontWeight: FontWeight.w500,color: SMS_CODE_COLOR),)

      ],
    );
  }
}