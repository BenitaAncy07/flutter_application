// ignore_for_file: non_constant_identifier_names

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Controllers/Cubits/ProfileCubit.dart';
import 'package:flutter_application/Controllers/Utilities/Actions.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/Models/CubitModels/PageState.dart';
import 'package:flutter_application/Controllers/Constants/Appconstants.dart';
import 'package:flutter_application/Models/AppUImodels.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_application/View/Helpers/Iconcontents.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Profilebottomsheet {
  void settingBottomSheet1(
    BuildContext context,
    String jobseekerid,
    int openprofilevalue,
  ) {
    showModalBottomSheet(
      isDismissible: false,
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
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          closeaction(context);

                          context.read<ProfilesettingCubit>().indexchange(
                            openprofilevalue,
                          );
                        },
                        icon: Icon(
                          size: iconsize2,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        profilesetting.toUpperCase(),
                        style: TextStyle(
                          fontSize: textsize5,
                          color: hexToColor(goldencolor),
                          fontFamily: headingfont,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Divider(thickness: 1, color: hexToColor(goldencolor)),
                  for (int i = 0; i < profilesettinglist.length; i++)
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
                      child: Container(
                        alignment: Alignment.center,

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
                                size: iconsize3,
                                color: hexToColor(goldencolor),
                              ),

                              title: Text(
                                profilesettinglist[i].heading,
                                style: TextStyle(
                                  fontSize: textsize5,
                                  color: hexToColor(goldencolor),

                                  fontFamily: headingfont,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Radio<int>(
                                value: i,
                                fillColor: MaterialStateProperty.resolveWith((
                                  states,
                                ) {
                                  if (states.contains(MaterialState.selected)) {
                                    return hexToColor(goldencolor);
                                  }
                                  return hexToColor(goldencolor);
                                }),
                                groupValue: statecontent.selectedindex,
                                onChanged: (int? value) {
                                  profilesettingchange(
                                    context,
                                    value!,
                                    jobseekerid,
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 20,
                                left: 20,
                                bottom: 15,
                              ),
                              child: Wrap(
                                children: [
                                  Text(
                                    profilesettinglist[i].content,
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
                          ],
                        ),
                      ),
                    ),

                  Divider(thickness: 1, color: hexToColor(goldencolor)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: hexToColor(goldencolor),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      onPressed: () {
                        saveprofiledata(
                          context,
                          profilesetting,
                          jobseekerid,
                          statecontent.selectedindex,
                        );
                      },
                      child: Text(
                        savebuttontext,
                        style: TextStyle(
                          fontSize: buttontextsize1,
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
      },
    );
  }

  //==========================================Bottomsheet 2====================================
  void profile_bottomSheet2(
    BuildContext context,
    qualification_items item1,
    List contents,
    List starrequired,
    String heading,
    String jobseekerid,
  ) {
    final _formKey1 = GlobalKey<FormState>();
    final _formKey = GlobalKey<FormState>();
    FocusNode box1Focus = FocusNode();
    FocusNode box2Focus = FocusNode();
    TextEditingController textbox1controller = TextEditingController();
    TextEditingController textbox2controller = TextEditingController();
    showModalBottomSheet(
      isDismissible: false,
      backgroundColor:
          AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
              ? lighttheme
              : darktheme,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      closeaction(context);
                    },
                    icon: Icon(
                      size: iconsize2,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item1.heading.toUpperCase(),
                    style: TextStyle(
                      fontSize: textsize5,
                      color: hexToColor(goldencolor),
                      fontFamily: headingfont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Divider(thickness: 1, color: hexToColor(goldencolor)),

              Wrap(
                spacing: 8.0, // Space between items horizontally
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
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              item.split("~")[0],
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

                            IconButton(
                              onPressed: () {
                                profiledetaildelete(
                                  context,
                                  heading,
                                  item.split("~")[1],
                                  jobseekerid,
                                );
                              },
                              icon: Icon(
                                deleteicon,
                                color:
                                    AdaptiveTheme.of(context).mode ==
                                            AdaptiveThemeMode.light
                                        ? black
                                        : lighttheme,
                                size: iconsize5,
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
                          fontSize: textsize5,
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
                                fontSize: textsize3,
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
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: textbox1controller,
                          focusNode: box1Focus,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(box2Focus);
                          },
                          textInputAction: TextInputAction.next,
                          cursorColor: hexToColor(goldencolor),
                          style: TextStyle(
                            fontSize: textsize3,
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
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: red, width: 1.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: red, width: 1.2),
                            ),
                          ),
                          validator: (value) {
                            if (starrequired[0] == 1 &&
                                (value == null || value.isEmpty)) {
                              return requiredfieldtext;
                            }

                            return null;
                          },
                        ),
                      ),
                    ),

                    RichText(
                      text: TextSpan(
                        text: item1.textbox2,
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
                        children: [
                          if (starrequired[1] == 1)
                            TextSpan(
                              text: ' *',
                              style: TextStyle(
                                fontSize: textsize3,
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
                      child: Form(
                        key: _formKey1,
                        child: TextFormField(
                          controller: textbox2controller,
                          focusNode: box2Focus,
                          onFieldSubmitted: (_) {
                            if (_formKey.currentState!.validate() &&
                                _formKey1.currentState!.validate()) {
                              saveprofiledata(context, heading, jobseekerid, [
                                textbox1controller.text,
                                textbox2controller.text,
                              ]);
                            }
                          },
                          textInputAction: TextInputAction.done,
                          cursorColor: hexToColor(goldencolor),
                          style: TextStyle(
                            fontSize: textsize3,
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

                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: red, width: 1.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: red, width: 1.2),
                            ),
                          ),
                          validator: (value) {
                            if (starrequired[1] == 1 &&
                                (value == null || value.isEmpty)) {
                              return requiredfieldtext;
                            }

                            return null;
                          },
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
                    backgroundColor: hexToColor(goldencolor),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        _formKey1.currentState!.validate()) {
                      saveprofiledata(context, heading, jobseekerid, [
                        textbox1controller.text,
                        textbox2controller.text,
                      ]);
                    }
                  },
                  child: Text(
                    savebuttontext,
                    style: TextStyle(
                      fontSize: buttontextsize1,
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
                      fontSize: textsize6,
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
                              fontSize: textsize5,
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
                          fontSize: textsize5,
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
                                          fontSize: textsize5,
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
                              fontSize: textsize5,
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
                                        fontSize: textsize5,
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
                          // saveprofiledata();
                        },
                        child: Text(
                          savebuttontext,
                          style: TextStyle(
                            fontSize: textsize3,
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
                            //profiledetaildelete();
                          },
                          child: Text(
                            deletebuttontext,
                            style: TextStyle(
                              fontSize: textsize3,
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
                      fontSize: textsize6,
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
                          fontSize: textsize5,
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
                                fontSize: textsize3,
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
                          fontSize: textsize5,
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
                          fontSize: textsize3,
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
                          fontSize: textsize5,
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
                                    fontSize: textsize3,
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
                    //saveprofiledata();
                  },
                  child: Text(
                    savebuttontext,
                    style: TextStyle(
                      fontSize: textsize3,
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
                      //  profiledetaildelete();
                    },
                    child: Text(
                      deletebuttontext,
                      style: TextStyle(
                        fontSize: textsize3,
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

  //==========================================Bottomsheet 4====================================
  void profile_bottomSheet4(
    BuildContext context,
    qualification_items item1,
    List contents,
    List starrequired,
    String heading,
    String jobseekerid,
    List<String> dropdownitems,
  ) {
    final _formKey = GlobalKey<FormState>();
    FocusNode box1Focus = FocusNode();
    TextEditingController textbox1controller = TextEditingController();
    TextEditingController textbox2controller = TextEditingController(
      text: dropdownitems[0],
    );
    showModalBottomSheet(
      isDismissible: false,
      backgroundColor:
          AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
              ? lighttheme
              : darktheme,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      closeaction(context);
                    },
                    icon: Icon(
                      size: iconsize2,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item1.heading.toUpperCase(),
                    style: TextStyle(
                      fontSize: textsize5,
                      color: hexToColor(goldencolor),
                      fontFamily: headingfont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Divider(thickness: 1, color: hexToColor(goldencolor)),
              Wrap(
                spacing: 8.0, // Space between items horizontally
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
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              item.split("~")[0],
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

                            IconButton(
                              onPressed: () {
                                profiledetaildelete(
                                  context,
                                  heading,
                                  item.split("~")[1],
                                  jobseekerid,
                                );
                              },
                              icon: Icon(
                                deleteicon,
                                color:
                                    AdaptiveTheme.of(context).mode ==
                                            AdaptiveThemeMode.light
                                        ? black
                                        : lighttheme,
                                size: iconsize5,
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
                          fontSize: textsize5,
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
                                fontSize: textsize3,
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
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: textbox1controller,
                          focusNode: box1Focus,
                          textInputAction: TextInputAction.next,
                          cursorColor: hexToColor(goldencolor),
                          style: TextStyle(
                            fontSize: textsize3,
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
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: red, width: 1.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: red, width: 1.2),
                            ),
                          ),
                          validator: (value) {
                            if (starrequired[0] == 1 &&
                                (value == null || value.isEmpty)) {
                              return requiredfieldtext;
                            }

                            return null;
                          },
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: item1.textbox2,
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
                        children: [
                          if (starrequired[1] == 1)
                            TextSpan(
                              text: ' *',
                              style: TextStyle(
                                fontSize: textsize3,
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
                      child: DropdownButtonFormField<String>(
                        value:
                            textbox2controller.text, // Default selected value
                        iconEnabledColor: hexToColor(goldencolor),

                        items:
                            dropdownitems.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    fontSize: textsize3,
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
                            textbox2controller.text = newValue;
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
                    backgroundColor: hexToColor(goldencolor),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      saveprofiledata(context, heading, jobseekerid, [
                        textbox1controller.text,
                        textbox2controller.text,
                      ]);
                    }
                  },
                  child: Text(
                    savebuttontext,
                    style: TextStyle(
                      fontSize: buttontextsize1,
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

  void profile_bottomSheet5(
    BuildContext context,
    qualification_items item1,
    List contents,
    List starrequired,
    String heading,
    String jobseekerid,
  ) {
    final _formKey = GlobalKey<FormState>();
    FocusNode box1Focus = FocusNode();

    TextEditingController textbox1controller = TextEditingController();

    showModalBottomSheet(
      isDismissible: false,
      backgroundColor:
          AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
              ? lighttheme
              : darktheme,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      closeaction(context);
                    },
                    icon: Icon(
                      size: iconsize2,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item1.heading.toUpperCase(),
                    style: TextStyle(
                      fontSize: textsize5,
                      color: hexToColor(goldencolor),
                      fontFamily: headingfont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Divider(thickness: 1, color: hexToColor(goldencolor)),

              Wrap(
                spacing: 8.0, // Space between items horizontally
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
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              item.split("~")[0],
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

                            IconButton(
                              onPressed: () {
                                profiledetaildelete(
                                  context,
                                  heading,
                                  item.split("~")[1],
                                  jobseekerid,
                                );
                              },
                              icon: Icon(
                                deleteicon,
                                color:
                                    AdaptiveTheme.of(context).mode ==
                                            AdaptiveThemeMode.light
                                        ? black
                                        : lighttheme,
                                size: iconsize5,
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
                          fontSize: textsize5,
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
                                fontSize: textsize3,
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
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: textbox1controller,
                          focusNode: box1Focus,
                          onFieldSubmitted: (_) {
                            if (_formKey.currentState!.validate()) {
                              saveprofiledata(
                                context,
                                heading,
                                jobseekerid,
                                textbox1controller.text,
                              );
                            }
                          },
                          textInputAction: TextInputAction.next,
                          cursorColor: hexToColor(goldencolor),
                          style: TextStyle(
                            fontSize: textsize3,
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
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: red, width: 1.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: red, width: 1.2),
                            ),
                          ),
                          validator: (value) {
                            if (starrequired[0] == 1 &&
                                (value == null || value.isEmpty)) {
                              return requiredfieldtext;
                            }

                            return null;
                          },
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
                    backgroundColor: hexToColor(goldencolor),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      saveprofiledata(
                        context,
                        heading,
                        jobseekerid,
                        textbox1controller.text,
                      );
                    }
                  },
                  child: Text(
                    savebuttontext,
                    style: TextStyle(
                      fontSize: buttontextsize1,
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

  void profile_bottomSheet6(
    BuildContext context,
    qualification_items item1,
    List contents,
    List starrequired,
    String heading,
    String jobseekerid,
    List<String> dropdownitems,
  ) {
    TextEditingController textbox2controller = TextEditingController(
      text: dropdownitems[0],
    );
    showModalBottomSheet(
      isDismissible: false,
      backgroundColor:
          AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
              ? lighttheme
              : darktheme,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      closeaction(context);
                    },
                    icon: Icon(
                      size: iconsize2,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item1.heading.toUpperCase(),
                    style: TextStyle(
                      fontSize: textsize5,
                      color: hexToColor(goldencolor),
                      fontFamily: headingfont,
                      fontWeight: FontWeight.bold,
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
                        text: item1.textbox1,
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
                        children: [
                          if (starrequired[0] == 1)
                            TextSpan(
                              text: ' *',
                              style: TextStyle(
                                fontSize: textsize3,
                                color: red,
                                fontFamily: headingfont,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Wrap(
                        children:
                            dropdownitems.map((option) {
                              return Row(
                                spacing: 10,

                                children: [
                                  Checkbox(
                                    activeColor: hexToColor(goldencolor),
                                    value: contents.contains(option),
                                    onChanged: (bool? value) {
                                      // if (value == true) {
                                      //   selectedOptions.add(option);
                                      // } else {
                                      //   selectedOptions.remove(option);
                                      // }
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
                                          fontSize: textsize5,
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

                    Divider(thickness: 1, color: hexToColor(goldencolor)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: hexToColor(goldencolor),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                        ),
                        onPressed: () {
                          saveprofiledata(
                            context,
                            heading,
                            jobseekerid,
                            textbox2controller.text,
                          );
                        },
                        child: Text(
                          savebuttontext,
                          style: TextStyle(
                            fontSize: buttontextsize1,
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
              ),
            ],
          ),
        );
      },
    );
  }
}
