import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_library_app/blocs/home_bloc.dart';
import 'package:the_library_app/blocs/library_bloc.dart';
import 'package:the_library_app/pages/add_shelves_page.dart';
import 'package:the_library_app/pages/create_shelf_page.dart';
import 'package:the_library_app/pages/home_page.dart';
import 'package:the_library_app/pages/search_book_page.dart';
import 'package:the_library_app/resources/colors.dart';
import 'package:the_library_app/resources/datas.dart';
import 'package:the_library_app/resources/dimens.dart';
import 'package:the_library_app/viewers/book_list_view.dart';
import 'package:the_library_app/viewers/bottomsheet_view.dart';

import '../data/vos/book_vo.dart';
import '../data/vos/shelf_vo.dart';
import '../resources/strings.dart';
import '../viewers/book_result_view.dart';
import '../viewers/library_bottomsheet_view.dart';
import '../viewers/search_bar_view.dart';
import '../viewers/tab_bar_section_view.dart';
import '../viewers/your_books_tab_view.dart';
import '../viewers/your_shelves_tab_view.dart';
import '../widgets/multiple_chip_view.dart';

class LibraryPage extends StatefulWidget {
late bool isShelves;
late int i;

LibraryPage(this.isShelves,this.i,);
  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  ViewASFormation viewASFormation = ViewASFormation.SMALL_GRID;
  bool isList = false;
 // bool isShelves = false;
  //int i = 0;
  int _selectedIndex = 1;
  String shelfName="";
  // @override
  // void initState(){
  //   super.initState();
  //   i=widget.shelfIndex;
  // }
  // @override
  // void dispose() {
  //   LibraryBloc bloc=Provider.of<LibraryBloc>(context,listen: false);
  //   bloc.isDispose=true;
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>LibraryBloc(shelfName),
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SearchBarView(() => _navigateToSearchBookPage(context)),
                TabBarSectionView(LIBRARY_TAB_TEXT1, LIBRARY_TAB_TEXT2, (index) {
                  setState(() {
                    widget.i = index;
                    if(widget.i==0){
                      widget.isShelves=false;
                    }else{
                      widget.isShelves=true;
                    }
                  });
                },widget.i),

                (widget.i == 0)
                    ? Selector<LibraryBloc, List<String>>(
                  selector: (context ,bloc )=>bloc.bookCategories?? [],
                  builder: (context, bookCategory, child)=>Selector<LibraryBloc, List<BookVO>>(
                  selector: (context ,bloc )=>bloc.bookList?? [],
                  builder: (context, books, child)=>YourBooksTabView(viewASFormation, isList, (book) {
                          setState(() {
                            showSheet(context, addBookFunctionList, (text){
                              setState(() {
                                if(text=="Add to shelves"){
                                  _navigateToAddShelvesPage(context,text,book);
                                }
                              });
                            },book);
                        });}, (type) {
                            setState(() {
                              if (type == "List") {
                                viewASFormation = ViewASFormation.LIST;
                                isList = true;
                              } else if (type == "Large grid") {
                                viewASFormation = ViewASFormation.LARGE_GRID;
                                isList = false;
                              } else if (type == "Small grid") {
                                viewASFormation = ViewASFormation.SMALL_GRID;
                                isList = false;
                              }else if (type == "Title"){
                                LibraryBloc bloc =
                                Provider.of<LibraryBloc>(context, listen: false);
                                bloc.bookByTitle();
                              }else if (type == "Author"){
                                LibraryBloc bloc =
                                Provider.of<LibraryBloc>(context, listen: false);
                                bloc.bookByAuthor();
                              }else if (type == "Recently opened"){
                                LibraryBloc bloc =
                                Provider.of<LibraryBloc>(context, listen: false);
                                bloc.bookByRecentlyOpened();
                              }
                            });
                          }, tabList1, tabList2,books,(bookCategory){
                      LibraryBloc bloc =
                      Provider.of<LibraryBloc>(context, listen: false);
                      bloc.getBooksByBookCategory(bookCategory);
                  },bookCategory),
                      ),
                    )
                    : Selector<LibraryBloc,List<ShelfVO>>(
                    selector: (context ,bloc )=>bloc.shelfList?? [],
                    builder: (context, shelves, child)=>YourShelvesTabView(shelves))
              ],
            ),
          ),
        ),
        floatingActionButton: Visibility(
          visible: widget.isShelves,
          child: TextButton(
            onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateShelfPage(onCreate: (text ) {
              setState(() {
                Navigator.pop(context);
                shelfName=text;
                debugPrint(text);
              });
            },))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/images/edit.png",
                    width: MARGIN_MEDIUM_2,
                    height: MARGIN_MEDIUM_2,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: MARGIN_MEDIUM,
                  ),
                  Text(
                    "Create new",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
                if(index==0){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                }else if(index==1){

                }
                // debugPrint("Index ==>$_selectedIndex");
                // _myPage.jumpToPage(_selectedIndex);
              });
            },
            selectedIconTheme: const IconThemeData(color: Colors.blue),
            unselectedIconTheme: const IconThemeData(
              color: SMS_CODE_COLOR,
            ),
            selectedItemColor: Colors.blue,
            unselectedItemColor: SMS_CODE_COLOR,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_rounded,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.my_library_books_outlined,
                  ),
                  label: "Library"),
            ]),
      ),
    );
  }

  Future<dynamic> _navigateToAddShelvesPage(
          BuildContext context, String title,BookVO book) =>
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AddShelvesPage(title,book)));
  Future<dynamic> _navigateToSearchBookPage(BuildContext context) =>
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SearchBookPage()));
}
