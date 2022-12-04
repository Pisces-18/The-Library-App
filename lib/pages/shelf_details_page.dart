import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_library_app/blocs/shelf_details_bloc.dart';
import 'package:the_library_app/pages/create_shelf_page.dart';
import 'package:the_library_app/pages/library_page.dart';
import 'package:the_library_app/resources/colors.dart';

import '../data/vos/shelf_vo.dart';
import '../resources/datas.dart';
import '../resources/dimens.dart';
import '../viewers/bottomsheet_view.dart';
import '../viewers/shelves_bottom_sheet_view.dart';
import '../viewers/your_books_tab_view.dart';
import '../widgets/shelves_title_and_number_of_book_view.dart';

class ShelvesDetailsPage extends StatefulWidget {
  late ShelfVO? shelf;

  ShelvesDetailsPage(this.shelf);
  @override
  State<ShelvesDetailsPage> createState() => _ShelvesDetailsPageState();
}

class _ShelvesDetailsPageState extends State<ShelvesDetailsPage> {
  String shelfName="";
  ViewASFormation viewASFormation = ViewASFormation.SMALL_GRID;
  bool isList = false;
  bool isTextField = false;
   String newShelfName="";
  TextEditingController _textController=TextEditingController();
  // @override
  // void dispose() {
  //   ShelfDetailsBloc bloc =
  //       Provider.of<ShelfDetailsBloc>(context, listen: false);
  //   bloc.isDispose = true;
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShelfDetailsBloc(widget.shelf!),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () => _navigateToLibraryPage(context),
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: SMS_CODE_COLOR,
            ),
          ),
          actions: [
            Selector<ShelfDetailsBloc,ShelfVO?>(
              selector: (context, bloc) => bloc.shelf,
              builder: (context, shelfDel, child) => GestureDetector(
                onTap: () {
                  showShelvesBottomSheet(context, widget.shelf?.shelfName ?? "",
                      shelvesDetailsFunctionList, (text) {
                    setState(() {
                      if (text == "Rename shelf") {
                        isTextField = true;
                        _textController.text=widget.shelf?.shelfName ?? "";
                      }else if(text == "Delete shelf"){
                        ShelfDetailsBloc bloc=Provider.of<ShelfDetailsBloc>(context,listen: false);
                        bloc.deleteShelfByName(shelfDel?.shelfId?? 0);
                        _navigateToLibraryPage(context);
                      }
                    });
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: MARGIN_MEDIUM_2, top: MARGIN_SMALL_X),
                  child: Text("...",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: TEXT_REGULAR_3X)),
                ),
              ),
            )
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Selector<ShelfDetailsBloc, ShelfVO?>(
                  selector: (context, bloc) => bloc.shelf,
                  builder: (context, getShelf, child) => Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(
                        horizontal: MARGIN_MEDIUM_2, vertical: MARGIN_MEDIUM_2),
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(color: SMS_CODE_COLOR1),
                    )),
                    child: (isTextField)
                        ? TextField(
                            controller: _textController,
                            autofocus: true,
                            maxLength: 50,
                            style: const TextStyle(
                                fontSize: TEXT_HEADING_2X,
                                color: SMS_CODE_COLOR,
                                fontWeight: FontWeight.w500),
                            onSubmitted: (text) {
                              setState(() {
                                debugPrint("Text Field=====>$text");
                                isTextField = false;
                                //widget.shelf?.shelfName=text;
                                newShelfName=text;
                                ShelfDetailsBloc bloc =
                                    Provider.of<ShelfDetailsBloc>(context,
                                        listen: false);
                                bloc.renameShelfName(text, getShelf!);
                                Navigator.pop(context);
                              });
                            },
                            decoration: InputDecoration(
                              //contentPadding: EdgeInsets.symmetric(vertical: -1),


                              filled: false,
                            ),
                          )
                        : ShelvesTitleAndNumberOfBookView(
                            getShelf?.shelfName ?? "",
                            TEXT_HEADING_1X,widget.shelf?.bookList?.length ?? 0
                          ),
                  ),
                ),
                Selector<ShelfDetailsBloc, ShelfVO?>(
                  selector: (context ,bloc )=>bloc.shelf,
                  builder: (context, shelf, child)=>Selector<ShelfDetailsBloc, List<String>?>(
                    selector: (context ,bloc )=>bloc.bookCategories,
                    builder: (context, categoryList, child)=>YourBooksTabView(viewASFormation, isList, (book) {
                      showSheet(context, addBookFunctionList, (type) {
                        // if(type=="Rename shelf"){
                        //
                        // }
                      }, book);
                    }, (type) {
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
                          ShelfDetailsBloc bloc =
                          Provider.of<ShelfDetailsBloc>(context, listen: false);
                          bloc.bookByTitle();
                        }else if (type == "Author"){
                          ShelfDetailsBloc bloc =
                          Provider.of<ShelfDetailsBloc>(context, listen: false);
                          bloc.bookByAuthor();
                        }else if (type == "Recently opened"){
                          ShelfDetailsBloc bloc =
                          Provider.of<ShelfDetailsBloc>(context, listen: false);
                          bloc.bookByRecentlyOpened();
                        }
                      });
                    }, tabList3, [], widget.shelf?.bookList?? [], (bookCategory) {
                      ShelfDetailsBloc bloc =
                      Provider.of<ShelfDetailsBloc>(context, listen: false);
                      bloc.getBooksByBookCategory(bookCategory);
                    }, categoryList),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _navigateToLibraryPage(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context)=>LibraryPage(true,1)));
}
