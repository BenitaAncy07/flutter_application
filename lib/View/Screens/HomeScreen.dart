// ignore_for_file: must_be_immutable

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_application/Controllers/Utilities/Actions.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/View/Helpers/Iconcontents.dart';
import 'package:flutter_application/View/Helpers/UIconstants.dart';

class Home extends StatelessWidget {
  Home({super.key});

  TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchbarwidget(context),
        Expanded(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 20,
            width: double.infinity,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 10,
                      child: Card(
                        color:
                            AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.light
                                ? lighttheme
                                : darktheme,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: hexToColor(goldencolor),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 4,
                        child: InkWell(
                          onTap: () {
                            jobviewaction(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                contentshowwidget(context),
                                rightsidebuttonwidget(context),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  //============================searchbar widget================================
  Widget searchbarwidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: searchcontroller,
        cursorColor: hexToColor(goldencolor),
        style: TextStyle(
          fontSize: searchtextsize,
          fontFamily: headingfont,
          color:
              AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                  ? black
                  : lighttheme,
        ),
        decoration: InputDecoration(
          hintText: searchhinttext,
          hintStyle: TextStyle(
            fontSize: searchtextsize,
            fontFamily: headingfont,
            color:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black.withOpacity(0.5)
                    : lighttheme.withOpacity(0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: hexToColor(goldencolor), width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: hexToColor(goldencolor), width: 1.0),
          ),

          prefixIcon: Icon(
            searchicon,
            color: hexToColor(goldencolor),
            size: buttoniconsize,
          ),
        ),
        onChanged: (query) {
          searchaction();
        },
      ),
    );
  }

  //============================rightside button widget========================
  Widget rightsidebuttonwidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          iconSize: buttoniconsize,
          onPressed: () {
            savejobaction(context);
          },
          icon: Icon(saveicon, color: hexToColor(goldencolor)),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 80),
          child: IconButton(
            iconSize: buttoniconsize,
            onPressed: () {
              blockaction(context);
            },
            icon: Icon(blockicon, color: hexToColor(goldencolor)),
          ),
        ),
      ],
    );
  }

  //===========================Content show widget========================
  Widget contentshowwidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            'SENIOR FLUTTER DEVELOPER ',
            style: TextStyle(
              fontSize: homeheadingtextsize,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
              fontFamily: headingfont,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        Text(
          "Anjita It Solutions Pvt Ltd",
          style: TextStyle(
            fontSize: homesubheadingtextsize,
            color:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black
                    : lighttheme,
            fontFamily: headingfont,
          ),
        ),
        Text(
          "Mumbai,Maharastra",
          style: TextStyle(
            fontSize: homesubheadingtextsize,
            color:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black
                    : lighttheme,
            fontFamily: headingfont,
          ),
        ),
        Text(
          "Remote",
          style: TextStyle(
            fontSize: homesubheadingtextsize,
            color:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black
                    : lighttheme,
            fontFamily: headingfont,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            "₹ 35,000 - ₹ 45,000 a month",
            style: TextStyle(
              fontSize: homesubheadingtextsize,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
              fontFamily: headingfont,
            ),
          ),
        ),
        Row(
          spacing: 10,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(8, 1, 8, 1),
              decoration: BoxDecoration(
                border: Border.all(color: hexToColor(goldencolor), width: 1),
                borderRadius: BorderRadius.circular(3),
              ),

              child: Text(
                "Full-time",
                style: TextStyle(
                  fontSize: homesubheadingtextsize,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? black
                          : lighttheme,
                  fontFamily: headingfont,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8, 1, 8, 1),
              decoration: BoxDecoration(
                border: Border.all(color: hexToColor(goldencolor), width: 1),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Text(
                "Day shift",
                style: TextStyle(
                  fontSize: homesubheadingtextsize,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? black
                          : lighttheme,
                  fontFamily: headingfont,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
