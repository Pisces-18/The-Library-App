import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../viewers/rating_and_review_section_view.dart';

class RatingsAndReviewsPage extends StatelessWidget {
  final String title;
  RatingsAndReviewsPage(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: APPBAR_COLOR,
              fontWeight: FontWeight.w500,
              fontSize: TEXT_REGULAR_3X),
        ),
        centerTitle: true,
      ),
      body: Container(child: SingleChildScrollView(child: RatingAndReviewView(true))),
    );
  }
}
