import 'package:flutter/material.dart';
import 'package:the_library_app/pages/add_shelves_page.dart';
import 'package:the_library_app/resources/colors.dart';
import 'package:the_library_app/resources/datas.dart';
import 'package:the_library_app/resources/dimens.dart';
import 'package:the_library_app/viewers/book_list_view.dart';
import 'package:the_library_app/viewers/bottomsheet_view.dart';

import '../data/vos/book_vo.dart';
import '../resources/strings.dart';
import '../viewers/book_result_view.dart';
import '../viewers/library_bottomsheet_view.dart';
import '../viewers/tab_bar_section_view.dart';
import '../widgets/chip_view.dart';
import '../widgets/multiple_chip_view.dart';

class YourBooksTabView extends StatefulWidget {
  final ViewASFormation viewASFormation;
  final bool isList;
  final Function(BookVO) onTapBook;
  final Function(String) onTapList;
  final List<String> tab1;
  final List<String> tab2;
  final List<BookVO> books;
  final Function(String) onTapChip;
  final List<String>? bookCategories;
  YourBooksTabView(this.viewASFormation, this.isList, this.onTapBook,
      this.onTapList, this.tab1, this.tab2, this.books,this.onTapChip,this.bookCategories);
  @override
  State<YourBooksTabView> createState() => _YourBooksTabViewState();
}

class _YourBooksTabViewState extends State<YourBooksTabView> {
  // ViewASFormation viewASFormation=ViewASFormation.SMALL_GRID;
  //bool isList=false;
  //List<String>? bookCategories;

  // @override
  // void initState(){
  //   super.initState();
  //   bookCategories=widget.books?.map((book) => book.listName?? "").toList()?? [];
  //   var bookCategoriesSet = Set<String>();
  //   bookCategories = bookCategories?.where((listName) => bookCategoriesSet.add(listName)).toList();
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MARGIN_LARGE),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBarListSectionView(widget.bookCategories?? [],(bookCategory)=>widget.onTapChip(bookCategory)),
          ViewAsGridSection(widget.viewASFormation,
              (type) => widget.onTapList(type), widget.isList, widget.books,
              onTapBook: (book) => widget.onTapBook(book)),
        ],
      ),
    );
  }
}

class ViewAsGridSection extends StatefulWidget {
  final ViewASFormation viewASFormation;
  final Function(String) onTapList;
  final bool isList;
  final Function(BookVO) onTapBook;
  final List<BookVO> books;
  ViewAsGridSection(
      this.viewASFormation, this.onTapList, this.isList, this.books,
      {required this.onTapBook});
  @override
  State<ViewAsGridSection> createState() => _ViewAsGridSectionState();
}

class _ViewAsGridSectionState extends State<ViewAsGridSection> {
  String _selectedRadio = "Small grid";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MARGIN_MEDIUM_2, vertical: MARGIN_MEDIUM_2),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          libraryBottomSheet(
                              context, SORT_BY_TEXT, radioSortTextList,
                              (value) {
                            //_selectedRadio = value;
                                setState(() {
                                  debugPrint(value);
                                  widget.onTapList(value);
                                });

                          }, _selectedRadio);
                        });
                      },
                      child: Icon(Icons.sort)),
                  const SizedBox(
                    width: MARGIN_MEDIUM,
                  ),
                  Text(
                    SORT_LIST_TEXT,
                    style: TextStyle(
                        color: SMS_CODE_COLOR,
                        fontSize: TEXT_REGULAR_2X,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              Spacer(),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      libraryBottomSheet(
                          context, VIEW_AS_TEXT, radioGridTextList, (value) {
                        //_selectedRadio = value;
                        debugPrint(value);
                        widget.onTapList(value);
                      }, _selectedRadio);
                    });
                  },
                  child: (widget.isList)
                      ? Icon(Icons.grid_view_outlined)
                      : Icon(Icons.list_alt))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: MARGIN_MEDIUM_3),
            child: ViewAs(
                widget.viewASFormation, (book) => widget.onTapBook(book), widget.books),
          )
        ],
      ),
    );
  }
}

class ViewAs extends StatelessWidget {
  final ViewASFormation viewASFormation;
  final Function(BookVO) onTapBook;
  final List<BookVO> books;
  ViewAs(this.viewASFormation, this.onTapBook, this.books);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _generateView(viewASFormation),
    );
  }

  Widget _generateView(ViewASFormation viewASFormation) {
    switch (viewASFormation) {
      case ViewASFormation.LIST:
        return BookResultView(
          90,
          60,
          (book) => onTapBook(book),
          books,
          isLibrary: true,
        );
      case ViewASFormation.LARGE_GRID:
        return BookListView(
            false, (book) {}, (book) => onTapBook(book), 2, true, books);
      case ViewASFormation.SMALL_GRID:
        return BookListView(
            true, (book) {}, (book) => onTapBook(book), 3, true, books);
    }
  }
}

class TabBarListSectionView extends StatefulWidget {
  final List<String> tab1;
  final Function(String) onTapChip;
  TabBarListSectionView(this.tab1,this.onTapChip);

  @override
  State<TabBarListSectionView> createState() => _TabBarListSectionViewState();
}

class _TabBarListSectionViewState extends State<TabBarListSectionView> {
  String chipText = "";
  bool visibleChip = false;
  @override
  void initState() {
    super.initState();
    debugPrint("Tab Chips==>${widget.tab1}");

    // if(chipText==""){
    //   visibleChip=false;
    // }else{
    //   visibleChip=true;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
      height: 30,

      // color: Colors.red,
      child: ListView(
        physics: ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          Visibility(
            visible: visibleChip,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  visibleChip = false;
                  widget.onTapChip("");
                });
              },
              child: Container(
                width: 30,
                height: 30,
                // padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: SMS_CODE_COLOR)),
                child: Center(
                  child: Text(
                    "X",
                    style: TextStyle(color: SMS_CODE_COLOR),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: MARGIN_MEDIUM,
          ),
          Visibility(visible: visibleChip, child: ChipView(chipText)),
          const SizedBox(
            width: MARGIN_MEDIUM,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
                border: Border.all(color: SMS_CODE_COLOR)),
            child: MultipleChipView(widget.tab1, (text) {
              setState(() {
                chipText = text;
                visibleChip = true;
                widget.onTapChip(chipText);
              });
            }),
          ),
          const SizedBox(
            width: MARGIN_MEDIUM,
          ),


        ],
      ),
    );
  }
}
