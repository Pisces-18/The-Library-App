import 'package:flutter/cupertino.dart';
import 'package:the_library_app/data/models/book_model_impl.dart';
import 'package:the_library_app/data/vos/shelf_vo.dart';

import '../data/models/book_model.dart';
import '../data/vos/book_category_vo.dart';
import '../data/vos/book_vo.dart';
import '../resources/datas.dart';

class AddBookToShelvesBloc extends ChangeNotifier{
  ///States
  List<ShelfVO>? shelfList;
  List<bool> selectedItemValueList=[];
  bool isDispose=false;

  ///Model
  BookModel bBookModel=BookModelImpl();

  AddBookToShelvesBloc(){

    ///Get Shelves From Database
    bBookModel.getAllShelfFromDatabase()?.listen((shelves) {
      shelfList=shelves;

      // for(int i=0;i<(shelves?.length ?? 0);i++){
      //   debugPrint("Shelf Length===>${shelves?.length}");
      //   selectedItemValueList.add(false);
      //   shelfList?[i].isCheck=false;
      //   debugPrint(selectedItemValueList[i].toString());
      // }
      debugPrint("Shelf List From Database===>$shelfList");
      //debugPrint("Book Name from Shelf===>${shelfList?[0].bookList?[0]?.title}");
      notifyListeners();
    });


  }
  void addBookToShelf(int shelfId,BookVO book)async{
    debugPrint("Adding book to shelf===>${book.listName}");
   bBookModel.addingBookToShelf(shelfId, book);
    notifyListeners();
  }

  // void notifySafely(){
  //   if(isDispose==false){
  //     notifyListeners();
  //   }
  // }

}