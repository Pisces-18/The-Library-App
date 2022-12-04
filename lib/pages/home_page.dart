import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_library_app/pages/book_showcase_page.dart';
import 'package:the_library_app/pages/library_page.dart';
import 'package:the_library_app/pages/search_book_page.dart';

import '../blocs/home_bloc.dart';
import '../data/models/book_model.dart';
import '../data/models/book_model_impl.dart';
import '../data/vos/book_category_vo.dart';
import '../data/vos/book_vo.dart';
import '../resources/colors.dart';
import '../resources/datas.dart';
import '../resources/dimens.dart';
import '../resources/strings.dart';
import '../viewers/bottomsheet_view.dart';
import '../viewers/search_bar_view.dart';
import '../viewers/tab_bar_section_view.dart';
import '../viewers/title_and_book_view.dart';
import 'add_shelves_page.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  int _selectedIndex=0;
  // @override
  // void dispose() {
  //   HomeBloc bloc = Provider.of<HomeBloc>(context, listen: false);
  //   bloc.isDispose = true;
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        body: Container(
          //padding: EdgeInsets.symmetric(vertical: MARGIN_XLLARGE),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SearchBarView(() => _navigateToSearchBookPage(context)),
                Selector<HomeBloc, List<BookVO>>(
                  selector: (context, bloc) => bloc.books ?? [],
                  builder: (context, bookList, child) => (bookList.isNotEmpty)
                      ? CompletedBooksSectionView(bookList, (book) {
                          showSheet(context, addBookFunctionList, (text) {
                            if (text == "Add to shelves") {
                              _navigateToAddShelvesPage(context, text,book);
                            }
                          }, book);
                        })
                      : Container(),
                ),
                const SizedBox(height: 30),
                TabBarSectionView(EBOOK_TEXT, AUDIO_BOOK_TEXT, (i) {
                  setState(() {
                    index = i;
                  });
                },0),
                const SizedBox(
                  height: MARGIN_MEDIUM_3,
                ),
                Selector<HomeBloc, List<BookCategoryVO>>(
                  selector: (context, bloc) => bloc.bookLists ?? [],
                  builder: (context, bookCategoryAndBookList, child) =>
                  (bookCategoryAndBookList.isNotEmpty)?ListView.builder(
                    //key:  const Key("Book List View Key"),
                          itemCount: 4,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              key: const Key("Book List View Key"),
                              child: TitleAndBookView(
                                (title, audioTest) => _navigateToBookShowCasePage(
                                    context, audioTest, title),
                                isAudio: false,
                                (book) => showSheet(context,
                                    completedBookFunctionList, (text) {}, book),
                                bookCategoryAndBookList[index].books ?? [],
                                title:
                                    bookCategoryAndBookList[index].listName ?? "",
                              ),
                            );
                          }):Center(child: CircularProgressIndicator(),),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
                if(index==0){

                }else if(index==1){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LibraryPage(false, 0,)));
                }
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
      ),
    );
  }

  Future<dynamic> _navigateToAddShelvesPage(
          BuildContext context, String title,BookVO book) =>
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AddShelvesPage(title,book)));

  Future<dynamic> _navigateToSearchBookPage(BuildContext context) =>
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SearchBookPage()));

  Future<dynamic> _navigateToBookShowCasePage(
          BuildContext context, bool isAudio, String listName) =>
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BookShowCasePage(isAudio, listName)));
}

// class EbookAndAudioBookView extends StatefulWidget {
//   final List<BookCategoryVO> bookLists;
//   final String title;
//   final String image;
//   final String bookName;
//   final String author;
//   final bool isAudio;
//   final Function(String, bool) onTapSeeMore;
//   final Function onTapBook;
//   EbookAndAudioBookView(this.title, this.image, this.bookName, this.author,
//       this.onTapSeeMore, this.onTapBook, this.bookLists,
//       {this.isAudio = false});
//
//   @override
//   State<EbookAndAudioBookView> createState() => _EbookAndAudioBookViewState();
// }
//
// class _EbookAndAudioBookViewState extends State<EbookAndAudioBookView> {
//   @override
//   void initState() {
//     super.initState();
//     debugPrint("EbookAndAudioBookView===>${widget.bookLists}");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: 4,
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemBuilder: (BuildContext context, int index) {
//           return TitleAndBookView(
//             widget.image,
//             widget.bookName,
//             widget.author,
//             (title, audioTest) {
//               widget.onTapSeeMore(title, audioTest);
//             },
//             isAudio: widget.isAudio,
//             () => widget.onTapBook(),[],
//             title: widget.title,
//           );
//         });
//   }
// }

// class EbooksAndAudiobooksSectionView extends StatefulWidget {
//   final List<BookCategoryVO> bookLists;
//   final Function(String, bool) onTapSeeMore;
//   final Function onPressedBook;
//   EbooksAndAudiobooksSectionView(this.bookLists,this.onTapSeeMore, this.onPressedBook);
//
//   @override
//   State<EbooksAndAudiobooksSectionView> createState() =>
//       _EbooksAndAudiobooksSectionViewState();
// }
//
// class _EbooksAndAudiobooksSectionViewState
//     extends State<EbooksAndAudiobooksSectionView> {
//   int index = 0;
//   @override
//   void initState() {
//     super.initState();
//     debugPrint("Ebooks==>${widget.bookLists}");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TabBarSectionView(EBOOK_TEXT, AUDIO_BOOK_TEXT, (i) {
//           setState(() {
//             index = i;
//           });
//         }),
//         const SizedBox(
//           height: MARGIN_MEDIUM_3,
//         ),
//         (index == 0)
//             ? EbookAndAudioBookView(
//           "Ebooks For You",
//           "assets/images/ebooks.jpg",
//           "mon boss est nul mais je le soigne",
//           "Gael Chatelain",
//               (title, audioTest) => widget.onTapSeeMore(title, audioTest),
//               () => widget.onPressedBook(),
//           widget.bookLists,
//         )
//             : EbookAndAudioBookView(
//           "Audiobooks For You",
//           "assets/images/audioBooks.jpg",
//           "The Taking: A Novel",
//           "Dean Koontz",
//               (title, audioTest) => widget.onTapSeeMore(title, audioTest),
//               () => widget.onPressedBook(),
//           widget.bookLists,
//           isAudio: true,
//         ),
//       ],
//     );
//   }
// }

class CompletedBooksSectionView extends StatelessWidget {
  final List<BookVO> books;
  final Function(BookVO) onTapBook;
  CompletedBooksSectionView(this.books, this.onTapBook);
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
          ),
          height: 160,
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
                  child: Image.network(
                    books?[itemIndex].bookImage ?? "",
                    height: 120,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => onTapBook(books[itemIndex]),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: MARGIN_MEDIUM_2),
                      child: Text("...",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: TEXT_REGULAR_3X)),
                    )),
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: MARGIN_MEDIUM_2, top: MARGIN_MEDIUM),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: MARGIN_MEDIUM, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(MARGIN_SMALL),
                        color: Colors.black54,
                      ),
                      child: Text("Sample",
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontSize: TEXT_SMALL)),
                    ),
                  )),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: MARGIN_MEDIUM_2, bottom: MARGIN_MEDIUM),
                    child: Container(
                        //padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM,vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(MARGIN_SMALL),
                          color: Colors.black54,
                        ),
                        child: Icon(
                          Icons.save_alt,
                          color: Colors.white70,
                        )),
                  )),
            ],
          ),
        );
      },
      options: CarouselOptions(
          viewportFraction: 0.4,
          enableInfiniteScroll: false,
          height: MediaQuery.of(context).size.height / 3.5,
          enlargeCenterPage: true,
          initialPage: 0,
          disableCenter: false,
          aspectRatio: 2.1,
          onPageChanged: (index, reason) {}),
      itemCount: books?.length,
    );
  }
}
