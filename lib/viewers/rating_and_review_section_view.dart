import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:the_library_app/viewers/rating_view.dart';

import '../resources/colors.dart';
import '../resources/datas.dart';
import '../resources/dimens.dart';
import '../resources/strings.dart';
import '../widgets/title_and_see_more_view.dart';

class RatingAndReviewView extends StatelessWidget {
final bool isOverview;
RatingAndReviewView(this.isOverview);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RatingsView(),
        Visibility(
          visible: isOverview,
          child: Container(
            width: MediaQuery.of(context).size.width / 1,
            padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
            child: Wrap(
                children: ratingList.map((rating) => RatingChipView(rating)).toList(),
            ),
          ),
        ),
        ReviewView(),
        PublishView()
      ],
    );
  }
}
class RatingChipView extends StatelessWidget {
final int rating;
RatingChipView(this.rating);
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        FilterChip(
          padding: EdgeInsets.symmetric(horizontal: MARGIN_SMALL),
            backgroundColor: Colors.white,
            label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("$rating",style: TextStyle(fontSize: TEXT_REGULAR_2X),),
            Icon(Icons.star,color: SMS_CODE_COLOR,)
          ],
        ),
          side: BorderSide(
            width: 1,
            color: SMS_CODE_COLOR
          ),
          onSelected: (bool value) {},),
        const SizedBox(width: MARGIN_MEDIUM,)
      ],
    );
  }
}


class PublishView extends StatelessWidget {
  const PublishView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MARGIN_MEDIUM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TitleAndSeeMoreView(PUBLISHED_TEXT,(title,isAudio){},seeMore: false,),
          const SizedBox(height: MARGIN_MEDIUM,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
            child: Text("December 1,2017 . Open Road + Grove/Atlantic",style: TextStyle(color: SMS_CODE_COLOR),),
          )
        ],
      ),
    );
  }
}

class ReviewView extends StatelessWidget {
  const ReviewView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MARGIN_MEDIUM_3,
          vertical: MARGIN_MEDIUM_2),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      "assets/images/avator.png",
                      width: MARGIN_XLLARGE,
                      height: MARGIN_XLLARGE,
                    ),
                  ),
                  const SizedBox(width: MARGIN_MEDIUM_2,),
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("A Google User",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: TEXT_REGULAR_2X,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: MARGIN_SMALL,
                      ),
                      Row(
                        children: [
                          RatingView(),
                          const SizedBox(
                            width: MARGIN_MEDIUM,
                          ),
                          Text(
                            "5/21/14",
                            style: TextStyle(
                                color: SMS_CODE_COLOR),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: MARGIN_MEDIUM,
                      ),
                      Text(
                        "This book was by far NOT one of his best.",
                        softWrap: true,
                        overflow:TextOverflow.ellipsis,
                        style: TextStyle(color: SMS_CODE_COLOR),
                      )
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}

class RatingsView extends StatefulWidget {
  const RatingsView({
    Key? key,
  }) : super(key: key);

  @override
  State<RatingsView> createState() => _RatingsViewState();
}

class _RatingsViewState extends State<RatingsView> {
  int rating=20;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "3.9",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: TEXT_BIG),
              ),
              const SizedBox(
                height: MARGIN_MEDIUM,
              ),
              RatingView(),
              const SizedBox(
                height: MARGIN_SMALL,
              ),
              Text(
                "95 ratings",
                style: TextStyle(color: SMS_CODE_COLOR),
              )
            ],
          ),
          Container(
            //height: 250,
            width: MediaQuery.of(context).size.width/1.5,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                itemCount: ratingNumber.length,
                itemBuilder: (BuildContext context,int index){
              return  Container(
                padding: EdgeInsets.symmetric(vertical: 2),
                child: LinearPercentIndicator(
                  backgroundColor: Colors.black12,
                  barRadius: Radius.circular(50),
                  width: MediaQuery.of(context).size.width/1.6,
                  lineHeight: 10,
                  leading: Padding(
                    padding: const EdgeInsets.only(right: MARGIN_MEDIUM),
                    child: Text("${ratingNumber[index]}",style: TextStyle(color: Colors.black,fontSize: TEXT_REGULAR),),
                  ),
                  animation: false,
                  percent: ratingPercent[index]/100,
                  progressColor: Colors.blue,
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}