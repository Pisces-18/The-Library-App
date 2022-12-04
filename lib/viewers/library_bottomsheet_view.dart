import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/datas.dart';
import '../resources/dimens.dart';
import '../resources/strings.dart';
import '../widgets/book_title_and_image_view.dart';


libraryBottomSheet(BuildContext context,String title,List<String> data,Function(String) handleRadioValueChange,String selectedValue) {
  var radioValue="";
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: MARGIN_MEDIUM_3,
                  right: MARGIN_MEDIUM_3,
                  top: MARGIN_MEDIUM_2),
              child: Text(title,style:
              TextStyle(fontSize: TEXT_REGULAR_2Xx, color: Colors.black,fontWeight: FontWeight.w500),),
            ),
            Divider(
              color: SMS_CODE_COLOR,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Radio<String>(
                    value: data[0],
                    groupValue: radioValue,
                    onChanged: (value) {
                      radioValue = value?? data[0];
                      debugPrint("Radio 1 $radioValue");
                      handleRadioValueChange(value!);
                    },
                  ),
                  title:  Text(data[0]),
                ),
                ListTile(
                  leading: Radio<String>(
                    value: data[1],
                    groupValue: radioValue,
                    onChanged: (value) {
                      radioValue = value ?? data[1];
                      debugPrint("Radio 2 $radioValue");
                      handleRadioValueChange(value!);
                    },
                  ),
                  title:  Text(data[1]),
                ),
                ListTile(
                  leading: Radio<String>(
                    value: data[2],
                    groupValue: radioValue,
                    onChanged: (value) {
                      radioValue = value ?? data[2];
                      debugPrint("Radio 3 $radioValue");
                      handleRadioValueChange(value!);
                    },
                  ),
                  title:  Text(data[2]),
                ),
              ],
            )
          ],
        );
      });

}