// ignore_for_file: non_constant_identifier_names

import 'package:flutter_application/Models/AppUImodels.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Iconcontents.dart';
import 'package:flutter_application/View/Helpers/Imagecontents.dart';
import 'package:flutter_application/View/Helpers/UIconstants.dart';

String introScreen = "introScreen",
    homeScreen = "homeScreen",
    myjobsScreen = 'myjobsScreen',
    profileScreen = "profileScreen",
    saved = "Saved",
    applied = "Applied",
    archived = "Archived",
    moreoption = "more option",
    replacetext = "Replace",
    deletetext = "Delete";

List<Profile_page_items> profilesettinglist = [
      Profile_page_items(
        profilesettinghead1,
        profilesettingsubhead1,
        visibleicon,
      ),
      Profile_page_items(
        profilesettinghead2,
        profilesettingsubhead2,
        visibilityofficon,
      ),
    ],
    resumesettinglist = [
      Profile_page_items(replacetext, replacefiletext, replaceicon),
      Profile_page_items(deletetext, deletefiletext, deleteicon),
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
