import 'package:flutter/cupertino.dart';
import 'package:the_library_app/data/models/book_model_impl.dart';
import 'package:the_library_app/data/vos/shelf_vo.dart';

import '../data/models/book_model.dart';
import '../data/vos/book_category_vo.dart';
import '../data/vos/book_vo.dart';
import '../resources/datas.dart';

class LibraryBloc extends ChangeNotifier{
  ///States
  List<BookVO>? bookList;
  List<String> bookCategories=[];
  List<ShelfVO>? shelfList;
  bool isDispose=false;

  ///Model
  BookModel bBookModel=BookModelImpl();

  LibraryBloc(String shelfName){
    ///Get Books from Database
    bBookModel.getBooksFromDatabase()?.listen((booksFromDatabase) {
      bookList=booksFromDatabase;
      bookCategories=bookList?.map((book) => book.listName?? "").toList()?? [];
      var bookCategoriesSet = Set<String>();
      bookCategories = bookCategories.where((listName) => bookCategoriesSet.add(listName)).toList();
      debugPrint("Book List Name From Database===>$bookCategories");
      debugPrint("Book List From Database===>$bookList");
      notifyListeners();
    }).onError((error){
      debugPrint("Bloc Books From Database Error==>$error");
    });

    ///Get Shelves From Database
    bBookModel.getAllShelfFromDatabase()?.listen((shelves) {
      shelfList=shelves;
      debugPrint("Shelf List From Database===>$shelfList");
      //debugPrint("Book List From Shelf===>${shelfList?[0].bookList}");
      notifyListeners();
    }).onError((error){
      debugPrint("Shelf List From Database===>$error");
    });

    ///Save Shelf
    //savingShelf(shelfName);
  }

  // void savingShelf(String shelfName){
  //   bBookModel.saveShelf(shelfName, bookList?[0]);
  //   notifyListeners();
  // }

  void bookByTitle(){
    if(bookList?.isNotEmpty?? false){
      bookList?.sort((a,b)=>(a.title).toString().compareTo((b.title).toString()));
    }
  }

  void bookByAuthor(){
    if(bookList?.isNotEmpty?? false){
      bookList?.sort((a,b)=>(a.author).toString().compareTo((b.author).toString()));
    }
  }

  void bookByRecentlyOpened(){
    if(bookList?.isNotEmpty?? false){
      bookList?.sort((a,b)=>DateTime.parse(b.openedDate?? "").compareTo(DateTime.parse(a.openedDate?? "")));
    }
  }

  void getBooksByBookCategory(String bookCategory){
    if(bookCategories != ""){
      _getBookByCategoryAndRefresh(bookCategory);
    }
  }

  void _getBookByCategoryAndRefresh(String bookCategory){
    bBookModel.getBooksByBookCategoryFromDatabase(bookCategory)?.listen((books) {
      bookList=books;
      notifyListeners();
    }).onError((error){
      debugPrint(error);
    });
  }
  // void notifySafely(){
  //   if(isDispose==false){
  //     notifyListeners();
  //   }
  // }
}