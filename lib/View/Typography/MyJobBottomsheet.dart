import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Controllers/Utilities/Actions.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/Models/Appconstants.dart';
import 'package:flutter_application/Models/AppUImodels.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_application/View/Helpers/Iconcontents.dart';
import 'package:flutter_application/View/Helpers/UIconstants.dart';

class myjobBottomsheet {
  void mainwidget(
    BuildContext context,
    List<Update_Status_items> displayitem,
    String identifiertext,
  ) {
    showModalBottomSheet(
      backgroundColor:
          AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
              ? lighttheme
              : darktheme,
      context: context,

      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              headerwidget(context, identifiertext),
              Divider(thickness: 1, color: hexToColor(goldencolor)),
              for (int i = 0; i < displayitem.length; i++)
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        bottomsheetbuttonaction(displayitem[i].text);
                      },
                      child: Row(
                        spacing: 10,
                        children: [
                          ClipOval(
                            child: Container(
                              color: displayitem[i].color,
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                displayitem[i].icon,
                                color: white,
                                size: buttoniconsize3,
                              ),
                            ),
                          ),
                          Text(
                            displayitem[i].text,
                            style: TextStyle(
                              fontSize: myjobheadingtextsize,
                              color:
                                  AdaptiveTheme.of(context).mode ==
                                          AdaptiveThemeMode.light
                                      ? black
                                      : lighttheme,
                              fontFamily: headingfont,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(thickness: 1, color: hexToColor(goldencolor)),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  //========================Applied Header====================
  Widget appliedheader(BuildContext context) {
    return Column(
      children: [
        Text(
          appliedheadingtext,
          style: TextStyle(
            fontSize: myjobheadingtextsize,
            color:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black
                    : lighttheme,
            fontFamily: headingfont,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          spacing: 10,
          children: [
            Icon(
              visibilityofficon,
              size: buttoniconsize2,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black.withOpacity(0.7)
                      : lighttheme.withOpacity(0.7),
            ),

            Text(
              appliedheadingtext2,
              style: TextStyle(
                fontSize: myjobtextsize1,
                color:
                    AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                        ? black.withOpacity(0.7)
                        : lighttheme.withOpacity(0.7),
                fontFamily: headingfont,
              ),
            ),
          ],
        ),
      ],
    );
  }

  //========================header widget=====================
  Widget headerwidget(BuildContext context, String identifiertext) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (identifiertext == applied) appliedheader(context),
        if (identifiertext == moreoption)
          Text(
            moreoptionheading,
            style: TextStyle(
              fontSize: myjobheadingtextsize,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
              fontFamily: headingfont,
              fontWeight: FontWeight.bold,
            ),
          ),
        IconButton(
          onPressed: () {
            closeaction(context);
          },
          icon: Icon(
            size: appbariconsize,
            closeicon,
            color:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black
                    : lighttheme,
          ),
        ),
      ],
    );
  }
}
