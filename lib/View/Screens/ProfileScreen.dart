// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_application/Controllers/Cubits/ProfileSettingCubit.dart';
import 'package:flutter_application/Controllers/Utilities/Actions.dart';
import 'package:flutter_application/Models/AppCubitmodels.dart';
import 'package:flutter_application/Models/Appconstants.dart';
import 'package:flutter_application/View/Helpers/Iconcontents.dart';
import 'package:flutter_application/View/Helpers/UIconstants.dart';
import 'package:flutter_application/View/Typography/ProfileBottomsheet.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/Models/AppUImodels.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profilescreen extends StatelessWidget {
  Profilescreen({super.key});

  List<Profile_page_items>
  Qualifications = [
    Profile_page_items(workexpereiencetext, "Fresher", workexperienceicon),
    Profile_page_items(educationtext, "Bachelor's degree", educationicon),
    Profile_page_items(
      skilltext,
      "Flutter, dart, Babylon js, Mysql,ios development,json",
      skillicon,
    ),
    Profile_page_items(
      languagestext,
      "English - Fluent, Tamil - Native",
      languageicon,
    ),
  ],
  jobpreference = [
    Profile_page_items(jobtitletext, "Flutter Developer", workexperienceicon),
    Profile_page_items(jobtypetext, "Full-time", jobtypeicon),
    Profile_page_items(
      workscheduletext,
      "Days - Monday to Friday, Day shift",
      scheduleicon,
    ),
    Profile_page_items(minimumpaytext, "₹ 25,000  a month", payicon),
    Profile_page_items(worklocationtext, "Remote, Hybrid work", locationicon),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilesettingCubit, ProfileState>(
      builder: (context, statecontent) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerwidget(context),
              profilesettingwidget(context, statecontent.selectedindex),
              resumewidget(context),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  spacing: 10,
                  children: [
                    SizedBox(),
                    Text(
                      aboutyoutext,
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
                    ),
                  ],
                ),
              ),
              aboutyouwidget(
                context,
                statecontent.showqualificationcontent,
                qualificationtext,
                qualificationsubtext,
                Qualifications,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 0,
                  right: 10,
                  bottom: 0,
                ),
                child: Divider(thickness: 1, color: hexToColor(goldencolor)),
              ),
              aboutyouwidget(
                context,
                statecontent.showpreferencecontent,
                jobpreferencetext,
                jobpreferencesubtext,
                jobpreference,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 0,
                  right: 10,
                  bottom: 0,
                ),
                child: Divider(thickness: 1, color: hexToColor(goldencolor)),
              ),
              availablewidget(
                context,
                statecontent.showavailablecontent,
                readytoworktext,
                readytoworksubtext,
                readytoworktext2,
                statecontent.availabletowork,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 0,
                  right: 10,
                  bottom: 0,
                ),
                child: Divider(thickness: 1, color: hexToColor(goldencolor)),
              ),
              buttonwidget(context),
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 0,
                  right: 10,
                  bottom: 0,
                ),
                child: Divider(thickness: 1, color: hexToColor(goldencolor)),
              ),
            ],
          ),
        );
      },
    );
  }

  //============================Header widget===============================
  headerwidget(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "RUBANCY",
                style: TextStyle(
                  fontSize: profiletextsize1,
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
          padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
          child: Row(
            spacing: 10,
            children: [
              SizedBox(),
              Icon(
                mailicon,
                size: buttoniconsize3,
                color: hexToColor(goldencolor),
              ),
              Text(
                "rubancy@gmail.com",
                style: TextStyle(
                  fontSize: profiletextsize2,
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
          padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Row(
            spacing: 10,
            children: [
              SizedBox(),
              Icon(
                phoneicon,
                size: buttoniconsize3,
                color: hexToColor(goldencolor),
              ),
              Text(
                "9876543210",
                style: TextStyle(
                  fontSize: profiletextsize2,
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

        Row(
          spacing: 10,
          children: [
            SizedBox(),
            Icon(
              locationicon,
              size: buttoniconsize3,
              color: hexToColor(goldencolor),
            ),
            Text(
              "Nagercoil, Tamil Nadu, IN",
              style: TextStyle(
                fontSize: profiletextsize2,
                color:
                    AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                        ? black
                        : lighttheme,
                fontFamily: headingfont,
              ),
            ),
          ],
        ),
      ],
    );
  }

  //========================Setting widget==================
  Widget profilesettingwidget(BuildContext context, int selectedindex) {
    return InkWell(
      onTap: () {
        Profilebottomsheet().settingBottomSheet1(context);
      },
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: hexToColor(goldencolor).withOpacity(0.2),
          ),
          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 20,
                children: [
                  Icon(
                    profilesettinglist[selectedindex].icon,
                    color: hexToColor(goldencolor),
                    size: buttoniconsize2,
                  ),
                  Text(
                    profilesettinglist[selectedindex].heading,
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
              Icon(
                dropdownicon,
                color: hexToColor(goldencolor),
                size: buttoniconsize4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //=================================Resume Widget=====================
  Widget resumewidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 10,
          children: [
            SizedBox(),
            Text(
              resumetext,
              style: TextStyle(
                fontSize: profiletextsize1,
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
          padding: EdgeInsets.all(10),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: hexToColor(goldencolor).withOpacity(0.2),
            ),
            padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 20,
                  children: [
                    Icon(
                      resumeicon,
                      color: hexToColor(goldencolor),
                      size: buttoniconsize2,
                    ),
                    Column(
                      children: [
                        Text(
                          "Resume.pdf",
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
                        Text(
                          "Added on 9 Apr 2025",
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
                PopupMenuButton<String>(
                  onSelected: (String value) {
                    resumeaction(value);
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      for (int i = 0; i < resumesettinglist.length; i++)
                        PopupMenuItem<String>(
                          value: resumesettinglist[i].heading,
                          child: Row(
                            spacing: 10,
                            children: [
                              Icon(
                                resumesettinglist[i].icon,
                                size: buttoniconsize4,
                                color: hexToColor(goldencolor),
                              ),
                              Text(
                                resumesettinglist[i].content,
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
                        ),
                    ];
                  },
                  child: Icon(
                    moreiconhorizontal,
                    color: hexToColor(goldencolor),
                    size: buttoniconsize4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  //===========================about you widget===================
  Widget aboutyouwidget(
    BuildContext context,
    bool showcontent,
    String heading,
    String subheading,
    List<Profile_page_items> contentlist,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: hexToColor(goldencolor).withOpacity(0.2),
        ),
        padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            aboutyouheader(context, heading, subheading, showcontent),
            if (showcontent)
              for (var i = 0; i < contentlist.length; i++)
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    top: 0,
                    right: 10,
                    bottom: 0,
                  ),
                  child: Wrap(
                    spacing: 10,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Icon(
                                contentlist[i].icon,
                                color: hexToColor(goldencolor),
                                size: buttoniconsize2,
                              ),
                              Text(
                                contentlist[i].heading,
                                style: TextStyle(
                                  fontSize: buttoniconsize2,
                                  color:
                                      AdaptiveTheme.of(context).mode ==
                                              AdaptiveThemeMode.light
                                          ? black.withOpacity(0.7)
                                          : lighttheme.withOpacity(0.7),
                                  fontFamily: headingfont,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              profileeditaction(context, heading, i);
                            },
                            icon: Icon(
                              editicon,
                              color: hexToColor(goldencolor),
                              size: buttoniconsize2,
                            ),
                          ),
                        ],
                      ),

                      Text(
                        contentlist[i].content,
                        style: TextStyle(
                          fontSize: profiletextsize2,
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
                ),
          ],
        ),
      ),
    );
  }

  //==================================About You header==========================
  Widget aboutyouheader(
    BuildContext context,
    String heading,
    String subheading,
    bool showcontent,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              heading,
              style: TextStyle(
                fontSize: profiletextsize2,
                color:
                    AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                        ? black
                        : lighttheme,
                fontFamily: headingfont,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {
                showcontentaction(context, heading, showcontent);
              },
              icon: Icon(
                showcontent ? dropdownicon : hiddencontenticon,
                color: hexToColor(goldencolor),
                size: buttoniconsize4,
              ),
            ),
          ],
        ),
        Text(
          subheading,
          style: TextStyle(
            fontSize: profiletextsize5,
            color:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black.withOpacity(0.7)
                    : lighttheme.withOpacity(0.7),
            fontFamily: headingfont,
          ),
        ),
      ],
    );
  }

  //===============================Available widgets==========================
  Widget availablewidget(
    BuildContext context,
    bool showcontent,
    String heading,
    String subheading,
    String contenttext,
    bool available,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: hexToColor(goldencolor).withOpacity(0.2),
        ),
        padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            aboutyouheader(context, heading, subheading, showcontent),
            if (showcontent)
              Row(
                children: [
                  Transform.scale(
                    scale: 0.6,
                    child: Switch(
                      trackOutlineColor:
                          MaterialStateProperty.resolveWith<Color?>((
                            Set<MaterialState> states,
                          ) {
                            if (states.contains(MaterialState.selected)) {
                              return transparent; // No border when active
                            }
                            return hexToColor(
                              goldencolor,
                            ); // Border color when inactive
                          }),
                      activeColor:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? lighttheme
                              : darktheme,
                      inactiveThumbColor:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? lighttheme
                              : darktheme,
                      activeTrackColor: hexToColor(
                        goldencolor,
                      ), // Amber background when ON
                      inactiveTrackColor: hexToColor(
                        goldencolor,
                      ).withOpacity(0.3),
                      value: available,
                      onChanged: (bool newValue) {
                        availablecheckaction(context, newValue);
                      },
                    ),
                  ),
                  Text(
                    contenttext,
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
    );
  }

  //=================================Button widget========================
  Widget buttonwidget(BuildContext context) {
    return InkWell(
      onTap: () {
        signoutaction();
      },
      child: Padding(
        padding: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: hexToColor(goldencolor).withOpacity(0.2),
          ),
          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    signoutbuttontext,
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
              Text(
                "Rubancy@gmail.com",
                style: TextStyle(
                  fontSize: profiletextsize5,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? black.withOpacity(0.7)
                          : lighttheme.withOpacity(0.7),
                  fontFamily: headingfont,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
