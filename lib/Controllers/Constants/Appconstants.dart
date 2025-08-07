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

//===========Shared prefernce text==========
String themetext = "theme",
    loginidtext = "loginid",
    loginpersontext = "loginperson";

//=========================Regular expressions==================
final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$'),
    passwordregex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$',
    ),
    phoneRegex = RegExp(r'[0-9 +]'),
    payRegex = RegExp(r'[0-9]');

//=============MyJobs text==============
String saved = "Saved", applied = "Applied", archived = "Archived";

String moreoption = "more option",
    replacetext = "Replace",
    downloadtext = "Download",
    deletetext = "Delete",
    offlinetext = "offline",
    onlinetext = "online",
    darktext = "dark",
    lighttext = "light",
    pagetext = 'page';

//==================Map text======================
String filebytetext = "fileBytes", filenametext = "filename";

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
      //   Profile_page_items1(deletetext, deletefiletext, deleteicon),
      Profile_page_items1(downloadtext, downloadfiletext, downloadicon),
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
