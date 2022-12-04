import 'package:flutter/material.dart';

import '../data/vos/book_vo.dart';
import '../widgets/book_view.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../widgets/title_and_see_more_view.dart';

class TitleAndBookView extends StatefulWidget {
  final String title;
  final bool isAudio;
  final Function(String,bool) onTapSeeMore;
  final Function(BookVO) onTapBook;
  final List<BookVO> books;
  TitleAndBookView(this.onTapSeeMore,this.onTapBook,this.books,
      {this.isAudio = false,this.title=""});

  @override
  State<TitleAndBookView> createState() => _TitleAndBookViewState();
}


class _TitleAndBookViewState extends State<TitleAndBookView> {
  @override
  void initState(){
    super.initState();
    debugPrint("List Name Title==>${widget.title}");
    debugPrint("List Name Title2==>${widget.books.first.title}");

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleAndSeeMoreView(widget.title,(title,isAudio)=>widget.onTapSeeMore(title,isAudio),isAudio: widget.isAudio,),
        const SizedBox(
          height: MARGIN_MEDIUM_3,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 3.5,
          child: ListView.builder(
              padding: const EdgeInsets.only(
                left: MARGIN_MEDIUM_2,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: widget.books.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    padding: const EdgeInsets.only(
                      right: MARGIN_MEDIUM_2,
                    ),
                    width: (widget.isAudio)?AUDIOBOOK_VIEW_WIDTH: EBOOK_VIEW_WIDTH,

                    child: BookView(widget.books[index],isAudio: widget.isAudio,AUDIOBOOK_VIEW_WIDTH,(book)=>widget.onTapBook(book),(bookName){}, isHome: false,));
              }),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_3,
        ),
      ],
    );
  }
}


