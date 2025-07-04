import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_application/View/Helpers/Imagecontents.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//===========================loading dialog box===================================
loadingdialogBox(context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        iconPadding: EdgeInsets.all(0),
        backgroundColor:
            AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                ? lighttheme
                : darktheme,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          //  side: BorderSide(color: green3, width: 2)
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SpinKitFadingCircle(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: hexToColor(goldencolor),
                      ),
                    );
                  },
                ),
                SizedBox(width: 0.02 * MediaQuery.of(context).size.width),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      loadingtext,
                      style: TextStyle(
                        fontSize: textsize5,
                        color: hexToColor(goldencolor),
                        fontFamily: headingfont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

//===============================Content loading========================
Widget loading() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinKitFadingCircle(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: hexToColor(goldencolor),
              ),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            loadingtext,
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

Widget errorwidget(BuildContext context, msg) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(nocontent_img, width: 200, height: 200),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            msg,
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
        ),
      ],
    ),
  );
}
