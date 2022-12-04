import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocs/add_book_to_shelves_bloc.dart';
import '../data/vos/book_vo.dart';
import '../data/vos/shelf_vo.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../viewers/shelves_list_section_view.dart';

class AddShelvesPage extends StatefulWidget {
  final String title;
  final BookVO book;
  AddShelvesPage(this.title, this.book);

  @override
  State<AddShelvesPage> createState() => _AddShelvesPageState();
}

class _AddShelvesPageState extends State<AddShelvesPage> {
 // List<int> shelfIdList=[];
  int shelfId=2;
  // @override
  // void dispose() {
  //   AddBookToShelvesBloc bloc=Provider.of<AddBookToShelvesBloc>(context,listen: false);
  //   bloc.isDispose=true;
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddBookToShelvesBloc(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            widget.title,
            style: TextStyle(
                color: APPBAR_COLOR,
                fontWeight: FontWeight.w500,
                fontSize: TEXT_REGULAR_3X),
          ),
          centerTitle: true,
          actions: [
            Selector<AddBookToShelvesBloc, List<ShelfVO>>(
            selector: (context, bloc) => bloc.shelfList ?? [],
            builder: (context, shelves, child) => GestureDetector(
                onTap: () {
                  AddBookToShelvesBloc bloc =
                  Provider.of<AddBookToShelvesBloc>(context,
                      listen: false);
                  bloc.addBookToShelf(shelfId, widget.book);
                  Navigator.pop(context);
                  // bloc.addBookToShelf(shelfIdList, widget.book);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: MARGIN_CARD_MEDIUM_2),
                  child: Icon(
                    Icons.close,
                    color: SMS_CODE_COLOR,
                  ),
                ),
              ),
            )
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Selector<AddBookToShelvesBloc, List<ShelfVO>>(
              selector: (context, bloc) => bloc.shelfList ?? [],
              builder: (context, shelves, child) => Selector<AddBookToShelvesBloc, List<bool>>(
                selector: (context, bloc) => bloc.selectedItemValueList,
                builder: (context, selectedItem, child) => ShelvesListSectionView(
                  true,
                  (title) {},
                  shelves,const [],
                  onTapCheckBox: (shelfIndex) {

                      // shelfNameList.add(widget.shelf?.shelfName?? "");
                      // shelfNameList.toSet();
                     // shelfIdList=shelfList;
                     // debugPrint("Check===>$shelfIdList");

                     shelfId=shelfIndex;

                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
