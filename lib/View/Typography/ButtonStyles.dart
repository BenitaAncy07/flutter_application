import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/View/Helpers/ButtonContents.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_application/View/Helpers/Iconcontents.dart';

//=========================Button style 1===================================
Widget buttonstyle1(BuildContext context, String type, String buttontext, a) {
  return InkWell(
    onTap: () {
      a(true);
    },
    child: Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.85,
      padding: EdgeInsets.fromLTRB(8, 12, 8, 12),
      decoration: BoxDecoration(
        color: type == coloredbutton ? hexToColor(goldencolor) : null,
        border:
            type == onlyborderbutton
                ? Border.all(color: hexToColor(goldencolor), width: 1)
                : null,
        borderRadius: BorderRadius.circular(8),
      ),

      child: Text(
        buttontext,
        style: TextStyle(
          fontSize: buttontextsize1,
          color:
              AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                  ? black
                  : lighttheme,
          fontFamily: headingfont,
        ),
      ),
    ),
  );
}

//============================Elevated buttonstyle=======================
Widget elevatedbuttonstyle(
  BuildContext context,
  String type,
  String buttontext,
  a,
) {
  return Padding(
    padding: EdgeInsets.only(bottom: 30, top: 30),
    child: SizedBox(
      width:
          MediaQuery.of(context).size.width < 800
              ? MediaQuery.of(context).size.width * 0.8
              : MediaQuery.of(context).size.width * 0.4,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              type == coloredbutton
                  ? hexToColor(goldencolor)
                  : null, // Button background color
          padding: EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ), // Button padding
        ),
        onPressed: () {
          a(true);
        },
        child: Text(
          buttontext,
          style: TextStyle(
            fontSize: buttontextsize1,
            color:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black
                    : lighttheme,
            fontFamily: headingfont,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

//=============================Icon buttonstyle=========================
Widget iconbuttonstyle(
  BuildContext context,
  String type,
  IconData iconval,
  String buttontext,
  a,
) {
  return Padding(
    padding: EdgeInsets.only(bottom: 20, right: 20, top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            a(true);
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: type == coloredbutton ? hexToColor(goldencolor) : null,

              border:
                  type == onlyborderbutton
                      ? Border.all(color: hexToColor(goldencolor), width: 1)
                      : null,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Row(
              spacing: 5,
              children: [
                Icon(
                  iconval,
                  size: iconsize4,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? black
                          : lighttheme,
                ),
                Text(
                  buttontext,
                  style: TextStyle(
                    fontSize: buttontextsize2,
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
        ),
      ],
    ),
  );
}
