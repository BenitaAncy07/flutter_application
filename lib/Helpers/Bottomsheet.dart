// ignore_for_file: non_constant_identifier_names

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Helpers/Hexconversion.dart';
import 'package:flutter_application/Helpers/Sessions.dart';
import 'package:flutter_application/Helpers/Typography.dart';

void showBottomSheet1(
  BuildContext context,
  List<Update_Status_items> displayitem,
  String dummy,
) {
  showModalBottomSheet(
    backgroundColor:
        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
            ? lighttheme
            : darktheme,
    context: context,

    builder: (BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (dummy != "more option")
                  Column(
                    children: [
                      Text(
                        "Update your application status",
                        style: TextStyle(
                          fontSize: 15,
                          color:
                              AdaptiveTheme.of(context).mode ==
                                      AdaptiveThemeMode.light
                                  ? black
                                  : lighttheme,
                          fontFamily: headingfont,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        spacing: 10,
                        children: [
                          Icon(
                            Icons.visibility_off_outlined,
                            size: 13,
                            color:
                                AdaptiveTheme.of(context).mode ==
                                        AdaptiveThemeMode.light
                                    ? black.withOpacity(0.7)
                                    : lighttheme.withOpacity(0.7),
                          ),

                          Text(
                            "Employers won't see this",
                            style: TextStyle(
                              fontSize: 13,
                              color:
                                  AdaptiveTheme.of(context).mode ==
                                          AdaptiveThemeMode.light
                                      ? black.withOpacity(0.7)
                                      : lighttheme.withOpacity(0.7),
                              fontFamily: headingfont,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                if (dummy == "more option")
                  Text(
                    "Manage this application:",
                    style: TextStyle(
                      fontSize: 15,
                      color:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? black
                              : lighttheme,
                      fontFamily: headingfont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.close,
                    color:
                        AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? black
                            : lighttheme,
                  ),
                ),
              ],
            ),
            Divider(thickness: 1, color: hexToColor("#D4AF37")),
            for (int i = 0; i < displayitem.length; i++)
              Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Row(
                      spacing: 10,
                      children: [
                        ClipOval(
                          child: Container(
                            color: displayitem[i].color,
                            padding: EdgeInsets.all(4),
                            child: Icon(
                              displayitem[i].icon,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                        Text(
                          displayitem[i].text,
                          style: TextStyle(
                            fontSize: 15,
                            color:
                                AdaptiveTheme.of(context).mode ==
                                        AdaptiveThemeMode.light
                                    ? black
                                    : lighttheme,
                            fontFamily: headingfont,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1, color: hexToColor("#D4AF37")),
                ],
              ),
          ],
        ),
      );
    },
  );
}

void showBottomSheet2(BuildContext context) {
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
            //  mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.close,
                      color:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? black
                              : lighttheme,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      color:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? black
                              : lighttheme,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'SENIOR FLUTTER DEVELOPER ',
                style: TextStyle(
                  fontSize: 17,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? black
                          : lighttheme,
                  fontFamily: headingfont,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),
              Text(
                "Anjita It Solutions Pvt Ltd",
                style: TextStyle(
                  fontSize: 15,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? black
                          : lighttheme,
                  fontFamily: headingfont, // fontWeight: FontWeight.bold
                ),
              ),
              Text(
                "Mumbai,Maharastra",
                style: TextStyle(
                  fontSize: 15,
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
                  fontSize: 15,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? black
                          : lighttheme,
                  fontFamily: headingfont,
                ),
              ),
              Divider(thickness: 1, color: hexToColor("#D4AF37")),
              Text(
                'Profile insights',
                style: TextStyle(
                  fontSize: 15,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? black
                          : lighttheme,
                  fontFamily: headingfont,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                spacing: 10,
                children: [
                  Icon(
                    Icons.lightbulb,
                    color:
                        AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? black
                            : lighttheme,
                    size: 11,
                  ),
                  Text(
                    'Skills',
                    style: TextStyle(
                      fontSize: 11,
                      color:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? black
                              : lighttheme,
                      fontFamily: headingfont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Wrap(
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
                          color: hexToColor("#D4AF37").withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          item,
                          style: TextStyle(
                            fontSize: 11,
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
              Divider(thickness: 1, color: hexToColor("#D4AF37")),
              Text(
                'Job details',
                style: TextStyle(
                  fontSize: 15,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? black
                          : lighttheme,
                  fontFamily: headingfont,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                spacing: 10,
                children: [
                  Icon(
                    Icons.work_outline,
                    color:
                        AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? black
                            : lighttheme,
                    size: 11,
                  ),
                  Text(
                    'Job type',
                    style: TextStyle(
                      fontSize: 11,
                      color:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? black
                              : lighttheme,
                      fontFamily: headingfont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 8.0, // Space between items
                runSpacing: 8.0, // Space between rows
                children:
                    ["Permanent", "Full-time"].map((item) {
                      return Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: hexToColor("#D4AF37").withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          item,
                          style: TextStyle(
                            fontSize: 11,
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

              SizedBox(height: 10),
              Row(
                spacing: 10,
                children: [
                  Icon(
                    Icons.timer,
                    color:
                        AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? black
                            : lighttheme,
                    size: 11,
                  ),
                  Text(
                    'Shift and schedule',
                    style: TextStyle(
                      fontSize: 11,
                      color:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? black
                              : lighttheme,
                      fontFamily: headingfont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 8.0, // Space between items
                runSpacing: 8.0, // Space between rows
                children:
                    ["Day shift", "Monday to Friday"].map((item) {
                      return Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: hexToColor("#D4AF37").withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          item,
                          style: TextStyle(
                            fontSize: 11,
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
              SizedBox(height: 10),
              Row(
                spacing: 10,
                children: [
                  Icon(
                    Icons.currency_rupee,
                    color:
                        AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? black
                            : lighttheme,
                    size: 11,
                  ),
                  Text(
                    'Pay',
                    style: TextStyle(
                      fontSize: 11,
                      color:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? black
                              : lighttheme,
                      fontFamily: headingfont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 8.0, // Space between items
                runSpacing: 8.0, // Space between rows
                children:
                    ["₹ 35,000 - ₹ 45,000 a month"].map((item) {
                      return Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: hexToColor("#D4AF37").withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          item,
                          style: TextStyle(
                            fontSize: 11,
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
              SizedBox(height: 10),
              Divider(thickness: 1, color: hexToColor("#D4AF37")),
              Text(
                'Benefits',
                style: TextStyle(
                  fontSize: 15,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? black
                          : lighttheme,
                  fontFamily: headingfont,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 8.0, // Space between items
                runSpacing: 8.0, // Space between rows
                children:
                    ["Health Insurance", "Work from home"].map((item) {
                      return Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: hexToColor("#D4AF37").withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          item,
                          style: TextStyle(
                            fontSize: 11,
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
              Divider(thickness: 1, color: hexToColor("#D4AF37")),
              Text(
                'Full job description',
                style: TextStyle(
                  fontSize: 15,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? black
                          : lighttheme,
                  fontFamily: headingfont,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                children: [
                  Text(
                    'Are you passionate about crafting seamless mobile experiences? We\'re looking for a flutter developer to join our growing team.',
                    style: TextStyle(
                      fontSize: 14,
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
              SizedBox(height: 10),
              Text(
                'Responsibilities:',
                style: TextStyle(
                  fontSize: 14,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? black
                          : lighttheme,
                  fontFamily: headingfont,
                ),
              ),
              SizedBox(height: 10),
              for (var i = 0; i < 10; i++)
                Text(
                  ' \u2022 Create app screens using Flutter widgets based on designs provided.',
                  style: TextStyle(
                    fontSize: 14,
                    color:
                        AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? black
                            : lighttheme,
                    fontFamily: headingfont,
                  ),
                ),
              SizedBox(height: 10),
              Text(
                'What we\'re looking for:',
                style: TextStyle(
                  fontSize: 14,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? black
                          : lighttheme,
                  fontFamily: headingfont,
                ),
              ),
              SizedBox(height: 10),
              for (var i = 0; i < 10; i++)
                Text(
                  ' \u2022 Bachelor\'s degree in Computer Science and Engineering or related field.',
                  style: TextStyle(
                    fontSize: 14,
                    color:
                        AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? black
                            : lighttheme,
                    fontFamily: headingfont,
                  ),
                ),
              SizedBox(height: 10),
              //   Divider(thickness: 1, color: hexToColor("#D4AF37")),
              //   SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: hexToColor(
                      "#D4AF37",
                    ), // Button background color
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ), // Button padding
                  ),
                  onPressed: () {},
                  child: Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.flag,
                        size: 20,
                        color:
                            AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.light
                                ? black
                                : lighttheme,
                      ),
                      Text(
                        "Report job",
                        style: TextStyle(
                          fontSize: 15,
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
              //  SizedBox(height: 10),
              // Divider(thickness: 1, color: hexToColor("#D4AF37")),
              SizedBox(height: 10),
            ],
          ),
        ),
      );
    },
  );
}

int _selectedOption = 1;

void showBottomSheet3(BuildContext context) {
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Profile settings",
                  style: TextStyle(
                    fontSize: 18,
                    color:
                        AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? black
                            : lighttheme,
                    fontFamily: headingfont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.close,
                    color:
                        AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? black
                            : lighttheme,
                  ),
                ),
              ],
            ),
            Divider(thickness: 1, color: hexToColor("#D4AF37")),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.85,
              padding: EdgeInsets.fromLTRB(8, 1, 8, 1),
              decoration: BoxDecoration(
                border: Border.all(color: hexToColor("#D4AF37"), width: 1),
                borderRadius: BorderRadius.circular(3),
              ),

              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.visibility,
                      size: 15,
                      color: hexToColor("#D4AF37"),
                    ),

                    title: Text(
                      "Employers can find your profile",
                      style: TextStyle(
                        fontSize: 15,
                        color:
                            AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.light
                                ? black
                                : lighttheme,
                        fontFamily: headingfont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Radio<int>(
                      value: 0,
                      groupValue: _selectedOption,
                      onChanged: (int? value) {},
                    ),
                  ),
                  Wrap(
                    children: [
                      Text(
                        "Employers can find your profile and contact you about jobs. we attempt to hide identifiable details until you respond to employers.",
                        style: TextStyle(
                          fontSize: 13,
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
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.85,
              padding: EdgeInsets.fromLTRB(8, 1, 8, 1),
              decoration: BoxDecoration(
                border: Border.all(color: hexToColor("#D4AF37"), width: 1),
                borderRadius: BorderRadius.circular(3),
              ),

              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.visibility_off,
                      size: 15,
                      color: hexToColor("#D4AF37"),
                    ),

                    title: Text(
                      "Employers can't find your profile",
                      style: TextStyle(
                        fontSize: 15,
                        color:
                            AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.light
                                ? black
                                : lighttheme,
                        fontFamily: headingfont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Radio<int>(
                      value: 1,
                      groupValue: _selectedOption,
                      onChanged: (int? value) {},
                    ),
                  ),
                  Wrap(
                    children: [
                      Text(
                        "Only employers you've applied to can see your profile. Other employers can't find your profile and contact you about jobs",
                        style: TextStyle(
                          fontSize: 13,
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
                ],
              ),
            ),
            Divider(thickness: 1, color: hexToColor("#D4AF37")),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: hexToColor(
                    "#D4AF37",
                  ), // Button background color
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ), // Button padding
                ),
                onPressed: () {},
                child: Text(
                  "Save",
                  style: TextStyle(
                    fontSize: 13,
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
            ),
          ],
        ),
      );
    },
  );
}

void qualification_bottomSheet(
  BuildContext context,
  qualification_items item1,
  List contents,
  List<String> dropdownitems,
  List starrequired,
) {
  TextEditingController textbox1controller = TextEditingController();
  TextEditingController textbox2controller = TextEditingController();
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item1.heading,
                  style: TextStyle(
                    fontSize: 18,
                    color:
                        AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? black
                            : lighttheme,
                    fontFamily: headingfont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.close,
                    color:
                        AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? black
                            : lighttheme,
                  ),
                ),
              ],
            ),
            Divider(thickness: 1, color: hexToColor("#D4AF37")),
            Wrap(
              spacing: 8.0, // Space between items
              runSpacing: 8.0, // Space between rows
              children:
                  contents.map((item) {
                    return Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: hexToColor("#D4AF37").withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        spacing: 10,

                        children: [
                          Expanded(
                            child: Text(
                              item,

                              style: TextStyle(
                                fontSize: 11,
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
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              color:
                                  AdaptiveTheme.of(context).mode ==
                                          AdaptiveThemeMode.light
                                      ? black
                                      : lighttheme,
                              size: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                RichText(
                  text: TextSpan(
                    text: item1.textbox1,
                    style: TextStyle(
                      fontSize: 15,
                      color:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? black
                              : lighttheme,
                      fontFamily: headingfont,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      if (starrequired[0] == 1)
                        TextSpan(
                          text: ' *',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.red,
                            fontFamily: headingfont,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: textbox1controller,
                    cursorColor: hexToColor("#D4AF37"),
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: headingfont,
                      color:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? black
                              : lighttheme,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: hexToColor("#D4AF37"),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: hexToColor("#D4AF37"),
                          width: 1.0,
                        ),
                      ),
                    ),
                    onChanged: (query) {
                      print("Search query: $query");
                    },
                  ),
                ),
                if (item1.textbox2.isNotEmpty)
                  RichText(
                    text: TextSpan(
                      text: item1.textbox2,
                      style: TextStyle(
                        fontSize: 15,
                        color:
                            AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.light
                                ? black
                                : lighttheme,
                        fontFamily: headingfont,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        if (starrequired[1] == 1)
                          TextSpan(
                            text: ' *',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.red,
                              fontFamily: headingfont,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ],
                    ),
                  ),
                if (dropdownitems.isEmpty && item1.textbox2.isNotEmpty)
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: textbox2controller,
                      cursorColor: hexToColor("#D4AF37"),
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: headingfont,
                        color:
                            AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.light
                                ? black
                                : lighttheme,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: hexToColor("#D4AF37"),
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: hexToColor("#D4AF37"),
                            width: 1.0,
                          ),
                        ),
                      ),
                      onChanged: (query) {
                        print("Search query: $query");
                      },
                    ),
                  ),
                if (dropdownitems.isNotEmpty)
                  Container(
                    padding: EdgeInsets.all(10),
                    child: DropdownButtonFormField<String>(
                      value: "Beginner", // Default selected value
                      iconEnabledColor: hexToColor("#D4AF37"),

                      items:
                          dropdownitems.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: headingfont,
                                  color:
                                      AdaptiveTheme.of(context).mode ==
                                              AdaptiveThemeMode.light
                                          ? black
                                          : lighttheme,
                                ),
                              ),
                            );
                          }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          print("Selected: $newValue");
                        }
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: hexToColor("#D4AF37"),
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: hexToColor("#D4AF37"),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            Divider(thickness: 1, color: hexToColor("#D4AF37")),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: hexToColor(
                    "#D4AF37",
                  ), // Button background color
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ), // Button padding
                ),
                onPressed: () {},
                child: Text(
                  "Save",
                  style: TextStyle(
                    fontSize: 13,
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
            ),
            SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? lighttheme
                          : darktheme,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ), // Button padding
                ),
                onPressed: () {},
                child: Text(
                  "Delete",
                  style: TextStyle(
                    fontSize: 13,
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
            ),
          ],
        ),
      );
    },
  );
}

void minimumpay_bottomSheet(
  BuildContext context,
  jobpreference_items item1,

  List<String> dropdownitems,
) {
  TextEditingController textbox1controller = TextEditingController();

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item1.heading,
                  style: TextStyle(
                    fontSize: 18,
                    color:
                        AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? black
                            : lighttheme,
                    fontFamily: headingfont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.close,
                    color:
                        AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? black
                            : lighttheme,
                  ),
                ),
              ],
            ),
            Divider(thickness: 1, color: hexToColor("#D4AF37")),

            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                RichText(
                  text: TextSpan(
                    text: item1.subheading,
                    style: TextStyle(
                      fontSize: 15,
                      color:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? black
                              : lighttheme,
                      fontFamily: headingfont,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [],
                  ),
                ),
                SizedBox(height: 10),

                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: hexToColor("#D4AF37").withOpacity(0.2),
                  ),
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Row(
                    spacing: 10,
                    children: [
                      Icon(
                        Icons.visibility_off_outlined,
                        color: hexToColor("#D4AF37"),
                        size: 13,
                      ),

                      Text(
                        "Not shown to employers",
                        style: TextStyle(
                          fontSize: 13,
                          color:
                              AdaptiveTheme.of(context).mode ==
                                      AdaptiveThemeMode.light
                                  ? black
                                  : lighttheme,
                          fontFamily: headingfont,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                RichText(
                  text: TextSpan(
                    text: item1.textbox1,
                    style: TextStyle(
                      fontSize: 15,
                      color:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? black
                              : lighttheme,
                      fontFamily: headingfont,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [],
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: textbox1controller,
                    cursorColor: hexToColor("#D4AF37"),
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: headingfont,
                      color:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? black
                              : lighttheme,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: hexToColor("#D4AF37"),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: hexToColor("#D4AF37"),
                          width: 1.0,
                        ),
                      ),
                    ),
                    onChanged: (query) {
                      print("Search query: $query");
                    },
                  ),
                ),

                RichText(
                  text: TextSpan(
                    text: item1.textbox2,
                    style: TextStyle(
                      fontSize: 15,
                      color:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? black
                              : lighttheme,
                      fontFamily: headingfont,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [],
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: DropdownButtonFormField<String>(
                    value: "per month", // Default selected value
                    iconEnabledColor: hexToColor("#D4AF37"),

                    items:
                        dropdownitems.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: headingfont,
                                color:
                                    AdaptiveTheme.of(context).mode ==
                                            AdaptiveThemeMode.light
                                        ? black
                                        : lighttheme,
                              ),
                            ),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        print("Selected: $newValue");
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: hexToColor("#D4AF37"),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: hexToColor("#D4AF37"),
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Divider(thickness: 1, color: hexToColor("#D4AF37")),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: hexToColor(
                    "#D4AF37",
                  ), // Button background color
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ), // Button padding
                ),
                onPressed: () {},
                child: Text(
                  "Save",
                  style: TextStyle(
                    fontSize: 13,
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
            ),
            SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? lighttheme
                          : darktheme,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ), // Button padding
                ),
                onPressed: () {},
                child: Text(
                  "Delete",
                  style: TextStyle(
                    fontSize: 13,
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
            ),
          ],
        ),
      );
    },
  );
}

void jobpreference_bottomsheet(
  BuildContext context,
  jobpreference_items item1,
  List<String> options,
  List<String> options1,
) {
  List<String> selectedOptions = [], selectedOptions1 = [];

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item1.heading,
                  style: TextStyle(
                    fontSize: 18,
                    color:
                        AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? black
                            : lighttheme,
                    fontFamily: headingfont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.close,
                    color:
                        AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? black
                            : lighttheme,
                  ),
                ),
              ],
            ),
            Divider(thickness: 1, color: hexToColor("#D4AF37")),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (item1.subheading.isNotEmpty)
                  RichText(
                    text: TextSpan(
                      text: item1.subheading,
                      style: TextStyle(
                        fontSize: 15,
                        color:
                            AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.light
                                ? black
                                : lighttheme,
                        fontFamily: headingfont,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [],
                    ),
                  ),
                if (item1.subheading.isNotEmpty) SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text: item1.textbox1,
                    style: TextStyle(
                      fontSize: 15,
                      color:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? black
                              : lighttheme,
                      fontFamily: headingfont,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [],
                  ),
                ),

                SizedBox(height: 10),
                Wrap(
                  children:
                      options.map((option) {
                        return Row(
                          spacing: 10,

                          children: [
                            Checkbox(
                              activeColor: hexToColor("#D4AF37"),
                              value: selectedOptions.contains(option),
                              onChanged: (bool? value) {
                                if (value == true) {
                                  selectedOptions.add(option);
                                } else {
                                  selectedOptions.remove(option);
                                }
                              },
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Text(
                                  option,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color:
                                        AdaptiveTheme.of(context).mode ==
                                                AdaptiveThemeMode.light
                                            ? black
                                            : lighttheme,
                                    fontFamily: headingfont,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                ),

                if (item1.textbox2.isNotEmpty)
                  RichText(
                    text: TextSpan(
                      text: item1.textbox2,
                      style: TextStyle(
                        fontSize: 15,
                        color:
                            AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.light
                                ? black
                                : lighttheme,
                        fontFamily: headingfont,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [],
                    ),
                  ),
                if (item1.textbox2.isNotEmpty) SizedBox(height: 10),
                Wrap(
                  children:
                      options1.map((option) {
                        return Row(
                          spacing: 10,

                          children: [
                            Checkbox(
                              activeColor: hexToColor("#D4AF37"),
                              value: selectedOptions1.contains(option),
                              onChanged: (bool? value) {
                                if (value == true) {
                                  selectedOptions1.add(option);
                                } else {
                                  selectedOptions1.remove(option);
                                }
                              },
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Text(
                                  option,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color:
                                        AdaptiveTheme.of(context).mode ==
                                                AdaptiveThemeMode.light
                                            ? black
                                            : lighttheme,
                                    fontFamily: headingfont,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                ),
                Divider(thickness: 1, color: hexToColor("#D4AF37")),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: hexToColor(
                        "#D4AF37",
                      ), // Button background color
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ), // Button padding
                    ),
                    onPressed: () {},
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 13,
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
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? lighttheme
                              : darktheme, // Button background color
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ), // Button padding
                    ),
                    onPressed: () {},
                    child: Text(
                      "Delete",
                      style: TextStyle(
                        fontSize: 13,
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
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
