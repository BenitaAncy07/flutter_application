import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application/Controllers/Constants/ApiConstants.dart';
import 'package:flutter_application/Controllers/Constants/GlobalConstants.dart';
import 'package:flutter_application/Controllers/Cubits/BottombarCubit.dart';
import 'package:flutter_application/Controllers/Cubits/JobDetailCubit.dart';
import 'package:flutter_application/Controllers/Cubits/LoginCubit.dart';
import 'package:flutter_application/Controllers/Cubits/MyjobCubit.dart';
import 'package:flutter_application/Controllers/Cubits/PageCubit.dart';
import 'package:flutter_application/Controllers/Cubits/Pagination/HomeCubit.dart';
import 'package:flutter_application/Controllers/Cubits/ProfileCubit.dart';
import 'package:flutter_application/Controllers/Cubits/RegisterCubit.dart';
import 'package:flutter_application/Controllers/Utilities/FileActions.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/Controllers/Constants/Appconstants.dart';
import 'package:flutter_application/Models/AppUImodels.dart';
import 'package:flutter_application/Models/CubitModels/HomeState.dart';
import 'package:flutter_application/Models/CubitModels/PageState.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_application/View/Helpers/Iconcontents.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';
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
    context.read<RegisterCubit>().reset();
    return;
  } else if (!kIsWeb) {
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

// //============================skip action===========================
// skipaction(BuildContext context) {
//   context.read<PageCubit>().nextPage(homeScreen);
// }

//============================create account action=================
createaccountaction(BuildContext context) {
  context.read<PageCubit>().nextPage(registerScreen);
}

//=============================Sign in action=======================
signinaction(BuildContext context) {
  context.read<PageCubit>().nextPage(loginScreen);
}

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
resumeaction(
  String value,
  BuildContext context,
  String jobseekerid,
  String filename,
) async {
  if (value == replacetext) {
    Map items = await pickFileaction(context);
    context.read<Profiledetailcubit>().fileupload(
      context,
      items[filebytetext],
      items[filenametext],
      jobseekerid,
    );
  } else if (value == deletetext) {
  } else if (value == downloadtext) {
    await downloadaction(context, jobseekerid, filename);
  }
}

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
      qualification_items(check, desiredjobtypetext, ""),
      contentdata,
      jobseekerid,
      jobtypeitems,
    );
  } else if (check == workscheduletext) {
    Profilebottomsheet().profile_bottomsheet3(
      context,
      qualification_items(workscheduletext, desiredscheduletext, shiftstext),
      [1, 1],
      scheduleitems,
      shiftitems,
      contentdata,
      jobseekerid,
    );
  } else if (check == minimumpaytext) {
    Profilebottomsheet().profile_bottomSheet4(
      context,
      qualification_items(
        minimumpayconsidertext,
        "$minimumpaytext ( $currencysymbol )",
        payperiodtext,
      ),
      contentdata,
      [1, 1],
      check,
      jobseekerid,
      payperioditems,
    );
  } else if (check == worklocationtext) {
    Profilebottomsheet().profile_bottomSheet6(
      context,
      qualification_items(check, worksettingtext, ""),
      contentdata,
      jobseekerid,
      locationitems,
    );
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
      updatejobtype,
      jobseekerid,
      [jobtypeapitext],
      [value],
    );
  } else if (check == worklocationtext) {
    context.read<Profiledetailcubit>().updateprofiledetails(
      context,
      updateworklocation,
      jobseekerid,
      [worklocationapitext],
      [value],
    );
  } else if (check == minimumpaytext) {
    context.read<Profiledetailcubit>().updateprofiledetails(
      context,
      updateminimumpay,
      jobseekerid,
      [minimumbasepayapitext, payperiodapitext],
      value,
    );
  } else if (check == workscheduletext) {
    context.read<Profiledetailcubit>().updateprofiledetails(
      context,
      updateschedule,
      jobseekerid,
      [scheduleapitext, shiftapitext],
      value,
    );
  }
}

//=====================Homescreen initial======================
homescreeninitial(
  BuildContext context,
  ScrollController scrollController,
  String searchdata,
) {
  context.read<JobCubit>().emptylist();
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
loginaction(
  BuildContext context,
  GlobalKey<FormState> formKey,
  String mail,
  String password,
) {
  if (formKey.currentState!.validate()) {
    context.read<LoginCubit>().loginid(context, mail, password);
  }
}

//=======================Register Action============================
registeraction(
  BuildContext context,
  String person,
  RegisterState statecontents,
) {
  if (person == jobseekertext) {
    if (statecontents.formKey1.currentState!.validate() &&
        statecontents.formKey2.currentState!.validate() &&
        statecontents.formKey3.currentState!.validate() &&
        statecontents.formKey4.currentState!.validate() &&
        statecontents.formKey5.currentState!.validate() &&
        statecontents.formKey6.currentState!.validate() &&
        statecontents.formKey15.currentState!.validate() &&
        statecontents.jobtype.isNotEmpty &&
        statecontents.schedule.isNotEmpty &&
        statecontents.shift.isNotEmpty &&
        statecontents.worklocation.isNotEmpty &&
        statecontents.jobtitle.isNotEmpty &&
        statecontents.level.isNotEmpty &&
        statecontents.skill.isNotEmpty &&
        statecontents.language.isNotEmpty &&
        statecontents.desiredjob.isNotEmpty) {
      context.read<RegisterCubit>().updatedatas(context, person);
    } else {
      simplesnackbar(context, fieldrequiredtext);
    }
  } else if (person == employertext) {
    if (statecontents.formKey1.currentState!.validate() &&
        statecontents.formKey2.currentState!.validate() &&
        statecontents.formKey3.currentState!.validate() &&
        statecontents.formKey4.currentState!.validate() &&
        statecontents.formKey5.currentState!.validate() &&
        statecontents.formKey6.currentState!.validate() &&
        statecontents.formKey7.currentState!.validate() &&
        statecontents.formKey8.currentState!.validate()) {
      context.read<RegisterCubit>().updatedatas(context, person);
    }
  }
}

//===============================Register page confirm button action===================
regconfirmbuttonaction(
  BuildContext context,
  String person,
  RegisterState statecontents,
  int clickvalue,
) {
  if (person == jobseekertext) {
    if (clickvalue > 4 && !statecontents.formKey15.currentState!.validate()) {
      simplesnackbar(context, fieldrequiredtext.toLowerCase());
      return false;
    }

    if (clickvalue > 4 && statecontents.desiredjob.isEmpty) {
      simplesnackbar(
        context,
        addrequiredtext + desiredjobtext.toLowerCase() + yettext,
      );
      return false;
    }

    if (clickvalue > 3 && statecontents.language.isEmpty) {
      simplesnackbar(
        context,
        addrequiredtext + languagestext.toLowerCase() + yettext,
      );
      return false;
    }

    if (clickvalue > 2 && statecontents.skill.isEmpty) {
      simplesnackbar(
        context,
        addrequiredtext + skilltext2.toLowerCase() + yettext,
      );
      return false;
    }

    if (clickvalue > 1 && statecontents.level.isEmpty) {
      simplesnackbar(
        context,
        addrequiredtext + educationtext.toLowerCase() + yettext,
      );
      return false;
    }

    if (clickvalue > 0 && statecontents.jobtitle.isEmpty) {
      simplesnackbar(
        context,
        addrequiredtext + workexpereiencetext.toLowerCase() + yettext,
      );
      return false;
    }
    if (clickvalue > -1) {
      if (statecontents.formKey1.currentState!.validate() &&
          statecontents.formKey2.currentState!.validate() &&
          statecontents.formKey3.currentState!.validate() &&
          statecontents.formKey4.currentState!.validate() &&
          statecontents.formKey5.currentState!.validate() &&
          statecontents.formKey6.currentState!.validate() &&
          statecontents.resumecontroller.text.isNotEmpty) {
        return true;
      } else if (statecontents.formKey1.currentState!.validate() &&
          statecontents.formKey2.currentState!.validate() &&
          statecontents.formKey3.currentState!.validate() &&
          statecontents.formKey4.currentState!.validate() &&
          statecontents.formKey5.currentState!.validate() &&
          statecontents.formKey6.currentState!.validate() &&
          statecontents.resumecontroller.text.isEmpty) {
        simplesnackbar(context, noresumemsg);
        return false;
      } else {
        simplesnackbar(context, fieldrequiredtext);
        return false;
      }
    }
  }
}

//=====================add button action in register page==============
addbuttonaction(RegisterState statecontents, String heading) {
  if (heading == workexpereiencetext) {
    if (statecontents.jobtitlecontroller.text.isNotEmpty) {
      statecontents.jobtitle.add(statecontents.jobtitlecontroller.text);
      statecontents.company.add(statecontents.companycontroller.text);
      statecontents.jobtitlecontroller.clear();
      statecontents.companycontroller.clear();
    } else {
      statecontents.formKey7.currentState!.validate();
    }
  } else if (heading == educationtext) {
    if (statecontents.levelcontroller.text.isNotEmpty &&
        statecontents.fieldcontroller.text.isNotEmpty) {
      statecontents.level.add(statecontents.levelcontroller.text);
      statecontents.field.add(statecontents.fieldcontroller.text);
      statecontents.levelcontroller.clear();
      statecontents.fieldcontroller.clear();
    } else {
      statecontents.formKey9.currentState!.validate();
      statecontents.formKey10.currentState!.validate();
    }
  } else if (heading == skilltext2) {
    if (statecontents.skillcontroller.text.isNotEmpty) {
      statecontents.skill.add(statecontents.skillcontroller.text);
      statecontents.expyear.add(statecontents.yearcontroller.text);
      statecontents.skillcontroller.clear();
      statecontents.yearcontroller.clear();
    } else {
      statecontents.formKey11.currentState!.validate();
      statecontents.formKey12.currentState!.validate();
    }
  } else if (heading == languagetext) {
    if (statecontents.langcontroller.text.isNotEmpty &&
        statecontents.proficiencycontroller.text.isNotEmpty) {
      statecontents.language.add(statecontents.langcontroller.text);
      statecontents.proficiency.add(statecontents.proficiencycontroller.text);
      statecontents.langcontroller.clear();
    } else {
      statecontents.formKey11.currentState!.validate();
      statecontents.formKey12.currentState!.validate();
    }
  } else if (heading == desiredjobtext) {
    if (statecontents.desiredjobcontroller.text.isNotEmpty) {
      statecontents.desiredjob.add(statecontents.desiredjobcontroller.text);
      statecontents.desiredjobcontroller.clear();
    } else {
      statecontents.formKey16.currentState!.validate();
    }
  }
}

//==========================Display data action in register page===========
displaybuttonaction(RegisterState statecontents, String heading, String item) {
  if (heading == workexpereiencetext) {
    statecontents.jobtitle.remove(item.split(" - ")[0]);
    statecontents.company.remove(item.split(" - ")[1]);
  } else if (heading == educationtext) {
    statecontents.level.remove(item.split(" - ")[0]);
    statecontents.field.remove(item.split(" - ")[1]);
  } else if (heading == skilltext2) {
    statecontents.skill.remove(item.split(" - ")[0]);
    statecontents.expyear.remove(item.split(" - ")[1]);
  } else if (heading == languagetext) {
    statecontents.language.remove(item.split(" - ")[0]);
    statecontents.proficiency.remove(item.split(" - ")[1]);
  } else if (heading == desiredjobtext) {
    statecontents.desiredjob.remove(item);
  }
}
