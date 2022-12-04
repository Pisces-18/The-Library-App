import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';

class BookOverViewPage extends StatelessWidget {
  final String title;
  final String overview;
  BookOverViewPage(this.title, this.overview);
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
            ),),
        title: Text(
          "About The Taking: A Novel",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: APPBAR_COLOR,
              fontWeight: FontWeight.w500,
              fontSize: TEXT_REGULAR_3X),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(MARGIN_MEDIUM_2),
        child: SingleChildScrollView(
          child: Text(overview),
        ),
      ),
    );
  }
}
