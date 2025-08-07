// ignore_for_file: must_be_immutable, non_constant_identifier_names
import 'package:file_picker/file_picker.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_application/Controllers/Cubits/ProfileCubit.dart';
import 'package:flutter_application/Controllers/Utilities/Actions.dart';
import 'package:flutter_application/Controllers/Constants/Appconstants.dart';
import 'package:flutter_application/Models/ApiModels.dart';
import 'package:flutter_application/Models/CubitModels/PageState.dart';
import 'package:flutter_application/Models/CubitModels/ProfileState.dart';
import 'package:flutter_application/View/Helpers/Iconcontents.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';
import 'package:flutter_application/View/Typography/Loading.dart';
import 'package:flutter_application/View/Typography/ProfileBottomsheet.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/Models/AppUImodels.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilesettingCubit, ProfileState>(
      builder: (context, statecontent) {
        return BlocBuilder<Profiledetailcubit, Profiledetailstate>(
          builder: (context, state) {
            if (state is showdetail) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headerwidget(context, state.value),
                    profilesettingwidget(
                      context,
                      statecontent.selectedindex,
                      state.value.id,
                      state.value.openprofile,
                    ),
                    resumewidget(context, state.value),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        spacing: 10,
                        children: [
                          SizedBox(),
                          Text(
                            aboutyoutext,
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
                        ],
                      ),
                    ),
                    aboutyouwidget(
                      context,
                      statecontent.showqualificationcontent,
                      qualificationtext,
                      qualificationsubtext,
                      [
                        Profile_page_items(
                          workexpereiencetext,
                          state.value.qualification.split('#'),
                          workexperienceicon,
                        ),
                        Profile_page_items(
                          educationtext,
                          state.value.education.split('#'),
                          educationicon,
                        ),
                        Profile_page_items(
                          skilltext,
                          state.value.skills.split('#'),
                          skillicon,
                        ),
                        Profile_page_items(
                          languagestext,
                          state.value.languages.split('#'),
                          languageicon,
                        ),
                      ],
                      state.value.id,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        top: 0,
                        right: 10,
                        bottom: 0,
                      ),
                      child: Divider(
                        thickness: 1,
                        color: hexToColor(goldencolor),
                      ),
                    ),
                    aboutyouwidget(
                      context,
                      statecontent.showpreferencecontent,
                      jobpreferencetext,
                      jobpreferencesubtext,
                      [
                        Profile_page_items(
                          jobtitlestext,
                          state.value.desired_jobtitle.split('#'),
                          workexperienceicon,
                        ),
                        Profile_page_items(
                          jobtypetext,
                          state.value.jobtype.split('#'),
                          jobtypeicon,
                        ),
                        Profile_page_items(
                          workscheduletext,
                          ("${state.value.shift}#${state.value.schedule}")
                              .split('#'),
                          scheduleicon,
                        ),
                        Profile_page_items(minimumpaytext, [
                          "$currencysymbol ${state.value.minimum_basepay} ${state.value.pay_period}",
                        ], payicon),
                        Profile_page_items(
                          worklocationtext,
                          state.value.worklocation.split('#'),
                          locationicon,
                        ),
                      ],
                      state.value.id,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        top: 0,
                        right: 10,
                        bottom: 0,
                      ),
                      child: Divider(
                        thickness: 1,
                        color: hexToColor(goldencolor),
                      ),
                    ),
                    availablewidget(
                      context,
                      statecontent.showavailablecontent,
                      state.value.available_immediately,
                      state.value.id,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        top: 0,
                        right: 10,
                        bottom: 0,
                      ),
                      child: Divider(
                        thickness: 1,
                        color: hexToColor(goldencolor),
                      ),
                    ),
                    buttonwidget(context, state.value.mail),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        top: 0,
                        right: 10,
                        bottom: 0,
                      ),
                      child: Divider(
                        thickness: 1,
                        color: hexToColor(goldencolor),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is profiledetailError) {
              return errorwidget(context, state.message);
            }
            if (state is profiledetailLoading) {
              return loading();
            } else {
              return SizedBox.shrink();
            }
          },
        );
      },
    );
  }

  //============================Header widget===============================
  headerwidget(BuildContext context, profiledatamodel value) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value.name.toUpperCase(),
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
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
          child: Row(
            spacing: 10,
            children: [
              SizedBox(),
              Icon(mailicon, size: iconsize4, color: hexToColor(goldencolor)),
              Text(
                value.mail,
                style: TextStyle(
                  fontSize: textsize3,
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
              Icon(phoneicon, size: iconsize4, color: hexToColor(goldencolor)),
              Text(
                value.phoneno,
                style: TextStyle(
                  fontSize: textsize3,
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
            Icon(locationicon, size: iconsize4, color: hexToColor(goldencolor)),
            Text(
              value.location,
              style: TextStyle(
                fontSize: textsize3,
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
  Widget profilesettingwidget(
    BuildContext context,
    int selectedindex,
    String jobseekerid,
    int openprofileindex,
  ) {
    return InkWell(
      onTap: () {
        Profilebottomsheet().settingBottomSheet1(
          context,
          jobseekerid,
          openprofileindex,
        );
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
                    size: iconsize5,
                  ),
                  Text(
                    profilesettinglist[selectedindex].heading,
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
                ],
              ),
              Icon(
                dropdownicon,
                color: hexToColor(goldencolor),
                size: iconsize3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //=================================Resume Widget=====================
  Widget resumewidget(BuildContext context, profiledatamodel statevalue) {
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
                fontSize: textsize5,
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
                      size: iconsize5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          statevalue.resume,
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
                        Text(
                          datetext + statevalue.resumedate,
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
                      ],
                    ),
                  ],
                ),
                PopupMenuButton<String>(
                  onSelected: (String value) {
                    resumeaction(
                      value,
                      context,
                      statevalue.id,
                      statevalue.resume,
                    );
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
                                size: iconsize3,
                                color: hexToColor(goldencolor),
                              ),
                              Text(
                                resumesettinglist[i].content,
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
                            ],
                          ),
                        ),
                    ];
                  },
                  child: Icon(
                    moreiconhorizontal,
                    color: hexToColor(goldencolor),
                    size: iconsize3,
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
    String jobseekerid,
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
                                size: iconsize5,
                              ),
                              Text(
                                contentlist[i].heading,
                                style: TextStyle(
                                  fontSize: iconsize5,
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
                              profileeditaction(
                                context,
                                contentlist[i].heading,
                                contentlist[i].content,
                                jobseekerid,
                              );
                            },
                            icon: Icon(
                              editicon,
                              color: hexToColor(goldencolor),
                              size: iconsize5,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (
                            int j = 0;
                            j < contentlist[i].content.length;
                            j++
                          )
                            Padding(
                              padding: EdgeInsets.only(left: 40),
                              child: RichText(
                                text: TextSpan(
                                  text: bulletsymbol,
                                  style: TextStyle(
                                    fontSize: textsize3,
                                    color: hexToColor(goldencolor),
                                    fontFamily: headingfont,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          contentlist[i].content[j].split(
                                            "~",
                                          )[0],
                                      style: TextStyle(
                                        fontSize: textsize3,
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
                            ),
                        ],
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
                fontSize: textsize3,
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
                size: iconsize3,
              ),
            ),
          ],
        ),
        Text(
          subheading,
          style: TextStyle(
            fontSize: textsize1,
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
    bool available,
    String jobseekerid,
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
            aboutyouheader(
              context,
              readytoworktext,
              readytoworksubtext,
              showcontent,
            ),
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
                      activeTrackColor: hexToColor(goldencolor),
                      inactiveTrackColor: hexToColor(
                        goldencolor,
                      ).withOpacity(0.3),
                      value: available,
                      onChanged: (bool newValue) {
                        availablecheckaction(context, jobseekerid, newValue);
                      },
                    ),
                  ),
                  Text(
                    readytoworkcontenttext,
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
                ],
              ),
          ],
        ),
      ),
    );
  }

  //=================================Button widget========================
  Widget buttonwidget(BuildContext context, String mail) {
    return InkWell(
      onTap: () {
        signoutaction(context);
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
              Text(
                mail,
                style: TextStyle(
                  fontSize: textsize1,
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
