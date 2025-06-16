import 'package:flutter/material.dart';
import 'package:flutter_application/View/Helpers/UIconstants.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/View/Helpers/Iconcontents.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';

List<BottomNavigationBarItem> bottombaritem = [
  BottomNavigationBarItem(
    activeIcon: Icon(
      homeactiveicon,
      size: bottombariconsize,
      color: hexToColor(goldencolor),
    ),
    icon: Icon(homeicon, color: hexToColor(goldencolor)),
    label: homelabel,
  ),
  BottomNavigationBarItem(
    activeIcon: Icon(
      myjobsactiveicon,
      size: bottombariconsize,
      color: hexToColor(goldencolor),
    ),
    icon: Icon(myjobsicon, color: hexToColor(goldencolor)),
    label: jobslabel,
  ),
  BottomNavigationBarItem(
    activeIcon: Icon(
      profileactiveicon,
      size: bottombariconsize,
      color: hexToColor(goldencolor),
    ),
    icon: Icon(profileicon, color: hexToColor(goldencolor)),
    label: profilelabel,
  ),
];
