import 'package:hive/hive.dart';
import 'package:the_library_app/data/vos/book_category_vo.dart';

import '../hive_constants.dart';

class BookCategoryDao{
  static final BookCategoryDao _singleton = BookCategoryDao._internal();

  factory BookCategoryDao() {
    return _singleton;
  }
  BookCategoryDao._internal();

  void saveAllBookCategories(List<BookCategoryVO> bookCategories)async{
    Map<String, BookCategoryVO> bookCategoryMap = Map.fromIterable(bookCategories,
        key: (bookCategory) => bookCategory.listName, value: (bookCategory) => bookCategory);
    await getBookCategoryBox().putAll(bookCategoryMap);
  }

  void saveBookCategory(BookCategoryVO bookCategory)async{
    return getBookCategoryBox().put(bookCategory.listName, bookCategory);
  }

  List<BookCategoryVO> getAllBookCategories(){
    return getBookCategoryBox().values.toList();
}
 BookCategoryVO? getSingleBookCategory(String listName){
    return getBookCategoryBox().get(listName);
}

///Reactive Programming
  Stream<void> getAllBookCategoriesEventStream(){
    return getBookCategoryBox().watch();
  }

  Stream<List<BookCategoryVO>> getAllBookCategoriesStream(){
    return Stream.value(getAllBookCategories());
  }

  Stream<BookCategoryVO?> getSingleBookCategoryStream(String listName){
    return Stream.value(getSingleBookCategory(listName));
  }

  List<BookCategoryVO> getBookCategories(){
    if(getAllBookCategories().isNotEmpty){
      return getAllBookCategories();
    }else{
      return [];
    }
  }

  BookCategoryVO? getBookCategory(String listName){
    if(getSingleBookCategory(listName) !=null){
      return getSingleBookCategory(listName);
    }else{
      return null;
    }
  }

  Box<BookCategoryVO> getBookCategoryBox() {
    return Hive.box<BookCategoryVO>(BOX_NAME_BOOK_CATEGORY_VO);
  }

}