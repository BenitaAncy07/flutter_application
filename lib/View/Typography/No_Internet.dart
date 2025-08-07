import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_application/View/Helpers/Iconcontents.dart';
import 'package:flutter_application/View/Helpers/Imagecontents.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (kIsWeb)
                Icon(
                  nointerneticon,
                  size: iconsize0,
                  color: hexToColor(goldencolor),
                ),
              if (!kIsWeb) Image.asset(nointernet_img),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  nointernet_heading,
                  style: TextStyle(
                    fontSize: textsize5,
                    color:
                        AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? black
                            : lighttheme,
                    fontFamily: headingfont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10, top: 10),
                child: Text(
                  nointernet_content,
                  style: TextStyle(
                    fontSize: textsize2,
                    color:
                        AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? black
                            : lighttheme,
                    fontFamily: headingfont,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
