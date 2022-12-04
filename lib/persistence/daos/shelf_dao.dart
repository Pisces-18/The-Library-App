import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:the_library_app/data/vos/shelf_vo.dart';

import '../../data/vos/book_vo.dart';
import '../hive_constants.dart';

class ShelfDao {
  static final ShelfDao _singleton = ShelfDao._internal();

  factory ShelfDao() {
    return _singleton;
  }
  ShelfDao._internal();

  void saveAllShelves(List<ShelfVO?> shelfList) async {
    Map<int, ShelfVO> shelfMap = Map.fromIterable(shelfList,
        key: (shelfList) => shelfList.shelfId ,
        value: (shelfList) => shelfList);
    getShelfBox().putAll(shelfMap);
  }

  void saveSingleShelf(ShelfVO shelf)async{
    return getShelfBox().put(shelf.shelfId, shelf);
  }
  void updateShelfName(int shelfId,ShelfVO shelf)async{
   return getShelfBox().putAt(shelfId, shelf);
  }

  void deleteShelf(int shelfId)async{
   return getShelfBox().deleteAt(shelfId);
  }

  void addBookToShelf(int shelfId,BookVO book)async{
    debugPrint("SelfId===>$shelfId");
    ShelfVO? shelf=getShelfBox().getAt(shelfId);
    debugPrint("Adding book to shelf===>${book.title}");
    //shelf?.bookList=[];
    shelf?.bookList?.add(book);
    debugPrint("S===>${shelf?.bookList}");
    getShelfBox().putAt(shelfId, shelf!);
    debugPrint("Book from Shelf===>${getShelfBox().getAt(shelfId)?.bookList}");

    //debugPrint("Shelf Dao===>$shelf");
    // List<ShelfVO> shelves= getShelfBox().values.toList();
    // List<int> shelfIdList=shelves.map((shelf) => shelf.shelfId?? 0).toList();
    // debugPrint("Shelf Dao===>$shelfId");
    // shelves[shelfId].bookList?.add(book);
    // getShelfBox().putAt(shelfId, shelves[shelfId]);
    // if(shelfIdList.contains(shelfId)){
    //   for(int i=0;i<(shelves.length?? 0);i++){
    //     if(shelfId==shelves[i].shelfId){
    //       shelves[i].bookList?.add(book);
    //       debugPrint("Shelf Dao===>${shelves[i].bookList}");
    //       return getShelfBox().putAt(0, shelves[i]);
    //     }
    //   }
    // }
  }

  // void saveBookToShelf(String shelfName,BookVO book)async{
  //   return getShelfBox().put(shelfName, book);
  // }

  List<ShelfVO>? getAllShelves(){
    return getShelfBox().values.toList();
  }

  ShelfVO? getSingleShelf(int shelfId){
    return getShelfBox().get(shelfId);
  }



  ///Reactive Programming
  Stream<void> getAllShelfEventStream(){
    return getShelfBox().watch();
  }

  Stream<List<ShelfVO>?> getAllShelfStream(){
    return Stream.value(getAllShelves());
  }

  Stream<ShelfVO?> getShelfStream(int shelfId){
    return Stream.value(getSingleShelf(shelfId));
  }

  List<ShelfVO>? getShelves(){
    if(getAllShelves()?.isNotEmpty?? false){
      return getAllShelves();
    }else{
      return [];
    }
  }

  ShelfVO? getShelf(int shelfId){
    if(getSingleShelf(shelfId) !=null){
      return getSingleShelf(shelfId);
    }else{
      return null;
    }
  }

  Box<ShelfVO> getShelfBox() {
    return Hive.box<ShelfVO>(BOX_NAME_SHELF_VO);
  }
}
