import 'package:flutter/cupertino.dart';

import '../data/vos/book_vo.dart';
import '../resources/dimens.dart';
import '../widgets/book_title_and_image_view.dart';

class BookResultView extends StatefulWidget {
  final double imageHeight;
  final double imageWidth;
  final Function(BookVO) onTapBook;
  final bool isLibrary;
  final List<BookVO> books;
  BookResultView(this.imageHeight,this.imageWidth,this.onTapBook,this.books,{this.isLibrary=false});

  @override
  State<BookResultView> createState() => _BookResultViewState();
}

class _BookResultViewState extends State<BookResultView> {
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,vertical: MARGIN_MEDIUM_3),
      child: ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: widget.books.length,
          itemBuilder: (BuildContext context,int index){
            return GestureDetector(
              onTap: ()=>widget.onTapBook(widget.books[index]),
              child: Column(
                children: [
                  BookTitleAndImageView(widget.imageHeight,widget.imageWidth,isLibrary: widget.isLibrary,widget.books?[index]),
                  SizedBox(height: 30,)
                ],
              ),
            );
          }),
    );
  }
}
