// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:the_library_app/pages/search_book_page.dart';
//
// import '../blocs/home_bloc.dart';
// import '../data/vos/book_category_vo.dart';
// import '../resources/datas.dart';
// import '../resources/dimens.dart';
// import '../resources/strings.dart';
// import '../viewers/bottomsheet_view.dart';
// import '../viewers/search_bar_view.dart';
// import '../viewers/tab_bar_section_view.dart';
// import '../viewers/title_and_book_view.dart';
// import 'add_shelves_page.dart';
// import 'book_showcase_page.dart';
// import 'home_page.dart';
//
// class TestHomePage extends StatefulWidget {
//   const TestHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<TestHomePage> createState() => _TestHomePageState();
// }
//
// class _TestHomePageState extends State<TestHomePage> {
//   int index=0;
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) =>HomeBloc(),
//       child: Scaffold(
//         body: Container(
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SearchBarView(() => _navigateToSearchBookPage(context)),
//                 CompletedBooksSectionView(() {
//                   showSheet(context, addBookFunctionList, (text) {
//                     if (text == "Add to shelves") {
//                       _navigateToAddShelvesPage(context, text);
//                     }
//                   });
//                 }),
//                 const SizedBox(height: 30),
//                 TabBarSectionView(EBOOK_TEXT, AUDIO_BOOK_TEXT, (i) {
//                   setState(() {
//                     index = i;
//                   });
//                 }),
//                 const SizedBox(
//                   height: MARGIN_MEDIUM_3,
//                 ),
//                 Selector<HomeBloc, List<BookCategoryVO>>(
//                   selector: (context ,bloc )=>bloc.bookLists?? [],
//                   builder: (context, bookCategoryAndBookList, child)=>ListView.builder(
//                       itemCount: 4,
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemBuilder: (BuildContext context, int index) {
//                         return TitleAndBookView(
//                               (title, audioTest) =>
//                               _navigateToBookShowCasePage(context, title, audioTest,bookCategoryAndBookList),
//                           isAudio: false,
//                               (bookName) => () =>
//                                   showSheet(context, completedBookFunctionList, (text) {},null),
//                           bookCategoryAndBookList[index].books?? [],
//                           title: bookCategoryAndBookList.first.listName?? "",
//                         );
//                       }),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<dynamic> _navigateToAddShelvesPage(
//       BuildContext context, String title) =>
//       Navigator.push(context,
//           MaterialPageRoute(builder: (context) => AddShelvesPage(title)));
//
//   Future<dynamic> _navigateToSearchBookPage(BuildContext context) =>
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => SearchBookPage()));
//
//   Future<dynamic> _navigateToBookShowCasePage(
//       BuildContext context, String title, bool isAudio,List<BookCategoryVO>? bookLists) =>
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => BookShowCasePage(isAudio,"Hardcover Fiction")));
// }
