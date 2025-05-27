import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_application/Helpers/Bottomsheet.dart';
import 'package:flutter_application/Helpers/Hexconversion.dart';
import 'package:flutter_application/Helpers/Sessions.dart';
import 'package:flutter_application/Helpers/Typography.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  List<Profile_page_items> Qualifications = [
        Profile_page_items(
          "Most recent work experience",
          "Fresher",
          Icons.person_2_outlined,
        ),
        Profile_page_items(
          "Education",
          "Bachelor's degree",
          Icons.book_outlined,
        ),
        Profile_page_items(
          "Skills",
          "Flutter, dart, Babylon js, Mysql,ios development,json",
          Icons.workspace_premium_outlined,
        ),
        Profile_page_items(
          "Languages",
          "English - Fluent, Tamil - Native",
          Icons.language,
        ),
      ],
      jobpreference = [
        Profile_page_items(
          "Job titles",
          "Flutter Developer",
          Icons.person_2_outlined,
        ),
        Profile_page_items("Job types", "Full-time", Icons.work_outline),
        Profile_page_items(
          "Work schedule",
          "Days - Monday to Friday, Day shift",
          Icons.timelapse,
        ),
        Profile_page_items(
          "Minimum baase pay",
          "₹ 25,000  a month",
          Icons.currency_rupee,
        ),
        Profile_page_items(
          "Work location",
          "Remote, Hybrid work",
          Icons.home_outlined,
        ),
      ];
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "RUBANCY",
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
            ],
          ),

          Row(
            spacing: 10,
            children: [
              SizedBox(),
              Icon(Icons.mail_outline, size: 15, color: hexToColor("#D4AF37")),
              Text(
                "rubancy@gmail.com",
                style: TextStyle(
                  fontSize: 13,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? black
                          : lighttheme,
                  fontFamily: headingfont,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            spacing: 10,
            children: [
              SizedBox(),
              Icon(
                Icons.phone_outlined,
                size: 15,
                color: hexToColor("#D4AF37"),
              ),
              Text(
                "9876543210",
                style: TextStyle(
                  fontSize: 13,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? black
                          : lighttheme,
                  fontFamily: headingfont,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            spacing: 10,
            children: [
              SizedBox(),
              Icon(
                Icons.location_on_outlined,
                size: 15,
                color: hexToColor("#D4AF37"),
              ),
              Text(
                "Nagercoil, Tamil Nadu, IN",
                style: TextStyle(
                  fontSize: 13,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? black
                          : lighttheme,
                  fontFamily: headingfont,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              showBottomSheet3(context);
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: hexToColor("#D4AF37").withOpacity(0.2),
                ),
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 20,
                      children: [
                        Icon(
                          Icons.visibility_outlined,
                          color: hexToColor("#D4AF37"),
                          size: 13,
                        ),
                        Text(
                          "Employers can find your profile",
                          style: TextStyle(
                            fontSize: 12,
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
                      Icons.arrow_drop_down,
                      color: hexToColor("#D4AF37"),
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),

          Row(
            spacing: 10,
            children: [
              SizedBox(),
              Text(
                "Resume",
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
            ],
          ),

          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: hexToColor("#D4AF37").withOpacity(0.2),
              ),
              padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 20,
                    children: [
                      Icon(
                        Icons.task_outlined,
                        color: hexToColor("#D4AF37"),
                        size: 13,
                      ),
                      Column(
                        children: [
                          Text(
                            "Resume.pdf",
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
                          Text(
                            "Added on 9 Apr 2025",
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

                  PopupMenuButton<String>(
                    onSelected: (String value) {
                      print("Selected: $value");
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem<String>(
                          value: "Replace",
                          child: Row(
                            spacing: 10,
                            children: [
                              Icon(
                                Icons.sync,
                                size: 18,
                                color: hexToColor("#D4AF37"),
                              ),
                              Text(
                                "Replace file",
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
                        ),
                        PopupMenuItem<String>(
                          value: "Delete",
                          child: Row(
                            spacing: 10,
                            children: [
                              Icon(
                                Icons.delete,
                                size: 18,
                                color: hexToColor("#D4AF37"),
                              ),
                              Text(
                                "Delete",
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
                        ),
                      ];
                    },
                    child: Icon(
                      Icons.more_horiz,
                      color: hexToColor("#D4AF37"),
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Row(
            spacing: 10,
            children: [
              SizedBox(),
              Text(
                "Improve your job matches",
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
            ],
          ),
          SizedBox(height: 10),
          // Padding(
          //   padding: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
          //   child: Divider(thickness: 1, color: hexToColor("#D4AF37")),
          // ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: hexToColor("#D4AF37").withOpacity(0.2),
              ),
              padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Qualifications",
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
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: hexToColor("#D4AF37"),
                          size: 13,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Highlight your skills and experience",
                    style: TextStyle(
                      fontSize: 11,
                      color:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? black.withOpacity(0.7)
                              : lighttheme.withOpacity(0.7),
                      fontFamily: headingfont,
                    ),
                  ),

                  for (var i = 0; i < Qualifications.length; i++)
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
                                    Qualifications[i].icon,
                                    color: hexToColor("#D4AF37"),
                                    size: 13,
                                  ),

                                  Text(
                                    Qualifications[i].heading,
                                    style: TextStyle(
                                      fontSize: 13,
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
                                  if (i == 0) {
                                    qualification_bottomSheet(
                                      context,

                                      qualification_items(
                                        "Most recent work experience",
                                        "Job title",
                                        "Company",
                                      ),
                                      [],
                                      [],
                                      [1, 0],
                                    );
                                  } else if (i == 1) {
                                    qualification_bottomSheet(
                                      context,

                                      qualification_items(
                                        "Education",
                                        "Level of education",
                                        "Field of study",
                                      ),
                                      [
                                        "Bachelor of Engineering - Computer Science and Engineering",
                                        "Master of Engineering",
                                      ],
                                      [],
                                      [1, 0],
                                    );
                                  } else if (i == 2) {
                                    qualification_bottomSheet(
                                      context,

                                      qualification_items(
                                        "Add skill",
                                        "Skill",
                                        "Years of experience",
                                      ),
                                      ["Dart - 3years", "Flutter - 3years"],
                                      [],
                                      [1, 0],
                                    );
                                  } else if (i == 3) {
                                    qualification_bottomSheet(
                                      context,

                                      qualification_items(
                                        "Language",
                                        "Language",
                                        "Proficiency",
                                      ),
                                      ["English - Fluent", "Tamil - Native"],
                                      [
                                        "Beginner",
                                        "Intermediate",
                                        "Expert",
                                        "Fluent",
                                        "Native",
                                      ],
                                      [1, 1],
                                    );
                                  }
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: hexToColor("#D4AF37"),
                                  size: 13,
                                ),
                              ),
                            ],
                          ),

                          Text(
                            Qualifications[i].content,
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
                    ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
            child: Divider(thickness: 1, color: hexToColor("#D4AF37")),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: hexToColor("#D4AF37").withOpacity(0.2),
              ),
              padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Job Preferences",
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
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: hexToColor("#D4AF37"),
                          size: 13,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Save specific details like minimum desired pay and schedule.",
                    style: TextStyle(
                      fontSize: 11,
                      color:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? black.withOpacity(0.7)
                              : lighttheme.withOpacity(0.7),
                      fontFamily: headingfont,
                    ),
                  ),
                  for (var i = 0; i < jobpreference.length; i++)
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
                                    jobpreference[i].icon,
                                    color: hexToColor("#D4AF37"),
                                    size: 13,
                                  ),

                                  Text(
                                    jobpreference[i].heading,
                                    style: TextStyle(
                                      fontSize: 13,
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
                                  if (i == 0) {
                                    qualification_bottomSheet(
                                      context,
                                      qualification_items(
                                        "Job titles",
                                        "What are your desired job titles?",
                                        "",
                                      ),
                                      ["Flutter Developer"],
                                      [],
                                      [0, 0],
                                    );
                                  } else if (i == 1) {
                                    jobpreference_bottomsheet(
                                      context,
                                      jobpreference_items(
                                        "Job types",
                                        "",
                                        "what are your desired job types?",
                                        "",
                                      ),
                                      [
                                        "Full-time",
                                        "Permanent",
                                        "Fresher",
                                        "Part-time",
                                        "Internship",
                                        "Contractual/Temporary",
                                        "Freelance",
                                        "Volunteer",
                                      ],
                                      [],
                                    );
                                  } else if (i == 2) {
                                    jobpreference_bottomsheet(
                                      context,
                                      jobpreference_items(
                                        "Work Schedule",

                                        "what are your desired schedules?",
                                        "Days",
                                        "Shifts",
                                      ),
                                      [
                                        "Monday to Friday",
                                        "Weekend availability",
                                        "Weekend only",
                                      ],
                                      [
                                        "Day shift",
                                        "Morning shift",
                                        "Rotational shift",
                                        "Night shift",
                                        "Evening shift",
                                        "Fixed shift",
                                        "US shift",
                                        "UK shift",
                                      ],
                                    );
                                  } else if (i == 3) {
                                    minimumpay_bottomSheet(
                                      context,
                                      jobpreference_items(
                                        "Pay",
                                        "what is the minimum pay you'll consider in your search?",
                                        "Minimum base pay ( ₹ )",
                                        "Pay period",
                                      ),
                                      [
                                        "per hour",
                                        "per week",
                                        "per day",
                                        "per month",
                                        "per year",
                                      ],
                                    );
                                  } else if (i == 4) {
                                    jobpreference_bottomsheet(
                                      context,
                                      jobpreference_items(
                                        "Remote settings",
                                        "",
                                        "Desired work setting",
                                        "",
                                      ),
                                      [
                                        "Remote",
                                        "Hybrid work",
                                        "In-person",
                                        "Temporarily remote",
                                      ],
                                      [],
                                    );
                                  }
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: hexToColor("#D4AF37"),
                                  size: 13,
                                ),
                              ),
                            ],
                          ),

                          Text(
                            jobpreference[i].content,
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
                    ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
            child: Divider(thickness: 1, color: hexToColor("#D4AF37")),
          ),

          Padding(
            padding: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: hexToColor("#D4AF37").withOpacity(0.2),
              ),
              padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ready to work",
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
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: hexToColor("#D4AF37"),
                          size: 13,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Let employers know that you\'re available to start working as soon as possible",
                    style: TextStyle(
                      fontSize: 11,
                      color:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? black.withOpacity(0.7)
                              : lighttheme.withOpacity(0.7),
                      fontFamily: headingfont,
                    ),
                  ),
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
                                  return Colors
                                      .transparent; // No border when active
                                }
                                return hexToColor(
                                  "#D4AF37",
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
                            "#D4AF37",
                          ), // Amber background when ON
                          inactiveTrackColor: hexToColor(
                            "#D4AF37",
                          ).withOpacity(0.3),
                          value: isToggled,
                          onChanged: (bool newValue) {
                            setState(() {
                              isToggled = newValue;
                            });
                          },
                        ),
                      ),
                      Text(
                        "I'm available to start immediately",
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
          ),

          Padding(
            padding: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
            child: Divider(thickness: 1, color: hexToColor("#D4AF37")),
          ),

          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: hexToColor("#D4AF37").withOpacity(0.2),
                ),
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sign out",
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
                    Text(
                      "Rubancy@gmail.com",
                      style: TextStyle(
                        fontSize: 11,
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
          ),

          Padding(
            padding: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
            child: Divider(thickness: 1, color: hexToColor("#D4AF37")),
          ),
        ],
      ),
    );
  }
}
