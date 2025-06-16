import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Controllers/Utilities/Actions.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_application/View/Helpers/Iconcontents.dart';
import 'package:flutter_application/View/Helpers/UIconstants.dart';

class jobdetailBottomSheet {
  void mainwidget(BuildContext context) {
    showModalBottomSheet(
      backgroundColor:
          AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
              ? lighttheme
              : darktheme,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appbarwidget(context),
                headerwidget(context),
                Divider(thickness: 1, color: hexToColor(goldencolor)),
                profilewidget(context),
                Divider(thickness: 1, color: hexToColor(goldencolor)),
                jobdetailwidget(context),
                Divider(thickness: 1, color: hexToColor(goldencolor)),
                benefitswidget(context),
                Divider(thickness: 1, color: hexToColor(goldencolor)),
                descriptionwidget(context),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: buttonwidget(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  //================================Appbar widget==========================
  appbarwidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            closeaction(context);
          },
          icon: Icon(
            closeicon,
            size: appbariconsize,
            color:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black
                    : lighttheme,
          ),
        ),
        IconButton(
          onPressed: () {
            shareaction();
          },
          icon: Icon(
            shareicon,
            size: appbariconsize,
            color:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black
                    : lighttheme,
          ),
        ),
      ],
    );
  }

  //==============================Button widget=============================
  buttonwidget(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: hexToColor(goldencolor),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        onPressed: () {
          reportjobaction();
        },
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              flagicon,
              size: buttoniconsize,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
            ),
            Text(
              reportjobbuttontext,
              style: TextStyle(
                fontSize: buttontextsize,
                color:
                    AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                        ? black
                        : lighttheme,
                fontFamily: headingfont,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //================================Header widget===========================
  Widget headerwidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10, top: 10),
          child: Text(
            'SENIOR FLUTTER DEVELOPER ',
            style: TextStyle(
              fontSize: homescreentextsize,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
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
            fontSize: homeheadingtextsize,
            color:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black
                    : lighttheme,
            fontFamily: headingfont,
          ),
        ),
        Text(
          "Mumbai,Maharastra",
          style: TextStyle(
            fontSize: homeheadingtextsize,
            color:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black
                    : lighttheme,
            fontFamily: headingfont,
          ),
        ),
        Text(
          "Remote",
          style: TextStyle(
            fontSize: homeheadingtextsize,
            color:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black
                    : lighttheme,
            fontFamily: headingfont,
          ),
        ),
      ],
    );
  }

  //===============================Profile widget=================
  Widget profilewidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            profileinsighttext,
            style: TextStyle(
              fontSize: homeheadingtextsize,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
              fontFamily: headingfont,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          spacing: 10,
          children: [
            Icon(
              skillicon,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
              size: homebottomsheeticonsize,
            ),
            Text(
              skilltext,
              style: TextStyle(
                fontSize: jobdetailbottomsheetsize,
                color:
                    AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                        ? black
                        : lighttheme,
                fontFamily: headingfont,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Wrap(
            spacing: 8.0, // Space between items
            runSpacing: 8.0, // Space between rows
            children:
                [
                  "Flutter",
                  "ios development",
                  "dart",
                  "Android",
                  "swift",
                  "php",
                ].map((item) {
                  return Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: hexToColor(goldencolor).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: jobdetailbottomsheetsize,
                        color:
                            AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.light
                                ? black
                                : lighttheme,
                        fontFamily: headingfont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }

  //=============================Job detail widget=====================
  jobdetailwidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          jobdetailtext,
          style: TextStyle(
            fontSize: homeheadingtextsize,
            color:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black
                    : lighttheme,
            fontFamily: headingfont,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10, top: 10),
          child: Row(
            spacing: 10,
            children: [
              Icon(
                jobtypeicon,
                color:
                    AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                        ? black
                        : lighttheme,
                size: homebottomsheeticonsize,
              ),
              Text(
                jobtypetext,
                style: TextStyle(
                  fontSize: jobdetailbottomsheetsize,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? black
                          : lighttheme,
                  fontFamily: headingfont,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children:
              ["Permanent", "Full-time"].map((item) {
                return Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: hexToColor(goldencolor).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: jobdetailbottomsheetsize,
                      color:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? black
                              : lighttheme,
                      fontFamily: headingfont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
        ),

        Padding(
          padding: EdgeInsets.only(bottom: 10, top: 10),
          child: Row(
            spacing: 10,
            children: [
              Icon(
                shifticon,
                color:
                    AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                        ? black
                        : lighttheme,
                size: homebottomsheeticonsize,
              ),
              Text(
                shifttext,
                style: TextStyle(
                  fontSize: jobdetailbottomsheetsize,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? black
                          : lighttheme,
                  fontFamily: headingfont,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Wrap(
          spacing: 8.0, // Space between items
          runSpacing: 8.0, // Space between rows
          children:
              ["Day shift", "Monday to Friday"].map((item) {
                return Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: hexToColor(goldencolor).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: jobdetailbottomsheetsize,
                      color:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? black
                              : lighttheme,
                      fontFamily: headingfont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10, top: 10),
          child: Row(
            spacing: 10,
            children: [
              Icon(
                currencyicon,
                color:
                    AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                        ? black
                        : lighttheme,
                size: homebottomsheeticonsize,
              ),
              Text(
                paytext,
                style: TextStyle(
                  fontSize: jobdetailbottomsheetsize,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? black
                          : lighttheme,
                  fontFamily: headingfont,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Wrap(
            spacing: 8.0, // Space between items
            runSpacing: 8.0, // Space between rows
            children:
                ["₹ 35,000 - ₹ 45,000 a month"].map((item) {
                  return Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: hexToColor(goldencolor).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: jobdetailbottomsheetsize,
                        color:
                            AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.light
                                ? black
                                : lighttheme,
                        fontFamily: headingfont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }

  //=====================================benefits widget====================
  Widget benefitswidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          benefitstext,
          style: TextStyle(
            fontSize: homeheadingtextsize,
            color:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black
                    : lighttheme,
            fontFamily: headingfont,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Wrap(
            spacing: 8.0, // Space between items
            runSpacing: 8.0, // Space between rows
            children:
                ["Health Insurance", "Work from home"].map((item) {
                  return Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: hexToColor(goldencolor).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: jobdetailbottomsheetsize,
                        color:
                            AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.light
                                ? black
                                : lighttheme,
                        fontFamily: headingfont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }

  //================================description widget========================
  Widget descriptionwidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fulljob,
          style: TextStyle(
            fontSize: homeheadingtextsize,
            color:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black
                    : lighttheme,
            fontFamily: headingfont,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10, top: 10),
          child: Wrap(
            children: [
              Text(
                'Are you passionate about crafting seamless mobile experiences? We\'re looking for a flutter developer to join our growing team.',
                style: TextStyle(
                  fontSize: homesubheadingtextsize,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? black
                          : lighttheme,
                  fontFamily: headingfont,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            responsibilitiestext,
            style: TextStyle(
              fontSize: homesubheadingtextsize2,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
              fontFamily: headingfont,
            ),
          ),
        ),
        for (var i = 0; i < 10; i++)
          Text(
            ' \u2022 Create app screens using Flutter widgets based on designs provided.',
            style: TextStyle(
              fontSize: homesubheadingtextsize,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
              fontFamily: headingfont,
            ),
          ),
        Padding(
          padding: EdgeInsets.only(bottom: 10, top: 10),
          child: Text(
            requirementstext,
            style: TextStyle(
              fontSize: homesubheadingtextsize2,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
              fontFamily: headingfont,
            ),
          ),
        ),
        for (var i = 0; i < 10; i++)
          Text(
            ' \u2022 Bachelor\'s degree in Computer Science and Engineering or related field.',
            style: TextStyle(
              fontSize: homesubheadingtextsize,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
              fontFamily: headingfont,
            ),
          ),
        Padding(padding: EdgeInsets.only(bottom: 10)),
      ],
    );
  }
}
