import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../../data/vos/book_vo.dart';
import '../hive_constants.dart';

class BookDao{
  static final BookDao _singleton = BookDao._internal();

  factory BookDao() {
    return _singleton;
  }
  BookDao._internal();

  void saveAllBooks(List<BookVO> books)async{
    Map<String, BookVO> bookMap = Map.fromIterable(books,
        key: (books) => books?.title, value: (books) => books);
    await getBookBox().putAll(bookMap);
  }

  void saveBook(BookVO? book)async{
    return getBookBox().put(book?.title, book!);
  }

  List<BookVO> getAllBooks(){
    List<BookVO> b=getBookBox().values.toList();
    b.forEach((book) {
      debugPrint("Book title====>${book.title}");
    });
    return getBookBox().values.toList();
  }

  BookVO? getSingleBook(String title){
    return getBookBox().get(title);
  }

  ///Reactive Programming
  Stream<void> getAllBookEventStream(){
    return getBookBox().watch();
  }

  Stream<List<BookVO>> getAllBookStream(){
    return Stream.value(getAllBooks());
  }

  Stream<BookVO?> getSingleBookStream(String title){
    return Stream.value(getSingleBook(title));
  }

  List<BookVO> getBooks(){
    if(getAllBooks().isNotEmpty){
      debugPrint("Database book===>${getAllBooks()}");
      return getAllBooks();
    }else{
      return [];
    }
  }

  BookVO? getBook(String title){
    if(getSingleBook(title) !=null){
      return getSingleBook(title);
    }else{
      return null;
    }
  }

  Box<BookVO> getBookBox() {
    return Hive.box<BookVO>(BOX_NAME_BOOK_VO);
  }

}