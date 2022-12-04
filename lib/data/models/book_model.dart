import 'package:the_library_app/data/vos/shelf_vo.dart';

import '../vos/book_category_vo.dart';
import '../vos/book_vo.dart';

abstract class BookModel{
  ///Network
  void getBookList();
  Future<List<BookCategoryVO>>? getBookListName();
  Future<List<BookVO>?>? getSearchBookList(String searchBookName);



  ///Database
 Stream<List<BookCategoryVO>>? getBookCategoriesFromDatabase();
 Stream<BookCategoryVO?>? getSingleBookCategoryFromDatabase(String listName);
 void saveBookToDatabase(String listName,String title,String openedDate);
 Stream<List<BookVO>>? getBooksFromDatabase();
 Stream<BookVO?>? getSingleBookFromDatabase(String title);
 Stream<List<BookVO>>? getBooksByBookCategoryFromDatabase(String listName);
 void saveShelf(String shelfName);
 Stream<List<ShelfVO>?>? getAllShelfFromDatabase();
 void addingBookToShelf(int shelfId,BookVO book);
 void renameShelf(String newShelfName,ShelfVO oldShelf);
 void deleteShelfFromDatabase(int shelfId);
 Stream<ShelfVO?>? getShelfFromDatabase(int shelfId);

}