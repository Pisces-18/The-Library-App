import 'package:flutter/cupertino.dart';
import 'package:the_library_app/data/models/book_model_impl.dart';
import 'package:the_library_app/data/vos/shelf_vo.dart';

import '../data/models/book_model.dart';
import '../data/vos/book_category_vo.dart';
import '../data/vos/book_vo.dart';
import '../resources/datas.dart';

class ShelfDetailsBloc extends ChangeNotifier{
  ///States
  ShelfVO? shelf;
  bool isDispose=false;
  List<String> bookCategories=[];
 // List<ShelfVO>? shelfList;

  ///Model
  BookModel bBookModel=BookModelImpl();

  ShelfDetailsBloc(ShelfVO oldShelf){

    ///Rename Shelf
     // renameShelfName(newShelfName, oldShelf);

    ///Get Shelf From Database
    bBookModel.getShelfFromDatabase(oldShelf.shelfId?? 0)?.listen((getShelf) {
      shelf=getShelf;
      bookCategories=shelf?.bookList?.map((book) => book.listName?? "").toSet().toList()?? [];
      debugPrint("Shelf List From Database===>$shelf");
      debugPrint("Shelf Name===>${shelf?.shelfName}");
      debugPrint("Books in shelf===>${shelf?.bookList}");

      notifyListeners();
    }).onError((error){
      debugPrint("Shelf List From Database===>$error");
    });

    ///Get Book By Shelf Name




  }

  void deleteShelfByName(int shelfId){
    bBookModel.deleteShelfFromDatabase(shelfId);
    notifyListeners();
  }

  void renameShelfName(String newShelfName,ShelfVO oldShelf){
    bBookModel.renameShelf(newShelfName, oldShelf);
    notifyListeners();
  }

  void bookByTitle(){
    if(shelf != null){
      shelf?.bookList?.sort((a,b)=>(a.title).toString().compareTo((b.title).toString()));
    }
  }

  void bookByAuthor(){
    if(shelf != null){
      shelf?.bookList?.sort((a,b)=>(a.author).toString().compareTo((b.author).toString()));
    }
  }

  void bookByRecentlyOpened(){
    if(shelf != null){
      shelf?.bookList?.sort((a,b)=>DateTime.parse(b.openedDate?? "").compareTo(DateTime.parse(a.openedDate?? "")));
    }
  }
  void getBooksByBookCategory(String bookCategory){
    if(bookCategories != ""){
     // _getBookByCategoryAndRefresh(bookCategory);
    }
  }

  // void _getBookByCategoryAndRefresh(String bookCategory){
  //   bBookModel.getBooksByBookCategoryFromDatabase(bookCategory)?.listen((books) {
  //     shelf?.bookList=books;
  //     notifyListeners();
  //   }).onError((error){
  //     debugPrint(error);
  //   });
  // }

  // void notifySafely(){
  //   if(isDispose==false){
  //     notifyListeners();
  //   }
  // }

}