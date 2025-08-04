// ignore_for_file: must_be_immutable

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_application/Controllers/Cubits/MyjobCubit.dart';
import 'package:flutter_application/Controllers/Utilities/Actions.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/Controllers/Constants/Appconstants.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_application/View/Helpers/Iconcontents.dart';
import 'package:flutter_application/View/Helpers/Imagecontents.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyJobs extends StatelessWidget {
  MyJobs({super.key});

  List<String> optioncount = [
    "0", "0", //"20",
    "0",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyjobCubit, int>(
      builder: (context, selectedindex) {
        return Column(
          children: [
            headerwidget(context, selectedindex),
            if (optioncount[selectedindex] == "0")
              emptycontentdisplay(context, selectedindex),
            if (optioncount[selectedindex] != "0")
              contentwidget(context, selectedindex),
          ],
        );
      },
    );
  }

  //================================header widget=====================
  Widget headerwidget(BuildContext context, int selectedindex) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: MyJoboptions.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              myjobheaderchange(index, context);
            },
            child: Container(
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width * 0.2,
              child: Column(
                children: [
                  Text(
                    optioncount[index],
                    style: TextStyle(
                      fontSize: textsize2,
                      color:
                          index == selectedindex
                              ? hexToColor(goldencolor)
                              : AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? black
                              : lighttheme,
                      fontFamily: headingfont,
                      fontWeight:
                          index == selectedindex ? FontWeight.bold : null,
                    ),
                  ),
                  Text(
                    MyJoboptions[index],
                    style: TextStyle(
                      fontSize: textsize2,
                      color:
                          index == selectedindex
                              ? hexToColor(goldencolor)
                              : AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? black
                              : lighttheme,
                      fontFamily: headingfont,
                      fontWeight:
                          index == selectedindex ? FontWeight.bold : null,
                    ),
                  ),
                  Divider(
                    color: hexToColor(goldencolor),
                    thickness: index == selectedindex ? 2 : 1,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  //=============================Empty widget========================
  Widget emptycontentdisplay(BuildContext context, int selectedindex) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(myjobnocontent_img[selectedindex]),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                MyJobnocontent_text[selectedindex],
                style: TextStyle(
                  fontSize: textsize5,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? black
                          : lighttheme,
                  fontFamily: headingfont,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10, top: 10),
              child: Text(
                MyJobnocontent_text1[selectedindex],
                style: TextStyle(
                  fontSize: textsize2,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? black
                          : lighttheme,
                  fontFamily: headingfont,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: hexToColor(goldencolor),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              onPressed: () {
                findjobaction(context);
              },
              child: Text(
                findjobsbuttontext,
                style: TextStyle(
                  fontSize: textsize3,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? black
                          : lighttheme,
                  fontFamily: headingfont,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //==================================Content widget========================
  Widget contentwidget(BuildContext context, int selectedindex) {
    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 20,
        width: double.infinity,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 10,
                  child: Card(
                    color:
                        AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? lighttheme
                            : darktheme,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: hexToColor(goldencolor),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 4,
                    child: InkWell(
                      onTap: () {
                        // jobviewaction(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(8, 1, 8, 1),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: hexToColor(goldencolor),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Text(
                                    "Application viewed",
                                    style: TextStyle(
                                      fontSize: textsize1,
                                      color:
                                          AdaptiveTheme.of(context).mode ==
                                                  AdaptiveThemeMode.light
                                              ? black
                                              : lighttheme,
                                      fontFamily: headingfont,
                                    ),
                                  ),
                                ),

                                IconButton(
                                  iconSize: iconsize2,
                                  onPressed: () {
                                    moreaction(
                                      context,
                                      MyJoboptions[selectedindex],
                                    );
                                  },
                                  icon: Icon(
                                    moreicon,
                                    color: hexToColor(goldencolor),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                'SENIOR FLUTTER DEVELOPER ',
                                style: TextStyle(
                                  fontSize: textsize5,
                                  color:
                                      AdaptiveTheme.of(context).mode ==
                                              AdaptiveThemeMode.light
                                          ? black
                                          : lighttheme,
                                  fontFamily: headingfont,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              "Anjita It Solutions Pvt Ltd",
                              style: TextStyle(
                                fontSize: textsize3,
                                color:
                                    AdaptiveTheme.of(context).mode ==
                                            AdaptiveThemeMode.light
                                        ? black
                                        : lighttheme,
                                fontFamily:
                                    headingfont, // fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              "Mumbai,Maharastra",
                              style: TextStyle(
                                fontSize: textsize3,
                                color:
                                    AdaptiveTheme.of(context).mode ==
                                            AdaptiveThemeMode.light
                                        ? black
                                        : lighttheme,
                                fontFamily: headingfont,
                              ),
                            ),
                            Text(
                              "Remote",
                              style: TextStyle(
                                fontSize: textsize3,
                                color:
                                    AdaptiveTheme.of(context).mode ==
                                            AdaptiveThemeMode.light
                                        ? black
                                        : lighttheme,
                                fontFamily: headingfont,
                              ),
                            ),
                            Text(
                              "Applied on 10 Apr",
                              style: TextStyle(
                                fontSize: textsize3,
                                color:
                                    AdaptiveTheme.of(context).mode ==
                                            AdaptiveThemeMode.light
                                        ? black.withOpacity(0.5)
                                        : lighttheme.withOpacity(0.5),
                                fontFamily: headingfont,
                              ),
                            ),

                            if (MyJoboptions[selectedindex] != archived)
                              Padding(
                                padding: EdgeInsets.only(bottom: 10, top: 10),
                                child: buttonwidget(context, selectedindex),
                              ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Container(
                                color: hexToColor(goldencolor).withOpacity(0.3),
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.85,
                                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                child: Row(
                                  spacing: 10,
                                  children: [
                                    Icon(
                                      blockicon,
                                      color:
                                          AdaptiveTheme.of(context).mode ==
                                                  AdaptiveThemeMode.light
                                              ? black
                                              : lighttheme,
                                      size: iconsize5,
                                    ),
                                    Text(
                                      "Job closed or expired",
                                      style: TextStyle(
                                        fontSize: textsize2,
                                        color:
                                            AdaptiveTheme.of(context).mode ==
                                                    AdaptiveThemeMode.light
                                                ? black
                                                : lighttheme,
                                        fontFamily: headingfont,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  //===========================button widget===================
  buttonwidget(BuildContext context, int selectedindex) {
    return InkWell(
      onTap: () {
        updatestatusaction(MyJoboptions[selectedindex], context);
      },
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.85,
        padding: EdgeInsets.fromLTRB(8, 1, 8, 1),
        decoration: BoxDecoration(
          border: Border.all(color: hexToColor(goldencolor), width: 1),
          borderRadius: BorderRadius.circular(3),
        ),

        child: Text(
          MyJoboptions[selectedindex] == saved
              ? applynowbuttontext
              : updatestatusbuttontext,
          style: TextStyle(
            fontSize: textsize5,
            color:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black
                    : lighttheme,
            fontFamily: headingfont,
          ),
        ),
      ),
    );
  }
}
