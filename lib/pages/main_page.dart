import 'package:flutter/material.dart';
import 'package:progress_indicator/progress_indicator.dart';
import 'package:the_library_app/data/models/book_model.dart';
import 'package:the_library_app/data/models/book_model_impl.dart';
import 'package:the_library_app/pages/home_page.dart';
import 'package:the_library_app/pages/library_page.dart';
import 'package:the_library_app/pages/search_book_page.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../resources/strings.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final PageController _myPage = PageController(initialPage: 0);
  final List _screens = [HomePage(), LibraryPage(false,0)];
  BookModel bModel=BookModelImpl();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      // body: PageView(
      //   onPageChanged: (page){
      //     setState(() {
      //       _selectedIndex=page;
      //     });
      //   },
      //   controller: _myPage,
      //   physics: NeverScrollableScrollPhysics(),
      //   children: [
      //     HomePage(),
      //     LibraryPage()
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              // debugPrint("Index ==>$_selectedIndex");
              // _myPage.jumpToPage(_selectedIndex);
            });
          },
          selectedIconTheme: const IconThemeData(color: Colors.blue),
          unselectedIconTheme: const IconThemeData(
            color: SMS_CODE_COLOR,
          ),
          selectedItemColor: Colors.blue,
          unselectedItemColor: SMS_CODE_COLOR,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.my_library_books_outlined,
                ),
                label: "Library"),
          ]),
    );
  }
}
