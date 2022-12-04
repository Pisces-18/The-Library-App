import 'package:flutter/cupertino.dart';
import 'package:the_library_app/data/models/book_model_impl.dart';
import 'package:the_library_app/data/vos/shelf_vo.dart';

import '../data/models/book_model.dart';
import '../data/vos/book_category_vo.dart';
import '../data/vos/book_vo.dart';
import '../resources/datas.dart';

class SearchBookBloc extends ChangeNotifier{
  ///States
  List<BookVO>? bookList;
  bool isDispose=false;
  ///Model
  BookModel bBookModel=BookModelImpl();

  SearchBookBloc(String searchBookName){

  }

  void searchBook(String searchBookName){
    _getBookListBySearchBookName(searchBookName);
  }

  void _getBookListBySearchBookName(String searchBookName){
    ///Book List from Network
    bBookModel.getSearchBookList(searchBookName)?.then((books){
      bookList=books;
      debugPrint("Searching Book===>$bookList");
      notifyListeners();
    });




  }


  // void notifySafely(){
  //   if(isDispose==false){
  //     notifyListeners();
  //   }
  // }

}