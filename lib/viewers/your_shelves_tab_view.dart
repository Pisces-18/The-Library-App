import 'package:flutter/material.dart';
import 'package:the_library_app/pages/shelf_details_page.dart';
import 'package:the_library_app/resources/colors.dart';
import 'package:the_library_app/viewers/shelves_list_section_view.dart';

import '../data/vos/shelf_vo.dart';
import '../resources/dimens.dart';

class YourShelvesTabView extends StatelessWidget {
  final List<ShelfVO>? shelves;
  YourShelvesTabView(this.shelves);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (shelves?.isNotEmpty?? false)
            ?ShelvesListSectionView(
            false,
                (shelf) => _navigateToShelvesDetailsPage(context, shelf),shelves,[], onTapCheckBox: (s) {  },):ShelvesListEmptyView()


      ],
    );
  }

  Future<dynamic> _navigateToShelvesDetailsPage(
          BuildContext context, ShelfVO? shelf) =>
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ShelvesDetailsPage(shelf)));
}

class ShelvesListEmptyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 120),
      child: Column(
        children: [
          Image.asset(
            "assets/images/bookShelfPlaceholder.jfif",
            width: 150,
            height: 100,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "No shelves",
            style: TextStyle(
                color: Colors.black,
                fontSize: TEXT_HEADING_2X,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Create shelves to mactch the way you think",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: SMS_CODE_COLOR,
              fontSize: TEXT_REGULAR_2X,
            ),
          )
        ],
      ),
    );
  }
}
