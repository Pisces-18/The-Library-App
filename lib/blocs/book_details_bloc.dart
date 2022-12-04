import 'package:flutter/cupertino.dart';
import 'package:the_library_app/data/models/book_model_impl.dart';

import '../data/models/book_model.dart';
import '../data/vos/book_category_vo.dart';
import '../data/vos/book_vo.dart';
import '../resources/datas.dart';

class BookDetailsBloc extends ChangeNotifier{
  ///States
  BookVO? book;
  bool isDispose=false;

  ///Model
  BookModel bBookModel=BookModelImpl();

  BookDetailsBloc(String listName,String title,String openedDate){
    ///Save Book To Database
    saveBook(listName,title,openedDate);

    ///Get Books from database
    // bBookModel.getBooksFromDatabase()?.listen((list) {
    //   debugPrint("Books From database ==>${list.first.author}");
    // }).onError((error){
    //   debugPrint("Books From database Error==>$error");
    // });

    ///Get Book From Database
    bBookModel.getSingleBookFromDatabase(title)?.listen((bookDetails) {
      book=bookDetails;
      notifyListeners();
      debugPrint("Book From database ==>${book?.title}");

    }).onError((error){
      debugPrint("Book From database Error==>$error");

    });

  }
  void saveBook(String listName,String title,String openedDate){
   bBookModel.saveBookToDatabase(listName,title,openedDate);
   notifyListeners();
    //bBookModel.saveBooksToDatabase(listName, title);
    //bBookModel.getBooksFromDatabase();
  }
  // void notifySafely(){
  //   if(isDispose==false){
  //     notifyListeners();
  //   }
  // }
}