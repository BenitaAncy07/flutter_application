// ignore_for_file: use_build_context_synchronously

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_application/Controllers/Cubits/LoginCubit.dart';
import 'package:flutter_application/Controllers/Cubits/PageCubit.dart';
import 'package:flutter_application/Controllers/Utilities/Actions.dart';
import 'package:flutter_application/Models/CubitModels/PageState.dart';
import 'package:flutter_application/Controllers/Constants/Appconstants.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_application/View/Helpers/Iconcontents.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/View/Helpers/Imagecontents.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//==========================Appbar for intro,login and register screen=====================
Widget appbar1(BuildContext context, String headertext) {
  return Column(
    children: [
      Container(color: hexToColor(goldencolor), height: 10),
      Padding(
        padding: EdgeInsets.only(top: 40, bottom: 40, right: 10, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(logo, width: 100, height: 100),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    headertext,
                    style: TextStyle(
                      fontSize: textsize6,
                      color: hexToColor(goldencolor),
                      fontFamily: headingfont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

//==============================appbar for home,myjobs and profile screen=================
Widget appbar2(BuildContext context) {
  return BlocBuilder<LoginCubit, LoginState>(
    builder: (context, loginstate) {
      return BlocBuilder<PageCubit, PageState>(
        builder: (context, state) {
          return AppBar(
            backgroundColor:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? lighttheme
                    : darktheme,
            leading: Image.asset(splashlogo),
            title: Text(
              loginstate.person == employertext
                  ? ""
                  : //admin
                  state.page[pagetext] == homeScreen
                  ? home_appbarheading
                  : state.page[pagetext] == myjobsScreen
                  ? myjob_appbarheading
                  : profile_appbarheading,
              style: TextStyle(
                fontSize: textsize5,
                color: hexToColor(goldencolor),
                fontFamily: headingfont,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  themechange(context);
                },
                icon: Icon(
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? lighticon
                      : darkicon,
                  color: hexToColor(goldencolor),
                  size: iconsize1,
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(4.0),
              child: Container(color: hexToColor(goldencolor), height: 1),
            ),
          );
        },
      );
    },
  );
}
