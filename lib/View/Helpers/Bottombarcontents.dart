import 'package:flutter/material.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/View/Helpers/Iconcontents.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';

List<BottomNavigationBarItem> bottombaritemjobseeker = [
      BottomNavigationBarItem(
        activeIcon: Icon(
          homeactiveicon,
          size: iconsize2,
          color: hexToColor(goldencolor),
        ),
        icon: Icon(homeicon, color: hexToColor(goldencolor)),
        label: homelabel,
      ),
      BottomNavigationBarItem(
        activeIcon: Icon(
          myjobsactiveicon,
          size: iconsize2,
          color: hexToColor(goldencolor),
        ),
        icon: Icon(myjobsicon, color: hexToColor(goldencolor)),
        label: jobslabel,
      ),
      BottomNavigationBarItem(
        activeIcon: Icon(
          profileactiveicon,
          size: iconsize2,
          color: hexToColor(goldencolor),
        ),
        icon: Icon(profileicon, color: hexToColor(goldencolor)),
        label: profilelabel,
      ),
    ],
    bottombaritememployer = [
      BottomNavigationBarItem(
        activeIcon: Icon(
          dashboardactiveicon,
          size: iconsize2,
          color: hexToColor(goldencolor),
        ),
        icon: Icon(dashboardicon, color: hexToColor(goldencolor)),
        label: dashboardlabel,
      ),
      BottomNavigationBarItem(
        activeIcon: Icon(
          myjobsactiveicon,
          size: iconsize2,
          color: hexToColor(goldencolor),
        ),
        icon: Icon(myjobsicon, color: hexToColor(goldencolor)),
        label: jobslabel,
      ),
    ];
