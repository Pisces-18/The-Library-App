import 'package:flutter/material.dart';
import '../data/vos/book_vo.dart';
import '../resources/datas.dart';
import '../resources/dimens.dart';
import '../widgets/book_view.dart';

class BookListView extends StatelessWidget {
  final bool isAudio;
  final Function(BookVO) onPressedBook;
  final Function(BookVO) onTapBook;
  final int count;
  final bool isHome;
  final List<BookVO> books;
  BookListView(this.isAudio,this.onPressedBook,this.onTapBook,this.count, this.isHome,this.books);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: count,
          mainAxisExtent: (isAudio)?BOOK_GRIDVIEW_AUDIO_HEIGHT:BOOK_GRIDVIEW_EXTENT,
          mainAxisSpacing: MARGIN_MEDIUM_2,
          crossAxisSpacing: MARGIN_MEDIUM_2,),
        itemCount: books.length,
        itemBuilder: (BuildContext context, int index){
          return BookView(books[index],isAudio:isAudio,(isAudio)?AUDIOBOOK_VIEW_WIDTH:BOOK_SHOWCASE_HEIGHT,(book)=>onPressedBook(book),(book)=>onTapBook(book), isHome: isHome,);
        });
  }
}
