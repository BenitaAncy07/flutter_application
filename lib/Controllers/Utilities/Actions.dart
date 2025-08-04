import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_application/Controllers/Constants/ApiConstants.dart';
import 'package:flutter_application/Controllers/Cubits/BottombarCubit.dart';
import 'package:flutter_application/Controllers/Cubits/JobDetailCubit.dart';
import 'package:flutter_application/Controllers/Cubits/LoginCubit.dart';
import 'package:flutter_application/Controllers/Cubits/MyjobCubit.dart';
import 'package:flutter_application/Controllers/Cubits/PageCubit.dart';
import 'package:flutter_application/Controllers/Cubits/Pagination/HomeCubit.dart';
import 'package:flutter_application/Controllers/Cubits/ProfileCubit.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/Controllers/Constants/Appconstants.dart';
import 'package:flutter_application/Models/AppUImodels.dart';
import 'package:flutter_application/Models/CubitModels/HomeState.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_application/View/Helpers/Iconcontents.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';
import 'package:flutter_application/View/Typography/Loading.dart';
import 'package:flutter_application/View/Typography/ProfileBottomsheet.dart';
import 'package:flutter_application/View/Typography/JobdetailBottomsheet.dart';
import 'package:flutter_application/View/Typography/MyJobBottomsheet.dart';
import 'package:flutter_application/View/Typography/Snackbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

//=========================initial check==============================
initialcheck(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  if (prefs.getString(themetext) == darktext) {
    AdaptiveTheme.of(context).setDark();
  }
  if (prefs.getString(loginidtext) != null &&
      prefs.getString(loginidtext) != "") {
    context.read<PageCubit>().nextPage(homeScreen);
    context.read<LoginCubit>().personupdate(
      prefs.getString(loginpersontext)!,
      prefs.getString(loginidtext)!,
    );
    context.read<Profiledetailcubit>().loadprofiledetails(
      context,
      prefs.getString(loginidtext)!,
    );
  }
}

//===========================Theme change==========================
themechange(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  if (prefs.getString(themetext) == null) {
    AdaptiveTheme.of(context).setDark();
    prefs.setString(themetext, darktext);
  } else if (prefs.getString(themetext) == darktext) {
    AdaptiveTheme.of(context).setLight();
    prefs.setString(themetext, lighttext);
  } else if (prefs.getString(themetext) == lighttext) {
    AdaptiveTheme.of(context).setDark();
    prefs.setString(themetext, darktext);
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
  } else if (page == loginScreen) {
    context.read<PageCubit>().nextPage(introScreen);
    return;
  } else if (page == registerScreen) {
    context.read<PageCubit>().nextPage(introScreen);
    return;
  } else {
    if (didPop) {
      return;
    }

    await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? lighttheme
                    : darktheme,
            title: Text(
              exitheading,
              style: TextStyle(
                fontSize: textsize7,
                color: hexToColor(goldencolor),
                fontFamily: headingfont,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              exitcontent,
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
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: Text(
                  nobuttontext,
                  style: TextStyle(
                    fontSize: textsize5,
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
                    fontSize: textsize5,
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
  context.read<LoginCubit>().personselected(index);
}

//============================skip action===========================
skipaction(BuildContext context) {
  context.read<PageCubit>().nextPage(homeScreen);
}

//============================create account action=================
createaccountaction(BuildContext context) {
  context.read<PageCubit>().nextPage(registerScreen);
}

//=============================Sign in action=======================
signinaction(BuildContext context) {
  context.read<PageCubit>().nextPage(loginScreen);
}

//===========================Block action=========================
blockaction(BuildContext context) {}

//===========================Save job action=====================
savejobaction(BuildContext context) {
  undosnackbar(context, unsavedjobmsg);
  //simplesnackbar(context, savedjobmsg);
}

//========================search action=========================
searchaction(BuildContext context, String query) {
  context.read<JobCubit>().emptylist();
  context.read<JobCubit>().loadJobs(query);
}

//=====================jobview action===========================
jobviewaction(BuildContext context, String jobid) {
  context.read<Jobdetailcubit>().loadJobdetails(context, jobid);
  jobdetailBottomSheet().mainwidget(context);
}

//==========================Close action=======================
closeaction(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop('dialog');
}

//=========================Share action====================
shareaction(BuildContext context, String jobid) {}

//====================report job action==========================
reportjobaction(BuildContext context, String jobid) {}

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
    // jobviewaction(context);
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
    //  reportjobaction();
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
profilesettingchange(BuildContext context, int value, String jobseekerid) {
  context.read<ProfilesettingCubit>().indexchange(value);
}

//==============================Sign Out action===================
signoutaction(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(loginidtext, "");

  context.read<PageCubit>().nextPage(loginScreen);
}

//===================Profile edit action=====================
profileeditaction(
  BuildContext context,
  String check,
  contentdata,
  String jobseekerid,
) {
  if (check == workexpereiencetext) {
    Profilebottomsheet().profile_bottomSheet2(
      context,
      qualification_items(workexpereiencetext, jobtitletext, companytext),
      contentdata,
      [1, 0],
      check,
      jobseekerid,
    );
  } else if (check == educationtext) {
    Profilebottomsheet().profile_bottomSheet2(
      context,
      qualification_items(educationtext, leveleducationtext, fieldstudytext),
      contentdata,
      [1, 1],
      check,
      jobseekerid,
    );
  } else if (check == skilltext) {
    Profilebottomsheet().profile_bottomSheet2(
      context,
      qualification_items(skilltext, skilltext2, expyeartext),
      contentdata,
      [1, 0],
      check,
      jobseekerid,
    );
  } else if (check == languagestext) {
    Profilebottomsheet().profile_bottomSheet4(
      context,
      qualification_items(languagestext, languagetext, proficiencytext),
      contentdata,
      [1, 1],
      check,
      jobseekerid,
      languageproficiencyitems,
    );
  } else if (check == jobtitlestext) {
    Profilebottomsheet().profile_bottomSheet5(
      context,
      qualification_items(jobtitlestext, desiredjobtext, ""),
      contentdata,
      [1, 0],
      check,
      jobseekerid,
    );
  } else if (check == jobtypetext) {
    Profilebottomsheet().profile_bottomSheet6(
      context,
      qualification_items(jobtypetext, desiredjobtypetext, ""),
      contentdata,
      [1],
      check,
      jobseekerid,
      jobtypeitems,
    );
  }
  // else if (i == 2) {
  //     Profilebottomsheet().profile_bottomsheet3(
  //       context,
  //       jobpreference_items(
  //         "Work Schedule",
  //         "what are your desired schedules?",
  //         "Days",
  //         "Shifts",
  //       ),
  //       ["Monday to Friday", "Weekend availability", "Weekend only"],
  //       [
  //         "Day shift",
  //         "Morning shift",
  //         "Rotational shift",
  //         "Night shift",
  //         "Evening shift",
  //         "Fixed shift",
  //         "US shift",
  //         "UK shift",
  //       ],
  //     );
  //   }
  else if (check == minimumpaytext) {
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
  }
  //else if (i == 4) {
  //     Profilebottomsheet().profile_bottomsheet3(
  //       context,
  //       jobpreference_items("Remote settings", "", "Desired work setting", ""),
  //       ["Remote", "Hybrid work", "In-person", "Temporarily remote"],
  //       [],
  //     );
  //   }
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
availablecheckaction(BuildContext context, String jobseekerid, bool value) {
  context.read<Profiledetailcubit>().updateprofiledetails(
    context,
    updateprofiledata,
    jobseekerid,
    [availableimmediatelytext],
    [(value ? 1 : 0).toString()],
  );
}

//========================Profile Detail Delete============
profiledetaildelete(
  BuildContext context,
  String check,
  String id,
  String jobseekerid,
) {
  closeaction(context);
  if (check == workexpereiencetext) {
    context.read<Profiledetailcubit>().deleteprofiledetails(
      context,
      deleteworkexpereience,
      jobseekerid,
      id,
    );
  } else if (check == educationtext) {
    context.read<Profiledetailcubit>().deleteprofiledetails(
      context,
      deleteeducation,
      jobseekerid,
      id,
    );
  } else if (check == skilltext) {
    context.read<Profiledetailcubit>().deleteprofiledetails(
      context,
      deleteskill,
      jobseekerid,
      id,
    );
  } else if (check == languagestext) {
    context.read<Profiledetailcubit>().deleteprofiledetails(
      context,
      deletelanguage,
      jobseekerid,
      id,
    );
  } else if (check == jobtitlestext) {
    context.read<Profiledetailcubit>().deleteprofiledetails(
      context,
      deletejobtitle,
      jobseekerid,
      id,
    );
  } else if (check == jobtypetext) {
    context.read<Profiledetailcubit>().deleteprofiledetails(
      context,
      deletejobtype,
      jobseekerid,
      id,
    );
  }
}

//==========================Save Profile data===========
saveprofiledata(BuildContext context, String check, String jobseekerid, value) {
  closeaction(context);
  if (check == profilesetting) {
    context.read<Profiledetailcubit>().updateprofiledetails(
      context,
      updateprofiledata,
      jobseekerid,
      [openprofiletext],
      [value.toString()],
    );
  } else if (check == workexpereiencetext) {
    context.read<Profiledetailcubit>().updateprofiledetails(
      context,
      insertworkexperience,
      jobseekerid,
      value[1].isEmpty
          ? [jobseeker_idtext, jobtitleapitext]
          : [jobseeker_idtext, jobtitleapitext, companyapitext],
      value[1].isEmpty
          ? [jobseekerid, value[0]]
          : [jobseekerid, value[0], value[1]],
    );
  } else if (check == educationtext) {
    context.read<Profiledetailcubit>().updateprofiledetails(
      context,
      inserteducation,
      jobseekerid,
      [jobseeker_idtext, leveleducationapitext, fieldstudyapitext],
      [jobseekerid, value[0], value[1]],
    );
  } else if (check == skilltext) {
    context.read<Profiledetailcubit>().updateprofiledetails(
      context,
      insertskill,
      jobseekerid,
      [jobseeker_idtext, skillapitext, expyearapitext],
      [jobseekerid, value[0], value[1]],
    );
  } else if (check == languagestext) {
    context.read<Profiledetailcubit>().updateprofiledetails(
      context,
      insertlanguage,
      jobseekerid,
      [jobseeker_idtext, languageapitext, proficiencyapitext],
      [jobseekerid, value[0], value[1]],
    );
  } else if (check == jobtitlestext) {
    context.read<Profiledetailcubit>().updateprofiledetails(
      context,
      insertjobtitle,
      jobseekerid,
      [jobseeker_idtext, job_titleapitext],
      [jobseekerid, value],
    );
  } else if (check == jobtypetext) {
    context.read<Profiledetailcubit>().updateprofiledetails(
      context,
      insertjobtype,
      jobseekerid,
      [jobseeker_idtext, jobtypeapitext],
      [jobseekerid, value],
    );
  }
}

//=====================Homescreen initial======================
homescreeninitial(
  BuildContext context,
  ScrollController scrollController,
  String searchdata,
) {
  context.read<JobCubit>().loadJobs(searchdata); // Load first batch

  scrollController.addListener(() {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent &&
        context.read<JobCubit>().state is JobLoaded &&
        (context.read<JobCubit>().state as JobLoaded).hasMore) {
      context.read<JobCubit>().loadJobs(searchdata); // Load next batch
    }
  });
}

//=======================loginaction===========================
loginaction(BuildContext context, formKey, String mail, String password) {
  if (formKey.currentState!.validate()) {
    context.read<LoginCubit>().loginid(context, mail, password);
  }
}
