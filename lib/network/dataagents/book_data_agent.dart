import 'package:the_library_app/data/vos/book_vo.dart';
import 'package:the_library_app/data/vos/google_book_vo.dart';

import '../../data/vos/book_category_vo.dart';

abstract class BookDataAgent{
Future<List<BookCategoryVO>?>? getBookListName();
Future<List<BookVO>?>? getBookList(String listName);
Future<List<GoogleBookVO>?>? getBookListFromGoogle(String searchBookName);
}