import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/datas.dart';
import '../resources/dimens.dart';
import '../widgets/book_title_and_image_view.dart';

showShelvesBottomSheet(BuildContext context,String title,List<Map<String,dynamic>> data,Function(String) onTapFunction) {
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
              child:Text(title,style:
              TextStyle(fontSize: TEXT_REGULAR_2Xx, color: Colors.black,fontWeight: FontWeight.w500),),

            ),
            Divider(
              color: SMS_CODE_COLOR,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: TEXT_REGULAR_3X,
                  right: TEXT_REGULAR_3X,
                  bottom: TEXT_REGULAR_3X),
              child: ListView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: ()=>onTapFunction(data.elementAt(index)['name']),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: MARGIN_CARD_MEDIUM_2),
                        child: Row(
                          children: [
                            Image.asset(data.elementAt(index)['icon'],width: MARGIN_LARGE,height: MARGIN_LARGE,),
                            const SizedBox(
                              width: MARGIN_MEDIUM,
                            ),
                            Text(
                              "${data.elementAt(index)['name']}",
                              style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w700,fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        );
      });
}