import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:the_library_app/data/vos/shelf_vo.dart';
import 'package:the_library_app/pages/library_page.dart';

import '../blocs/create_shelf_bloc.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';

class CreateShelfPage extends StatefulWidget {
  const CreateShelfPage({Key? key, required this.onCreate}) : super(key: key);
  final Function(String) onCreate;


  @override
  State<CreateShelfPage> createState() => _CreateShelfPageState();
}

class _CreateShelfPageState extends State<CreateShelfPage> {
  final _textController=TextEditingController();
  String shelf="";
  // @override
  // void dispose() {
  //   CreateShelfBloc bloc=Provider.of<CreateShelfBloc>(context,listen: false);
  //   bloc.isDispose=true;
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>CreateShelfBloc(shelf),
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
            "Create Shelf",
            style: TextStyle(
                color: APPBAR_COLOR,
                fontWeight: FontWeight.w500,
                fontSize: TEXT_REGULAR_3X),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_2, vertical: MARGIN_LARGE),
              child: Selector<CreateShelfBloc,List<ShelfVO>>(
                selector: (context ,bloc )=>bloc.shelfList?? [],
                builder: (context, bookCategory, child)=>TextField(
                  controller: _textController,
                  autofocus: true,
                  maxLength: 50,
                  style: const TextStyle(
                      color: SMS_CODE_COLOR,
                      fontWeight: FontWeight.w400,
                      fontSize: TEXT_HEADING_2X),
                  onSubmitted: (_){
                    setState(() {
                      widget.onCreate(_textController.text);
                      shelf=_textController.text;
                      CreateShelfBloc bloc =
                      Provider.of<CreateShelfBloc>(context, listen: false);
                      bloc.savingShelf(shelf);
                     // Navigator.pop(context);
                     // Navigator.push(context, MaterialPageRoute(builder: (context)=>LibraryPage(shelfIndex: 1,)));
                    });
                  },

                  decoration:  InputDecoration(
                    //contentPadding: EdgeInsets.symmetric(vertical: -1),

                    hintText:"Shelf name",
                    filled: false,
                    hintStyle: TextStyle(
                        fontSize: TEXT_HEADING_2X,
                        color: SMS_CODE_COLOR,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
