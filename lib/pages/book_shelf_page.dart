// import 'package:flutter/material.dart';
// import 'package:the_library_app/pages/add_shelves_page.dart';
// import 'package:the_library_app/pages/create_shelf_page.dart';
// import 'package:the_library_app/pages/search_book_page.dart';
// import 'package:the_library_app/resources/colors.dart';
// import 'package:the_library_app/resources/datas.dart';
// import 'package:the_library_app/resources/dimens.dart';
// import 'package:the_library_app/viewers/book_list_view.dart';
// import 'package:the_library_app/viewers/bottomsheet_view.dart';
//
// import '../resources/strings.dart';
// import '../viewers/book_result_view.dart';
// import '../viewers/library_bottomsheet_view.dart';
// import '../viewers/search_bar_view.dart';
// import '../viewers/tab_bar_section_view.dart';
// import '../viewers/your_books_tab_view.dart';
// import '../viewers/your_shelves_tab_view.dart';
// import '../widgets/multiple_chip_view.dart';
//
// class BookShelfPage extends StatefulWidget {
//   final int shelfIndex;
//   BookShelfPage({this.shelfIndex=0});
//
//   @override
//   State<BookShelfPage> createState() => _BookShelfPageState();
// }
//
// class _BookShelfPageState extends State<BookShelfPage> {
//   ViewASFormation viewASFormation = ViewASFormation.SMALL_GRID;
//   bool isList = false;
//   bool isShelves = false;
//   int i = 0;
//   @override
//   void initState(){
//     super.initState();
//     i=widget.shelfIndex;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SearchBarView(() => _navigateToSearchBookPage(context)),
//               TabBarSectionView(LIBRARY_TAB_TEXT1, LIBRARY_TAB_TEXT2, (index) {
//                 setState(() {
//                   i = index;
//                   if(i==0){
//                     isShelves=false;
//                   }else{
//                     isShelves=true;
//                   }
//                 });
//               }),
//
//               (i == 0 && isShelves==false)
//                   ? YourBooksTabView(viewASFormation, isList, () {
//                 setState(() {
//                   showSheet(context, addBookFunctionList, (text){
//                     setState(() {
//                       if(text=="Add to shelves"){
//                         _navigateToAddShelvesPage(context,text);
//                       }
//                     });
//                   });
//                 });}, (type) {
//                 setState(() {
//                   if (type == "List") {
//                     viewASFormation = ViewASFormation.LIST;
//                     isList = true;
//                   } else if (type == "Large grid") {
//                     viewASFormation = ViewASFormation.LARGE_GRID;
//                     isList = false;
//                   } else if (type == "Small grid") {
//                     viewASFormation = ViewASFormation.SMALL_GRID;
//                     isList = false;
//                   }
//                 });
//               }, tabList1, tabList2)
//                   : YourShelvesTabView()
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: Visibility(
//         visible: isShelves,
//         child: TextButton(
//           onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateShelfPage())),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Image.asset(
//                   "assets/images/edit.png",
//                   width: MARGIN_MEDIUM_2,
//                   height: MARGIN_MEDIUM_2,
//                   color: Colors.white,
//                 ),
//                 const SizedBox(
//                   width: MARGIN_MEDIUM,
//                 ),
//                 Text(
//                   "Create new",
//                   style: TextStyle(color: Colors.white),
//                 )
//               ],
//             ),
//           ),
//           style: TextButton.styleFrom(
//               backgroundColor: Colors.blue,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(50))),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
//
//   Future<dynamic> _navigateToAddShelvesPage(
//       BuildContext context, String title) =>
//       Navigator.push(context,
//           MaterialPageRoute(builder: (context) => AddShelvesPage(title)));
//   Future<dynamic> _navigateToSearchBookPage(BuildContext context) =>
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => SearchBookPage()));
// }
