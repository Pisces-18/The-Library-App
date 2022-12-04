import 'package:flutter/cupertino.dart';
import 'package:the_library_app/data/models/book_model_impl.dart';
import 'package:the_library_app/data/vos/shelf_vo.dart';

import '../data/models/book_model.dart';
import '../data/vos/book_category_vo.dart';
import '../data/vos/book_vo.dart';
import '../resources/datas.dart';

class CreateShelfBloc extends ChangeNotifier{
  ///States
  List<BookVO> bookList=[];
  List<ShelfVO>? shelfList;
  bool isDispose=false;

  ///Model
  BookModel bBookModel=BookModelImpl();

  CreateShelfBloc(String shelfName,){

    ///Get Shelf From Database
    // bBookModel.getAllShelfFromDatabase()?.listen((shelves) {
    //   shelfList=shelves;
    //   debugPrint("Shelf List From Database===>$shelfList");
    //  //debugPrint("Shelf Name===>${shelfList?[0].shelfName}");
    //  notifyListeners();
    // }).onError((error){
    //   debugPrint("Shelf List From Database===>$error");
    // });

    ///Save Shelf
    //savingShelf(shelfName);
  }

  void savingShelf(String shelfName){
    bBookModel.saveShelf(shelfName);
    debugPrint("Shelf Name===>$shelfName");
    notifyListeners();
  }

  // void notifySafely(){
  //   if(isDispose==false){
  //     notifyListeners();
  //   }
  // }

}