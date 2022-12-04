import 'package:flutter/material.dart';
import 'package:the_library_app/resources/colors.dart';
import 'package:the_library_app/resources/dimens.dart';

import '../data/vos/book_vo.dart';

class BookView extends StatefulWidget {
  final BookVO book;
  final bool isAudio;
  final double imageHeight;
  final Function(BookVO) onPressedBook;
  final Function(BookVO) onTapBook;
  final bool isHome;

  BookView(this.book, this.imageHeight,this.onPressedBook,this.onTapBook,{this.isAudio = false, required this.isHome});

  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          //height: (isShowCase)?BOOK_SHOWCASSE_HEIGHT:AUDIOBOOK_VIEW_WIDTH,
          height: widget.imageHeight,
          // width: 180,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(""),
              ),
              Positioned.fill(
                //alignment: Alignment.topLeft,
                child: GestureDetector(
                  onLongPress: ()=>widget.onPressedBook(widget.book),
                  onTap: () {
                    setState(() {
                      widget.book?.openedDate=DateTime.now().toString();
                      // debugPrint("Date Time===>${widget.book?.openedDate}");
                      widget.onTapBook(widget.book);

                    });
                  },
                  child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
                        child: Image.network(
                          widget.book.bookImage?? "",
                          fit: BoxFit.fill,
                        ),
                      )),
                ),
              ),
              Visibility(
                visible: widget.isHome,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.book.openedDate=DateTime.now().toString();
                      widget.onTapBook(widget.book);
                      debugPrint("Date Time===>${widget.book.openedDate}");
                    });
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: MARGIN_MEDIUM),
                      child: Text("...",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: TEXT_REGULAR_3X)),
                    )
                  ),
                ),
              ),
              Visibility(
                visible: widget.isHome,
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: MARGIN_MEDIUM,top: MARGIN_MEDIUM),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM,vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(MARGIN_SMALL),
                          color: Colors.black54,
                        ),
                        child: Text("Sample",style:TextStyle(color: Colors.white70,fontWeight: FontWeight.bold,fontSize: TEXT_SMALL)),
                      ),
                    )
                ),
              ),
              Visibility(
                visible: widget.isHome,
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: MARGIN_MEDIUM,bottom: MARGIN_MEDIUM),
                      child: Container(
                        //padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM,vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(MARGIN_SMALL),
                          color: Colors.black54,
                        ),
                        child: Icon(Icons.check,color: Colors.white70,)
                      ),
                    )
                ),
              ),
              Visibility(
                visible: false,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MARGIN_SMALL_X, left: MARGIN_MEDIUM),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(MARGIN_SMALL),
                      ),
                      child: Icon(
                        Icons.headphones,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: MARGIN_MEDIUM,),
        Flexible(
          flex: 2,
          child: Text(
            widget.book.title?? "",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: SMS_CODE_COLOR, fontSize: TEXT_REGULAR),
          ),
        ),
        Text(
          widget.book.author?? "",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: SMS_CODE_COLOR, fontSize: TEXT_REGULAR),
        )
      ],
    );
  }
}