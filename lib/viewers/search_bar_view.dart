import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../resources/dimens.dart';
import '../resources/strings.dart';

class SearchBarView extends StatelessWidget {
  final Function onTapSearch;
  SearchBarView(this.onTapSearch);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,vertical: MARGIN_XLARGE),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(MARGIN_CARD_MEDIUM_2)),
        ),
        child: Stack(
          children: [
            TextField(
              onTap: () {
                //_navigateToSearchBookPage(context);
                FocusScope.of(context).unfocus();
                onTapSearch();
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: const Icon(
                    Icons.search,
                    size: MARGIN_LARGE,
                    color: Colors.black87,
                  ),
                  filled: true,
                  fillColor: Colors.white70,
                  hintText: SEARCH_PLAY_BOOKS_TEXT,
                  hintStyle: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: TEXT_REGULAR)),
            ),
            Positioned(
              top: 5,
              left: MediaQuery.of(context).size.width/1.25,
              child: Container(
                width: 40,
                height: 40,
                child: Stack(
                  children: [
                    Positioned(

                      child: CircularPercentIndicator(
                        //backgroundColor: Colors.purple,
                        linearGradient: LinearGradient(
                          begin: Alignment.topCenter,
                            colors: [Colors.red,Colors.blue,Colors.blue,Colors.blue,Colors.green,Colors.green,Colors.yellow]),
                        radius: 20.0,
                        lineWidth: 3,
                        percent: 100/100,

                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset("assets/images/avator.png",fit: BoxFit.fill,),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}