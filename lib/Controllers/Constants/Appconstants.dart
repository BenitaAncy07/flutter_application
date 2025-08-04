// ignore_for_file: non_constant_identifier_names

import 'package:flutter_application/Models/AppUImodels.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Iconcontents.dart';
import 'package:flutter_application/View/Helpers/Imagecontents.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';

//================page text==============
String introScreen = "introScreen",
    homeScreen = "homeScreen",
    myjobsScreen = 'myjobsScreen',
    profileScreen = "profileScreen",
    loginScreen = "loginScreen",
    registerScreen = 'registerScreen';

//=============MyJobs text==============
String saved = "Saved", applied = "Applied", archived = "Archived";

String moreoption = "more option",
    replacetext = "Replace",
    deletetext = "Delete",
    offlinetext = "offline",
    darktext = "dark",
    lighttext = "light";

//===========Shared prefernce text==========
String themetext = "theme",
    loginidtext = "loginid",
    loginpersontext = "loginperson";

List<Profile_page_items1> profilesettinglist = [
      Profile_page_items1(
        profilesettinghead1,
        profilesettingsubhead1,
        visibleicon,
      ),
      Profile_page_items1(
        profilesettinghead2,
        profilesettingsubhead2,
        visibilityofficon,
      ),
    ],
    resumesettinglist = [
      Profile_page_items1(replacetext, replacefiletext, replaceicon),
      Profile_page_items1(deletetext, deletefiletext, deleteicon),
    ];

List<Update_Status_items> update_status = [
  Update_Status_items(interviewingtext, green, interviewingicon),
  Update_Status_items(offerreceivedtext, green, offerreceivedicon),
  Update_Status_items(hiredtext, green, hiredicon),
  Update_Status_items(notselectedtext, red, closeicon),
  Update_Status_items(notinterestedtext, red, notinterestedicon),
];

List<Intropage_items> wholist = [
  Intropage_items(employertext, employer_img),
  Intropage_items(jobseekertext, jobseeker_img),
];
