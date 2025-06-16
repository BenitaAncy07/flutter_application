// ignore_for_file: non_constant_identifier_names

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Controllers/Cubits/ProfileSettingCubit.dart';
import 'package:flutter_application/Controllers/Utilities/Actions.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/Models/AppCubitmodels.dart';
import 'package:flutter_application/Models/Appconstants.dart';
import 'package:flutter_application/Models/AppUImodels.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_application/View/Helpers/Iconcontents.dart';
import 'package:flutter_application/View/Helpers/UIconstants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profilebottomsheet {
  void settingBottomSheet1(BuildContext context) {
    showModalBottomSheet(
      backgroundColor:
          AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
              ? lighttheme
              : darktheme,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BlocBuilder<ProfilesettingCubit, ProfileState>(
          builder: (context, statecontent) {
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
                        profilesetting,
                        style: TextStyle(
                          fontSize: profiletextsize4,
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
                        onPressed: () {
                          closeaction(context);
                        },
                        icon: Icon(
                          size: appbariconsize,
                          closeicon,
                          color:
                              AdaptiveTheme.of(context).mode ==
                                      AdaptiveThemeMode.light
                                  ? black
                                  : lighttheme,
                        ),
                      ),
                    ],
                  ),
                  Divider(thickness: 1, color: hexToColor(goldencolor)),
                  for (int i = 0; i < profilesettinglist.length; i++)
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.85,
                        padding: EdgeInsets.fromLTRB(8, 1, 8, 1),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: hexToColor(goldencolor),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(3),
                        ),

                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(
                                profilesettinglist[i].icon,
                                size: buttoniconsize4,
                                color: hexToColor(goldencolor),
                              ),

                              title: Text(
                                profilesettinglist[i].heading,
                                style: TextStyle(
                                  fontSize: buttoniconsize4,
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
                                value: i,
                                groupValue: statecontent.selectedindex,
                                onChanged: (int? value) {
                                  profilesettingchange(context, value!);
                                },
                              ),
                            ),
                            Wrap(
                              children: [
                                Text(
                                  profilesettinglist[i].content,
                                  style: TextStyle(
                                    fontSize: profiletextsize2,
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
                    ),

                  Divider(thickness: 1, color: hexToColor(goldencolor)),
                ],
              ),
            );
          },
        );
      },
    );
  }

  //==========================================Bottomsheet 2====================================
  void profile_bottomSheet2(
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
                      fontSize: profiletextsize4,
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
                    onPressed: () {
                      closeaction(context);
                    },
                    icon: Icon(
                      size: appbariconsize,
                      closeicon,
                      color:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? black
                              : lighttheme,
                    ),
                  ),
                ],
              ),
              Divider(thickness: 1, color: hexToColor(goldencolor)),
              Wrap(
                spacing: 8.0, // Space between items
                runSpacing: 8.0, // Space between rows
                children:
                    contents.map((item) {
                      return Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: hexToColor(goldencolor).withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          spacing: 10,

                          children: [
                            Expanded(
                              child: Text(
                                item,

                                style: TextStyle(
                                  fontSize: profiletextsize5,
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
                              onPressed: () {
                                profiledetaildelete();
                              },
                              icon: Icon(
                                deleteicon,
                                color:
                                    AdaptiveTheme.of(context).mode ==
                                            AdaptiveThemeMode.light
                                        ? black
                                        : lighttheme,
                                size: buttoniconsize5,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    RichText(
                      text: TextSpan(
                        text: item1.textbox1,
                        style: TextStyle(
                          fontSize: profiletextsize1,
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
                                fontSize: profiletextsize2,
                                color: red,
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
                        cursorColor: hexToColor(goldencolor),
                        style: TextStyle(
                          fontSize: profiletextsize2,
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
                              color: hexToColor(goldencolor),
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: hexToColor(goldencolor),
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
                            fontSize: profiletextsize1,
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
                                  fontSize: profiletextsize2,
                                  color: red,
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
                          cursorColor: hexToColor(goldencolor),
                          style: TextStyle(
                            fontSize: profiletextsize2,
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
                                color: hexToColor(goldencolor),
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: hexToColor(goldencolor),
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
                          iconEnabledColor: hexToColor(goldencolor),

                          items:
                              dropdownitems.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontSize: profiletextsize2,
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
                                color: hexToColor(goldencolor),
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: hexToColor(goldencolor),
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              Divider(thickness: 1, color: hexToColor(goldencolor)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: hexToColor(
                      goldencolor,
                    ), // Button background color
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ), // Button padding
                  ),
                  onPressed: () {
                    saveprofiledata();
                  },
                  child: Text(
                    savebuttontext,
                    style: TextStyle(
                      fontSize: profiletextsize2,
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
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? lighttheme
                              : darktheme,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ), // Button padding
                    ),
                    onPressed: () {
                      profiledetaildelete();
                    },
                    child: Text(
                      deletebuttontext,
                      style: TextStyle(
                        fontSize: profiletextsize2,
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
              ),
            ],
          ),
        );
      },
    );
  }

  //===============================Bottomsheet 3=====================
  void profile_bottomsheet3(
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
                      fontSize: profiletextsize4,
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
                    onPressed: () {
                      closeaction(context);
                    },
                    icon: Icon(
                      closeicon,
                      color:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? black
                              : lighttheme,
                    ),
                  ),
                ],
              ),
              Divider(thickness: 1, color: hexToColor(goldencolor)),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (item1.subheading.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: RichText(
                          text: TextSpan(
                            text: item1.subheading,
                            style: TextStyle(
                              fontSize: profiletextsize1,
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
                      ),

                    RichText(
                      text: TextSpan(
                        text: item1.textbox1,
                        style: TextStyle(
                          fontSize: profiletextsize1,
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

                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Wrap(
                        children:
                            options.map((option) {
                              return Row(
                                spacing: 10,

                                children: [
                                  Checkbox(
                                    activeColor: hexToColor(goldencolor),
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
                                          fontSize: profiletextsize1,
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
                    ),

                    if (item1.textbox2.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: RichText(
                          text: TextSpan(
                            text: item1.textbox2,
                            style: TextStyle(
                              fontSize: profiletextsize1,
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
                      ),
                    Wrap(
                      children:
                          options1.map((option) {
                            return Row(
                              spacing: 10,

                              children: [
                                Checkbox(
                                  activeColor: hexToColor(goldencolor),
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
                                        fontSize: profiletextsize1,
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
                    Divider(thickness: 1, color: hexToColor(goldencolor)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: hexToColor(
                            goldencolor,
                          ), // Button background color
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ), // Button padding
                        ),
                        onPressed: () {
                          saveprofiledata();
                        },
                        child: Text(
                          savebuttontext,
                          style: TextStyle(
                            fontSize: profiletextsize2,
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
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: SizedBox(
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
                          onPressed: () {
                            profiledetaildelete();
                          },
                          child: Text(
                            deletebuttontext,
                            style: TextStyle(
                              fontSize: profiletextsize2,
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  //=============================Minimum pay bottomsheet==================
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
                      fontSize: profiletextsize4,
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
                    onPressed: () {
                      closeaction(context);
                    },
                    icon: Icon(
                      closeicon,
                      color:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? black
                              : lighttheme,
                    ),
                  ),
                ],
              ),
              Divider(thickness: 1, color: hexToColor(goldencolor)),

              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: item1.subheading,
                        style: TextStyle(
                          fontSize: profiletextsize1,
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
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: hexToColor(goldencolor).withOpacity(0.2),
                        ),
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Row(
                          spacing: 10,
                          children: [
                            Icon(
                              visibilityofficon,
                              color: hexToColor(goldencolor),
                              size: 13,
                            ),

                            Text(
                              "Not shown to employers",
                              style: TextStyle(
                                fontSize: profiletextsize2,
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
                    ),

                    RichText(
                      text: TextSpan(
                        text: item1.textbox1,
                        style: TextStyle(
                          fontSize: profiletextsize1,
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
                        cursorColor: hexToColor(goldencolor),
                        style: TextStyle(
                          fontSize: profiletextsize2,
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
                              color: hexToColor(goldencolor),
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: hexToColor(goldencolor),
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
                          fontSize: profiletextsize1,
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
                        iconEnabledColor: hexToColor(goldencolor),

                        items:
                            dropdownitems.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    fontSize: profiletextsize2,
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
                              color: hexToColor(goldencolor),
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: hexToColor(goldencolor),
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Divider(thickness: 1, color: hexToColor(goldencolor)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: hexToColor(
                      goldencolor,
                    ), // Button background color
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ), // Button padding
                  ),
                  onPressed: () {
                    saveprofiledata();
                  },
                  child: Text(
                    savebuttontext,
                    style: TextStyle(
                      fontSize: profiletextsize2,
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
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? lighttheme
                              : darktheme,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ), // Button padding
                    ),
                    onPressed: () {
                      profiledetaildelete();
                    },
                    child: Text(
                      deletebuttontext,
                      style: TextStyle(
                        fontSize: profiletextsize2,
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
              ),
            ],
          ),
        );
      },
    );
  }
}
