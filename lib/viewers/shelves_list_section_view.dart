import 'package:flutter/material.dart';

import '../data/vos/shelf_vo.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../widgets/shelves_title_and_number_of_book_view.dart';

class ShelvesListSectionView extends StatefulWidget {
  final bool isAddShelves;
  final Function(ShelfVO?) onTapShelve;
  final List<ShelfVO>? shelves;
  final Function(int) onTapCheckBox;
  final List<bool> selectedItemValueList;
  ShelvesListSectionView(this.isAddShelves, this.onTapShelve, this.shelves,this.selectedItemValueList,
      {required this.onTapCheckBox});

  @override
  State<ShelvesListSectionView> createState() => _ShelvesListSectionViewState();
}

class _ShelvesListSectionViewState extends State<ShelvesListSectionView> {
  //bool _value = false;
  List<int> shelfIdList=[];
  var selectedItem;
  bool selectedValue = false;
  //List<bool> selectedItemValueList=[];

  @override
  void initState() {
    super.initState();

      // for(int i=0;i<(widget.shelves?.length ?? 0);i++){
      //   debugPrint("Shelf Length===>${widget.shelves?.length}");
      //  selectedItemValueList.add(false);
      //  debugPrint(selectedItemValueList[i].toString());
      // }
     // widget.shelves?[index].isCheck = val;

  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: ScrollPhysics(),
        itemCount: widget.shelves?.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            // padding: EdgeInsets.symmetric(vertical: MARGIN_MEDIUM),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: SMS_CODE_COLOR1))),
            child: Padding(
              padding: const EdgeInsets.only(top: MARGIN_MEDIUM),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 95,
                            height: 60,
                            child: Stack(
                              children: [
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: (widget.shelves?[index].bookList == [])
                                        ? Image.network(
                                            widget.shelves?[index].bookList
                                                    ?.first.bookImage ??
                                                "",
                                            width: 95,
                                            height: 60,
                                          )
                                        : Image.asset("assets/images/bb.png",
                                            width: 80, height: 60)),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: (widget.shelves?[index].bookList == [])
                                        ? Image.network(
                                            widget.shelves?[index].bookList
                                                    ?.last.bookImage ??
                                                "",
                                            width: 95,
                                            height: 60,
                                          )
                                        : Image.asset("assets/images/b.jfif",
                                            width: 80, height: 60)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  ShelvesTitleAndNumberOfBookView(
                    widget.shelves?[index].shelfName ?? "",
                    TEXT_REGULAR_2Xx,widget.shelves?[index].bookList?.length?? 0
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => widget.onTapShelve(widget.shelves?[index]),
                    child: Padding(
                      padding: EdgeInsets.only(right: MARGIN_MEDIUM_2),
                      child: (widget.isAddShelves)
                          ? Checkbox(
                              value: widget.shelves?[index].isCheck,
                              onChanged: (value) {
                                setState(() {
                                  widget.shelves?[index].isCheck = value;
                                    widget.onTapCheckBox(widget.shelves?[index].shelfId ?? 0);


                                });
                              })
                          : Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

// class ShelvesListView extends StatefulWidget {
//   final bool isAddShelves;
//   final Function(ShelfVO?) onTapShelve;
//   final ShelfVO? shelf;
//   final Function(ShelfVO?) onTapCheckBox;
//   ShelvesListView(this.isAddShelves, this.onTapShelve, this.shelf,
//       {required this.onTapCheckBox});
//
//   @override
//   State<ShelvesListView> createState() => _ShelvesListViewState();
// }
//
// class _ShelvesListViewState extends State<ShelvesListView> {
//   // List<String> shelfNameList=[];
//   bool _value = false;
//   String image1 = "assets/images/bookPlaceholder.png";
//   String image2 = "assets/images/bookPlaceholder.png";
//   @override
//   void initState() {
//     super.initState();
//     if (widget.shelf != null) {
//       image1 = widget.shelf?.bookList?.last?.bookImage ?? "";
//       image2 = widget.shelf?.bookList?.first?.bookImage ?? "";
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // padding: EdgeInsets.symmetric(vertical: MARGIN_MEDIUM),
//       decoration: BoxDecoration(
//           border: Border(bottom: BorderSide(color: SMS_CODE_COLOR1))),
//       child: Padding(
//         padding: const EdgeInsets.only(top: MARGIN_MEDIUM),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       width: 95,
//                       height: 60,
//                       child: Stack(
//                         children: [
//                           Align(
//                               alignment: Alignment.centerRight,
//                               child: (widget.shelf?.bookList != null)
//                                   ? Image.network(
//                                       widget.shelf?.bookList?.first
//                                               ?.bookImage ??
//                                           "",
//                                       width: 95,
//                                       height: 60,
//                                     )
//                                   : Image.asset("assets/images/bb.png",
//                                       width: 80, height: 60)),
//                           Align(
//                               alignment: Alignment.centerLeft,
//                               child: (widget.shelf?.bookList != null)
//                                   ? Image.network(
//                                       widget.shelf?.bookList?.last?.bookImage ??
//                                           "",
//                                       width: 95,
//                                       height: 60,
//                                     )
//                                   : Image.asset("assets/images/b.jfif",
//                                       width: 80, height: 60)),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//             ShelvesTitleAndNumberOfBookView(
//               widget.shelf?.shelfName ?? "",
//               TEXT_REGULAR_2Xx,
//             ),
//             Spacer(),
//             GestureDetector(
//               onTap: () => widget.onTapShelve(widget.shelf),
//               child: Padding(
//                 padding: EdgeInsets.only(right: MARGIN_MEDIUM_2),
//                 child: (widget.isAddShelves)
//                     ? Checkbox(
//                         value: _value,
//                         onChanged: (value) {
//                           setState(() {
//                             _value = value!;
//
//                             widget.onTapCheckBox(widget.shelf);
//                           });
//                         })
//                     : Icon(Icons.arrow_forward_ios_outlined),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
