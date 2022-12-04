import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:the_library_app/pages/book_overview_page.dart';
import 'package:the_library_app/pages/ratings_and_reviews_page.dart';
import 'package:the_library_app/resources/strings.dart';

import '../blocs/book_details_bloc.dart';
import '../data/vos/book_vo.dart';
import '../resources/colors.dart';
import '../resources/datas.dart';
import '../resources/dimens.dart';
import '../viewers/rating_and_review_section_view.dart';
import '../viewers/rating_view.dart';
import '../widgets/book_title_and_image_view.dart';
import '../widgets/title_and_see_more_view.dart';

class BookDetailPage extends StatefulWidget {
  final String listName;
  final String title;
  final String openedDate;
  const BookDetailPage({Key? key, required this.listName, required this.title, required this.openedDate}) : super(key: key);

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  @override
  void dispose() {
    BookDetailsBloc bloc=Provider.of<BookDetailsBloc>(context,listen: false);
    bloc.isDispose=true;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>BookDetailsBloc(widget.listName,widget.title,widget.openedDate),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios,
                color: APPBAR_COLOR,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: MARGIN_CARD_MEDIUM_2),
              child: Image.asset(
                "assets/images/upArrow.png",
                width: MARGIN_LARGE,
                height: MARGIN_LARGE,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: Selector<BookDetailsBloc,BookVO?>(
          selector: (context ,bloc )=>bloc.book,
          builder: (context, bookDetails, child)=>Container(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: MARGIN_MEDIUM_2),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BookTitleAndImageSectionView(bookDetails),
                    Divider(
                      color: SMS_CODE_COLOR,
                      thickness: 1,
                    ),
                    BookDetailButtonSectionView(),
                    Divider(
                      color: SMS_CODE_COLOR,
                      thickness: 1,
                    ),
                    AboutBookSectionView(
                      "The Taking: A Novel",
                      (title, overview) =>
                          _navigateToBookOverviewPage(context, title, overview),
                    ),
                    RatingsAndReviewsSectionView((title)=>_navigateToRatingsAndReviewsPage(context, title)),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _navigateToRatingsAndReviewsPage(BuildContext context, String title) => Navigator.push(context, MaterialPageRoute(builder: (context)=>RatingsAndReviewsPage(title)));

  Future<dynamic> _navigateToBookOverviewPage(
          BuildContext context, String title, String overview) =>
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BookOverViewPage(title, overview)));
}

class RatingsAndReviewsSectionView extends StatelessWidget {
  final Function(String) onTapSeeMore;
  RatingsAndReviewsSectionView(this.onTapSeeMore);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_2),
        child: Column(
          children: [
            TitleAndSeeMoreView(
                RATING_AND_REVIEW_TEXT, (title, isAudio)=>onTapSeeMore(title)),
            RatingAndReviewView(false),
          ],
        ));
  }
}



class AboutBookSectionView extends StatelessWidget {
  final String title;
  final Function(String, String) onTapSeeMore;
  AboutBookSectionView(this.title, this.onTapSeeMore);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_2),
      child: Column(
        children: [
          TitleAndSeeMoreView(ABOUT_THIS_EBOOK_TET,
              (title, isAudio) => onTapSeeMore(title, bookDetails)),
          const SizedBox(
            height: MARGIN_CARD_MEDIUM_2,
          ),
          Container(
            height: BOOK_DETAILS_TEXT_HEIGHT,
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3),
            child: Text(
              bookDetails,
              overflow: TextOverflow.fade,
              style:
                  TextStyle(color: SMS_CODE_COLOR, fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}

class BookDetailButtonSectionView extends StatelessWidget {
  const BookDetailButtonSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MARGIN_MEDIUM_3, vertical: MARGIN_MEDIUM_2),
      child: Column(
        children: [
          Row(
            children: [
              ButtonView(BUTTON_TEXT1),
              Spacer(),
              ButtonView(
                BUTTON_TEXT2,
                isGhost: true,
              ),
            ],
          ),
          const SizedBox(
            height: MARGIN_MEDIUM_3,
          ),
          Row(
            children: [
              Icon(
                Icons.info_outline_rounded,
                color: SMS_CODE_COLOR,
              ),
              const SizedBox(
                width: MARGIN_CARD_MEDIUM_2,
              ),
              Expanded(
                  child: Text(
                INFO_TEXT,
                style: TextStyle(color: SMS_CODE_COLOR),
              ))
            ],
          )
        ],
      ),
    );
  }
}

class ButtonView extends StatelessWidget {
  final String buttonText;
  final bool isGhost;
  ButtonView(this.buttonText, {this.isGhost = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: BUTTON_HEIGHT,
      padding: EdgeInsets.symmetric(
          horizontal: (isGhost) ? MARGIN_XLLARGE : MARGIN_LARGE),
      child: Center(
        child: Row(
          children: [
            Visibility(
              visible: isGhost,
              child: Padding(
                padding: const EdgeInsets.only(right: MARGIN_MEDIUM),
                child: Image.asset(
                  "assets/images/wishlist.png",
                  width: MARGIN_MEDIUM_2,
                  height: MARGIN_MEDIUM_2,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              buttonText,
              style: TextStyle(
                  color: (isGhost) ? Colors.white : Colors.blue,
                  fontSize: TEXT_REGULAR_2X),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
          color: (isGhost) ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(MARGIN_SMALL),
          border: Border.all(color: SMS_CODE_COLOR1)),
    );
  }
}

class BookTitleAndImageSectionView extends StatelessWidget {
  final BookVO? book;
  BookTitleAndImageSectionView(this.book);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
        padding: EdgeInsets.only(
            bottom: MARGIN_CARD_MEDIUM_2, left: MARGIN_MEDIUM_3),
        child: BookTitleAndImageView(140, 90,book));
  }
}
