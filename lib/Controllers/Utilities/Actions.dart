import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_application/Controllers/Cubits/BottombarCubit.dart';
import 'package:flutter_application/Controllers/Cubits/LoginCubit.dart';
import 'package:flutter_application/Controllers/Cubits/MyjobCubit.dart';
import 'package:flutter_application/Controllers/Cubits/PageCubit.dart';
import 'package:flutter_application/Controllers/Cubits/ProfileSettingCubit.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/Models/Appconstants.dart';
import 'package:flutter_application/Models/AppUImodels.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_application/View/Helpers/Iconcontents.dart';
import 'package:flutter_application/View/Helpers/UIconstants.dart';
import 'package:flutter_application/View/Typography/ProfileBottomsheet.dart';
import 'package:flutter_application/View/Typography/JobdetailBottomsheet.dart';
import 'package:flutter_application/View/Typography/MyJobBottomsheet.dart';
import 'package:flutter_application/View/Typography/Snackbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

//=========================Theme check==============================
themecheck(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  if (prefs.getString("theme") == "dark") {
    AdaptiveTheme.of(context).setDark();
  }
}

//===========================Theme change==========================
themechange(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  if (prefs.getString("theme") == null) {
    AdaptiveTheme.of(context).setDark();
    prefs.setString("theme", "dark");
  } else if (prefs.getString("theme") == "dark") {
    AdaptiveTheme.of(context).setLight();
    prefs.setString("theme", "light");
  } else if (prefs.getString("theme") == "light") {
    AdaptiveTheme.of(context).setDark();
    prefs.setString("theme", "dark");
  }
}

//============================bottombar action=========================
bottombaraction(int index1, BuildContext context) {
  context.read<BottombarCubit>().indexchange(index1);
  if (index1 == 0) {
    context.read<PageCubit>().nextPage(homeScreen);
  } else if (index1 == 1) {
    context.read<PageCubit>().nextPage(myjobsScreen);
  } else if (index1 == 2) {
    context.read<PageCubit>().nextPage(profileScreen);
  }
}

//==========================backbutton action===========================
backbuttonaction(BuildContext context, String page, bool didPop) async {
  if (page == myjobsScreen) {
    context.read<BottombarCubit>().indexchange(0);
    context.read<PageCubit>().nextPage(homeScreen);
    return;
  } else if (page == profileScreen) {
    context.read<BottombarCubit>().indexchange(0);
    context.read<PageCubit>().nextPage(homeScreen);
    return;
  } else {
    if (didPop) {
      return;
    }

    await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              exitheading,
              style: TextStyle(
                fontSize: textsize1,
                color: hexToColor(goldencolor),
                fontFamily: headingfont,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              exitcontent,
              style: TextStyle(
                fontSize: appbartextsize,
                color:
                    AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                        ? black
                        : lighttheme,
                fontFamily: headingfont,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: Text(
                  nobuttontext,
                  style: TextStyle(
                    fontSize: appbartextsize,
                    color: hexToColor(goldencolor),
                    fontFamily: headingfont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  exit(0);
                },
                child: Text(
                  yesbuttontext,
                  style: TextStyle(
                    fontSize: appbartextsize,
                    color: hexToColor(goldencolor),
                    fontFamily: headingfont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
    );
  }
}

//==========================Select who logined=======================
selectwhoaction(BuildContext context, int index) {
  context.read<LoginCubit>().personupdate(index);
}

//============================skip action===========================
skipaction(BuildContext context) {
  context.read<PageCubit>().nextPage(homeScreen);
}

//============================create account action=================
createaccountaction() {}

//=============================Sign in action=======================
signinaction(BuildContext context) {}

//===========================Block action=========================
blockaction(BuildContext context) {}

//===========================Save job action=====================
savejobaction(BuildContext context) {
  undosnackbar(context, unsavedjobmsg);
  //simplesnackbar(context, savedjobmsg);
}

//========================search action=========================
searchaction() {}

//=====================jobview action===========================
jobviewaction(BuildContext context) {
  jobdetailBottomSheet().mainwidget(context);
}

//==========================Close action=======================
closeaction(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop('dialog');
}

//=========================Share action====================
shareaction() {}

//====================report job action==========================
reportjobaction() {}

//========================myjob screen pagechange action===========
myjobheaderchange(int index, BuildContext context) {
  context.read<MyjobCubit>().indexchange(index);
}

//============================find job action==============
findjobaction(BuildContext context) {
  context.read<PageCubit>().nextPage(homeScreen);
}

//===========================Update status action===============
updatestatusaction(String id, BuildContext context) {
  if (id == saved) {
    jobviewaction(context);
  } else if (id == applied) {
    myjobBottomsheet().mainwidget(context, update_status, applied);
  }
}

//==============================more option in myjobs page==============
moreaction(BuildContext context, String id) {
  myjobBottomsheet().mainwidget(context, [
    if (id == applied) Update_Status_items(archivetext, green, archiveicon),
    if (id == archived)
      Update_Status_items(unarchivetext, green, unarchiveicon),
    if (id == applied) Update_Status_items(withdrawtext, red, withdrawicon),
    Update_Status_items(reportjobbuttontext, red, flagicon),
  ], moreoption);
}

//========================Bottomsheet button action==============
bottomsheetbuttonaction(String id) {
  if (id == archivetext) {
    archiveaction();
  } else if (id == unarchivetext) {
    unarchiveaction();
  } else if (id == withdrawtext) {
    withdrawaction();
  } else if (id == reportjobbuttontext) {
    reportjobaction();
  }
}

//===========================Archive action==================
archiveaction() {}

//=======================Unarchive action===================
unarchiveaction() {}
//============================Withdraw action==================
withdrawaction() {}

//=============================Resume action==================
resumeaction(String value) {}

//============================Profile Setting Change============
profilesettingchange(BuildContext context, int i) {
  context.read<ProfilesettingCubit>().indexchange(i);
}

//==============================Sign Out action===================
signoutaction() {}

//===================Profile edit action=====================
profileeditaction(BuildContext context, String heading, int i) {
  if (heading == jobpreferencetext) {
    if (i == 0) {
      Profilebottomsheet().profile_bottomSheet2(
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
      Profilebottomsheet().profile_bottomsheet3(
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
      Profilebottomsheet().profile_bottomsheet3(
        context,
        jobpreference_items(
          "Work Schedule",

          "what are your desired schedules?",
          "Days",
          "Shifts",
        ),
        ["Monday to Friday", "Weekend availability", "Weekend only"],
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
      Profilebottomsheet().minimumpay_bottomSheet(
        context,
        jobpreference_items(
          "Pay",
          "what is the minimum pay you'll consider in your search?",
          "Minimum base pay ( ₹ )",
          "Pay period",
        ),
        ["per hour", "per week", "per day", "per month", "per year"],
      );
    } else if (i == 4) {
      Profilebottomsheet().profile_bottomsheet3(
        context,
        jobpreference_items("Remote settings", "", "Desired work setting", ""),
        ["Remote", "Hybrid work", "In-person", "Temporarily remote"],
        [],
      );
    }
  } else if (heading == qualificationtext) {
    if (i == 0) {
      Profilebottomsheet().profile_bottomSheet2(
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
      Profilebottomsheet().profile_bottomSheet2(
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
      Profilebottomsheet().profile_bottomSheet2(
        context,

        qualification_items("Add skill", "Skill", "Years of experience"),
        ["Dart - 3years", "Flutter - 3years"],
        [],
        [1, 0],
      );
    } else if (i == 3) {
      Profilebottomsheet().profile_bottomSheet2(
        context,

        qualification_items("Language", "Language", "Proficiency"),
        ["English - Fluent", "Tamil - Native"],
        ["Beginner", "Intermediate", "Expert", "Fluent", "Native"],
        [1, 1],
      );
    }
  }
}

//=========================Show Content Action==============
showcontentaction(BuildContext context, String heading, bool showcontent) {
  if (heading == jobpreferencetext) {
    context.read<ProfilesettingCubit>().showjobpreference(!showcontent);
  } else if (heading == qualificationtext) {
    context.read<ProfilesettingCubit>().showqualification(!showcontent);
  } else if (heading == readytoworktext) {
    context.read<ProfilesettingCubit>().showavailable(!showcontent);
  }
}

//======================Available check action==================
availablecheckaction(BuildContext context, bool newValue) {
  context.read<ProfilesettingCubit>().availablecheck(newValue);
}

//========================Profile Detail Delete============
profiledetaildelete() {}

//==========================Save Profile data===========
saveprofiledata() {}
