import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:the_library_app/data/models/book_model.dart';
import 'package:the_library_app/data/models/book_model_impl.dart';
import 'package:the_library_app/data/vos/book_category_vo.dart';
import 'package:the_library_app/data/vos/book_vo.dart';
import 'package:the_library_app/data/vos/shelf_vo.dart';
import 'package:the_library_app/pages/home_page.dart';
import 'package:the_library_app/pages/main_page.dart';
import 'package:the_library_app/pages/radio_test.dart';
import 'package:the_library_app/pages/test_home_page.dart';
import 'package:the_library_app/persistence/hive_constants.dart';

void main() async{
  await Hive.initFlutter();

  Hive.registerAdapter(BookListVOAdapter());
  Hive.registerAdapter(BookVOAdapter());
  Hive.registerAdapter(ShelfVOAdapter());

  await Hive.openBox<BookCategoryVO>(BOX_NAME_BOOK_CATEGORY_VO);
  await Hive.openBox<BookVO>(BOX_NAME_BOOK_VO);
  await Hive.openBox<ShelfVO>(BOX_NAME_SHELF_VO);




  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
@override
  void initState(){
  super.initState();
  BookModel bBookModel=BookModelImpl();
 // bBookModel.getSearchBookList("flutter");
}

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

