import 'package:flutter/cupertino.dart';
import 'package:the_library_app/data/models/book_model_impl.dart';

import '../data/models/book_model.dart';
import '../data/vos/book_category_vo.dart';
import '../data/vos/book_vo.dart';

class HomeBloc extends ChangeNotifier{
  ///States
  List<BookCategoryVO>? bookLists;
  List<BookVO>? books;
  bool isDispose=false;

  ///Model
    BookModel bBookModel=BookModelImpl();

  HomeBloc(){
    ///Book List from Network
    bBookModel.getBookListName()?.then((book)async{
      await Future.delayed(Duration(seconds: 3));
      bookLists=book;
      notifyListeners();
    });

    ///Book List From Database
    bBookModel.getBookCategoriesFromDatabase()?.listen((bookList)async{
      await Future.delayed(Duration(seconds: 3));
         bookLists=bookList?? [];

      //debugPrint("Bloc==>${bookLists?.first.listName}");
      notifyListeners();
      //notifyListeners();
    }).onError((error){
      debugPrint("Bloc Error==>$error");
    });

    ///Get Books from Database/ Banner Book List
    bBookModel.getBooksFromDatabase()?.listen((booksFromDatabase)async {
      books=booksFromDatabase;
      debugPrint("Book List From Database===>$books");
      notifyListeners();
    }).onError((error){
      debugPrint("Bloc Books From Database Error==>$error");
    });
  }
  // void notifySafely(){
  //   if(isDispose==false){
  //     notifyListeners();
  //   }
  // }
}