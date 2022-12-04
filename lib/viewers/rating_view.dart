import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../resources/dimens.dart';

class RatingView extends StatelessWidget {
  const RatingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      allowHalfRating: false,
      initialRating: 4.0,
      itemSize: MARGIN_MEDIUM_2,
      onRatingUpdate: (double value) { },
      ratingWidget: RatingWidget(full: Icon(Icons.star,color: Colors.blue,), half: Icon(Icons.star,color: Colors.blue,), empty: Icon(Icons.star_border,color: Colors.blue,)),

    );
  }
}