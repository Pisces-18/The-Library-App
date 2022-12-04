// import 'package:flutter/material.dart';
// import 'package:the_library_app/viewers/tab_bar_section_view.dart';
// import 'package:the_library_app/viewers/title_and_book_view.dart';
//
// import '../data/vos/book_category_vo.dart';
// import '../resources/dimens.dart';
// import '../resources/strings.dart';
//
// // class EbooksAndAudiobooksSectionView extends StatefulWidget {
// //   final List<BookCategoryVO> bookLists;
// //   final String books;
// //   final Function(String, bool) onTapSeeMore;
// //   final Function onPressedBook;
// //   EbooksAndAudiobooksSectionView(
// //       this.onTapSeeMore, this.onPressedBook, this.bookLists,this.books);
// //
// //   @override
// //   State<EbooksAndAudiobooksSectionView> createState() =>
// //       _EbooksAndAudiobooksSectionViewState();
// // }
// //
// // class _EbooksAndAudiobooksSectionViewState
// //     extends State<EbooksAndAudiobooksSectionView> {
// //   int index = 0;
// //   @override
// //   void initState() {
// //     super.initState();
// //     debugPrint("Ebooks==>${widget.books}");
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         TabBarSectionView(EBOOK_TEXT, AUDIO_BOOK_TEXT, (i) {
// //           setState(() {
// //             index = i;
// //           });
// //         }),
// //         const SizedBox(
// //           height: MARGIN_MEDIUM_3,
// //         ),
// //         (index == 0)
// //             ? EbookAndAudioBookView(
// //           "Ebooks For You",
// //           "assets/images/ebooks.jpg",
// //           "mon boss est nul mais je le soigne",
// //           "Gael Chatelain",
// //               (title, audioTest) => widget.onTapSeeMore(title, audioTest),
// //               () => widget.onPressedBook(),
// //           widget.bookLists,
// //         )
// //             : EbookAndAudioBookView(
// //           "Audiobooks For You",
// //           "assets/images/audioBooks.jpg",
// //           "The Taking: A Novel",
// //           "Dean Koontz",
// //               (title, audioTest) => widget.onTapSeeMore(title, audioTest),
// //               () => widget.onPressedBook(),
// //           widget.bookLists,
// //           isAudio: true,
// //         ),
// //       ],
// //     );
// //   }
// // }
//
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
//     //debugPrint("EbookAndAudioBookView===>${widget.bookLists.first.listName}");
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
//                 (title, audioTest) {
//               widget.onTapSeeMore(title, audioTest);
//             },
//             isAudio: widget.isAudio,
//                 () => widget.onTapBook(),
//             title: widget.title,
//           );
//         });
//   }
// }