import 'package:flutter/cupertino.dart';
import 'package:the_library_app/data/models/book_model_impl.dart';

import '../data/models/book_model.dart';
import '../data/vos/book_category_vo.dart';
import '../data/vos/book_vo.dart';
import '../resources/datas.dart';

class BookShowcaseBloc extends ChangeNotifier {
  ///States
  List<BookVO>? books;
  bool isDispose = false;

  ///Model
  BookModel bBookModel = BookModelImpl();

  BookShowcaseBloc(String listName) {
    ///Book List From Database
    bBookModel.getSingleBookCategoryFromDatabase(listName)?.listen((bookList) {
      books = bookList?.books;
      debugPrint("Show Case bloc==>${books?.first.title}");
      debugPrint("Bloc==>${bookList?.listName}");
      notifyListeners();
    }).onError((error) {
      debugPrint("Bloc Error==>$error");
    });
  }
  // void notifySafely() {
  //   if (isDispose == false) {
  //     notifyListeners();
  //   }
  // }
}
