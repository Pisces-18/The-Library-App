import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_library_app/pages/home_page.dart';
import 'package:the_library_app/resources/dimens.dart';
import 'package:the_library_app/viewers/tab_bar_section_view.dart';
import 'package:the_library_app/viewers/title_and_book_view.dart';

import '../blocs/search_book_bloc.dart';
import '../data/vos/book_vo.dart';
import '../resources/colors.dart';
import '../resources/strings.dart';
import '../viewers/book_result_view.dart';
import '../widgets/book_title_and_image_view.dart';
import '../widgets/title_and_see_more_view.dart';
import 'book_detail_page.dart';

class SearchBookPage extends StatefulWidget {
  const SearchBookPage({Key? key}) : super(key: key);

  @override
  State<SearchBookPage> createState() => _SearchBookPageState();
}

class _SearchBookPageState extends State<SearchBookPage> {
  double e = 1;
  int index = 0;
  bool _seeAction = false;
  String bookName="";
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchBookBloc(bookName),
      child: Scaffold(
        appBar: AppBar(
          elevation: e,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: APPBAR_COLOR,
            ),
          ),
          title: Selector<SearchBookBloc,List<BookVO>>(
            selector: (context, bloc) => bloc.bookList ?? [],
            builder: (context, shelves, child) => TextField(
              controller: _textController,
              onSubmitted: (text) {
                setState(() {
                  e = 0;
                  _seeAction = true;
                  debugPrint(_textController.text);
                  SearchBookBloc bloc =
                      Provider.of<SearchBookBloc>(context,
                          listen: false);
                  bloc.searchBook(_textController.text);
                });
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white70,
                  hintText: SEARCH_PLAY_BOOKS_TEXT,
                  hintStyle: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: TEXT_REGULAR)),
            ),
          ),
          actions: [
            Visibility(
              visible: _seeAction,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    TextEditingController().clear();
                    _seeAction = false;
                    _textController.clear();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: MARGIN_MEDIUM_2),
                  child: Image.asset(
                    "assets/images/cross.png",
                    width: MARGIN_MEDIUM_2,
                    height: MARGIN_MEDIUM_2,
                  ),
                ),
              ),
            )
          ],
        ),
        body: Visibility(
          visible: _seeAction,
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabBarSectionView(EBOOK_TEXT,AUDIO_BOOK_TEXT,(i) {
                    setState(() {
                      index = i;
                    });
                  },0),
                  Selector<SearchBookBloc,List<BookVO>>(
                    selector: (context, bloc) => bloc.bookList ?? [],
                    builder: (context, books, child) =>  BookResultSectionView(books,
                        index, (book) => _navigateToBookDetailPage(context,book)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _navigateToBookDetailPage(BuildContext context,BookVO book) =>
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BookDetailPage(listName: book.listName?? "",title: book.title ?? "", openedDate: book.openedDate ?? "",)));
}

class BookResultSectionView extends StatelessWidget {
  final List<BookVO> bookList;
  final int index;
  final Function(BookVO) onTapBook;
  BookResultSectionView(this.bookList,this.index, this.onTapBook);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_3),
      child: Column(
        children: [
          TitleAndSeeMoreView(
            SEARCH_PAGE_TEXT,
            (p0, p1) {},
            seeMore: false,
          ),
          (index == 0)
              ? BookResultView(90, 60, (book) => onTapBook(book),bookList)
              : BookResultView(50, 50, (book) => onTapBook(book),bookList),
        ],
      ),
    );
  }
}
