import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';

class ChipView extends StatelessWidget {
  final String text;
  ChipView(this.text);
  @override
  Widget build(BuildContext context) {
    return  Chip(
      padding: EdgeInsets.symmetric(
          horizontal: MARGIN_MEDIUM, vertical: MARGIN_SMALL),
      backgroundColor: Colors.blue,
      side: BorderSide(color: SMS_CODE_COLOR),
      label: Text(text,style: TextStyle(color: Colors.white),)
    );
  }
}
