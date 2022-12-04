import 'package:flutter/cupertino.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:the_library_app/data/models/book_model.dart';
import 'package:the_library_app/data/vos/book_category_vo.dart';
import 'package:the_library_app/data/vos/book_vo.dart';
import 'package:the_library_app/data/vos/google_book_vo.dart';
import 'package:the_library_app/data/vos/shelf_vo.dart';
import 'package:the_library_app/network/dataagents/book_data_agent.dart';
import 'package:the_library_app/persistence/daos/book_category_dao.dart';
import 'package:the_library_app/persistence/daos/book_dao.dart';
import 'package:the_library_app/persistence/daos/shelf_dao.dart';
import 'package:the_library_app/resources/datas.dart';

import '../../network/dataagents/retrofit_data_agent_impl.dart';

class BookModelImpl extends BookModel {
  BookDataAgent bDataAgent = RetrofitDataAgentImpl();
  static final BookModelImpl _singleton = BookModelImpl._internal();

  factory BookModelImpl() {
    return _singleton;
  }
  BookModelImpl._internal();

  ///DAos
  BookCategoryDao bBookCategoryDao = BookCategoryDao();
  BookDao bBookDao = BookDao();
  ShelfDao bShelfDao=ShelfDao();

  ///Network
  @override
  Future<List<BookCategoryVO>>? getBookListName() {
    return bDataAgent.getBookListName()?.then((bookCategory) async {
      bBookCategoryDao.saveAllBookCategories(bookCategory ?? []);
      return bookCategory?? [];
    });
  }

  @override
  void getBookList(){

  }

  @override
  Future<List<BookVO>?>? getSearchBookList(String searchBookName){
    return bDataAgent.getBookListFromGoogle(searchBookName)?.then((googleBookList){
      List<BookVO>? bookList= googleBookList?.map((googleBookVO) => googleBookVO.convertToBookVO(searchBookName)).toList();
      BookCategoryVO bookCategory=BookCategoryVO(0, "", "", "", "", []);
      bookCategory.listName=searchBookName;
      bookCategory.books=bookList;
      bBookCategoryDao.saveBookCategory(bookCategory);
      return bookList;
    });

  }

  ///Database
  @override
  Stream<List<BookCategoryVO>>? getBookCategoriesFromDatabase() {
    getBookListName()?.then((books) async {
      bBookCategoryDao.saveAllBookCategories(books);
    });
    return bBookCategoryDao
        .getAllBookCategoriesEventStream()
        .startWith(bBookCategoryDao.getAllBookCategoriesStream())
        .map((event) => bBookCategoryDao.getBookCategories());
  }

  @override
  Stream<BookCategoryVO?>? getSingleBookCategoryFromDatabase(String listName) {
    getBookCategoriesFromDatabase();
    return bBookCategoryDao
        .getAllBookCategoriesEventStream()
        .startWith(bBookCategoryDao.getSingleBookCategoryStream(listName))
        .map((event) => bBookCategoryDao.getBookCategory(listName));
  }

  // @override
  // void saveBooksToDatabase(String listName) {
  //   getSingleBookCategoryFromDatabase(listName)?.listen((bookCategory) async{
  //     List<BookVO?>? bookList = bookCategory?.books;
  //     // List<BookVO>? bookL=bookList?.map((book) {
  //     //   book?.listName = bookCategory?.listName;
  //     // }).cast<BookVO>().toList();
  //     // bookList=bookList.map((book) => null)
  //     bBookDao.saveAllBooks(bookList?? []);
  //     debugPrint("Book Details Trace===>$bookList");
  //     //BookVO? book=books.firstWhere((b) => b?.title==title);
  //    // bBookDao.saveBook(BookVO("", "", "", "", "", 120, 120, title, listName));
  //    //  bBookDao.getAllBooks();
  //
  //   }).onError((error) {
  //     debugPrint("Save book error===>$error");
  //   });
  // }

  // @override
  // Stream<List<BookVO>>? getBooksFromDatabase(String listName) {
  //   saveBooksToDatabase(listName);
  //  return bBookDao
  //      .getAllBookEventStream()
  //      .startWith(bBookDao.getAllBookStream())
  //      .map((event) => bBookDao.getBooks());
  // }

  @override
  void saveBookToDatabase(String listName, String title, String openedDate) {
    List<BookVO>? books;
    getSingleBookCategoryFromDatabase(listName)?.listen((bookCategory) async {
      books = bookCategory?.books
          ?.map((b) {
            b.listName = listName;
            b.openedDate = openedDate;
            if (b.title == title) {
              bBookDao.saveBook(b);
            }
            //bBookDao.saveBook(b);
            return b;
          })
          .cast<BookVO>()
          .toList();
      debugPrint("List Name==>${books?.first.listName}");
    }).onError((error) {
      debugPrint("Save Book Error===>$error");
    });
  }

  @override
  Stream<List<BookVO>>? getBooksFromDatabase() {
    return bBookDao
        .getAllBookEventStream()
        .startWith(bBookDao.getAllBookStream())
        .map((event) => bBookDao.getBooks());
  }

  @override
  Stream<BookVO?>? getSingleBookFromDatabase(String title) {
    return bBookDao
        .getAllBookEventStream()
        .startWith(bBookDao.getSingleBookStream(title))
        .map((event) => bBookDao.getBook(title));
  }

  @override
  Stream<List<BookVO>>? getBooksByBookCategoryFromDatabase(String listName) {
    return bBookDao
        .getAllBookEventStream()
        .startWith(bBookDao.getAllBookStream())
        .map((event) {
      if (listName == "") {
        return bBookDao.getBooks();
      } else {
        return bBookDao
            .getBooks()
            .where((book) => book.listName == listName)
            .toList();
      }
    });
  }

  @override
  Stream<List<ShelfVO>?>? getAllShelfFromDatabase() {
    return bShelfDao
        .getAllShelfEventStream()
        .startWith(bShelfDao.getAllShelfStream())
        .map((event) => bShelfDao.getShelves());
  }

  @override
  void saveShelf(String shelfName) {
    int index=0;
    List<ShelfVO>? shelfList;
    getAllShelfFromDatabase()?.listen((shelves) async{
      shelfList=shelves;
      index=(shelfList?.length?? 0);
      debugPrint("Shelf Index===>$index");
      ShelfVO shelf=ShelfVO(index,shelfName, []);
      shelf.shelfName=shelfName;
      //shelf.bookList=book;
      bShelfDao.saveSingleShelf(shelf);
    });

  }

  @override
  Stream<ShelfVO?> getShelfFromDatabase(int shelfId) {
    return bShelfDao
        .getAllShelfEventStream()
        .startWith(bShelfDao.getShelfStream(shelfId))
        .map((event) => bShelfDao.getShelf(shelfId));
  }


  // @override
  // void saveBookToShelf(String shelfName, BookVO book) {
  //   List<ShelfVO>? shelfList;
  //   List<BookVO>? books;
  //   ShelfVO? shelf;
  //   List<String> shelfNameList=[];
  //   getAllShelfFromDatabase()?.listen((shelves) {
  //     shelfList=shelves;
  //
  //     shelfNameList=shelfList?.map((shelf) => shelf.shelfName ?? "").toList()?? [];
  //     debugPrint("Shelf Names===>$shelfNameList");
  //     // if(shelfNameList.contains(shelfName)){
  //     //   shelf=bShelfDao.getShelf(shelfName);
  //     //   books=shelf?.bookList;
  //     //   books?.add(book);
  //     //   shelf?.bookList=books;
  //     //   shelfList.indexOf()=shelf!;
  //     //   //bShelfDao.
  //     //
  //     // }
  //   }).onError((error){
  //     debugPrint("get Shelf List Error===>$error");
  //   });
  // }

  @override
  void renameShelf(String newShelfName, ShelfVO oldShelf) async {
    //ShelfVO shelf=oldShelf;
    oldShelf.shelfName=newShelfName;

    bShelfDao.updateShelfName(oldShelf.shelfId?? 0, oldShelf);

  }


  @override
  void deleteShelfFromDatabase(int shelfId) {
    bShelfDao.deleteShelf(shelfId);

  }

  @override
  void addingBookToShelf(int shelfId, BookVO book) async{
    bShelfDao.addBookToShelf(shelfId, book);

    //List<int> shelfIdList=[];
    // List<ShelfVO?>? shelfList;
    // getAllShelfFromDatabase()?.listen((shelves) async{
    //   shelfList=shelves;
    //   for(int i=0;i<shelfIdList.length;i++){
    //     for(int j=0;j<(shelfList?.length ?? 0);j++){
    //       if(shelfIdList[i]==shelfList?[j]?.shelfId){
    //         shelfList?[j]?.bookList?.add(book);
    //         bShelfDao.saveSingleShelf(shelfList?[j]);
    //       }
    //     }
    //   }
    //   //bShelfDao.saveAllShelves(shelfList!);
    // }).onError((error){
    //   debugPrint("Add book to Shelf Error===>$error");
    // });
  }

}
