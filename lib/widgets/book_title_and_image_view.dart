import 'package:flutter/material.dart';

import '../data/vos/book_vo.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';

class BookTitleAndImageView extends StatelessWidget {
  final double imageHeight;
  final double imageWidth;
  final bool isLibrary;
  final BookVO? book;
  BookTitleAndImageView(this.imageHeight, this.imageWidth,this.book,{this.isLibrary=false});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: imageWidth,
              height: imageHeight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(MARGIN_SMALL),
                child: Image.network(
                  book?.bookImage?? "",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: MARGIN_MEDIUM_2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,

              children: [
                Flexible(
                  flex: 2,
                  child: ClipRect(
                    child: Text(
                      book?.title?? "",
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: TEXT_REGULAR_2X, color: Colors.black),
                    ),
                  ),
                ),
                Text(
                  book?.author?? "",
                  style: TextStyle(fontSize: TEXT_REGULAR, color: SMS_CODE_COLOR),
                ),
                Text(
                  "Ebook . 187 pages",
                  style: TextStyle(fontSize: TEXT_REGULAR, color: SMS_CODE_COLOR),
                ),
              ],
            ),

            ],
        ),
        Visibility(
          visible: isLibrary,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.save_alt),
              const SizedBox(width: MARGIN_MEDIUM_2),
              Text("...",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: TEXT_REGULAR_3X))

            ],
          ),
        )
      ],
    );
  }
}
