import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/datas.dart';
import '../resources/dimens.dart';
import '../resources/strings.dart';
import '../viewers/library_bottomsheet_view.dart';

class RadioTestPage extends StatefulWidget {
  const RadioTestPage({Key? key}) : super(key: key);

  @override
  State<RadioTestPage> createState() => _RadioTestPageState();
}

class _RadioTestPageState extends State<RadioTestPage> {
  // String radioValue="List";
  // void initSate() {
  //   super.initState();
  //   radioValue = "";
  // }

  // setSelectedRadio(String val) {
  //   setState(() {
  //     if(val =="List"){
  //       radioValue="List";
  //     }else if(val == "Large grid"){
  //       radioValue="Large grid";
  //     }else if(val == "Small grid"){
  //       radioValue="Small grid";
  //     }
  //
  //   });
  // }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        child: Center(
          child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.deepPurple),
              onPressed: () {
               setState(() {
                 bottomSheet(context);
               });
              },
              child: Text(
                "Click",
                style: TextStyle(fontSize: 16, color: Colors.white),
              )),
        ),
      ),
    );
  }

  bottomSheet(context) {
    String? selectedValue = "List";
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: MARGIN_MEDIUM_3,
                    right: MARGIN_MEDIUM_3,
                    top: MARGIN_MEDIUM_2),
                child: Text(
                  "View as",
                  style: TextStyle(
                      fontSize: TEXT_REGULAR_2Xx,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Divider(
                color: SMS_CODE_COLOR,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text("List"),
                    leading: Radio(
                      value: "List",
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                          debugPrint("Radio 1$selectedValue");
                        });
                      },
                      groupValue: selectedValue,
                      activeColor: Colors.green,
                    ),
                  ),
                  ListTile(
                    title: Text("Large grid"),
                    leading: Radio(
                      value: "Large grid",
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                          debugPrint("Radio 2$selectedValue");
                        });
                      },
                      groupValue: selectedValue,
                      activeColor: Colors.green,
                    ),
                  ),ListTile(
                    title: Text("Small grid"),
                    leading: Radio(
                      value: "Small grid",
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                          debugPrint("Radio 3$selectedValue");
                        });
                      },
                      groupValue: selectedValue,
                      activeColor: Colors.green,
                    ),
                  )
                ],
              )
            ],
          );
        });
  }
}
