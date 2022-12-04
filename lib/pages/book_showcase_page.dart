import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_library_app/pages/book_detail_page.dart';
import 'package:the_library_app/viewers/bottomsheet_view.dart';
import 'package:the_library_app/widgets/book_view.dart';
import 'package:the_library_app/pages/home_page.dart';
import '../blocs/book_showcase_bloc.dart';
import '../data/vos/book_category_vo.dart';
import '../data/vos/book_vo.dart';
import '../resources/colors.dart';
import '../resources/datas.dart';
import '../resources/dimens.dart';
import '../viewers/book_list_view.dart';

class BookShowCasePage extends StatefulWidget {
  final bool isAudio;
  final String listName;
  BookShowCasePage(this.isAudio, this.listName);

  @override
  State<BookShowCasePage> createState() => _BookShowCasePageState();
}

class _BookShowCasePageState extends State<BookShowCasePage> {
  @override
  // void dispose() {
  //   BookShowcaseBloc bloc=Provider.of<BookShowcaseBloc>(context,listen: false);
  //   bloc.isDispose=true;
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookShowcaseBloc(widget.listName),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios,
                color: APPBAR_COLOR,
              )),
          title: Text(
            widget.listName,
            style: TextStyle(
                color: APPBAR_COLOR,
                fontWeight: FontWeight.w500,
                fontSize: TEXT_REGULAR_3X),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_3, vertical: MARGIN_MEDIUM_3),
          child: SingleChildScrollView(
            child: Selector<BookShowcaseBloc, List<BookVO>?>(
              selector: (context, bloc) => bloc.books,
              builder: (context, bookList, child) => BookListView(
                  widget.isAudio,
                  (book) => showSheet(
                      context, normalBookFunctionList, (text) {}, book),
                  (book) {
                    debugPrint("Date Time===>${book.openedDate}");
                    _navigateToBookDetailPage(
                    context, book.title ?? "", book.openedDate ?? "");
              }, 2, false, bookList ?? []),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _navigateToBookDetailPage(
          BuildContext context, String bookName, String openedDate) =>
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BookDetailPage(
                    listName: widget.listName,
                    title: bookName,
                    openedDate: openedDate,
                  )));
}
