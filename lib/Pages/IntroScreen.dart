import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Helpers/Hexconversion.dart';
import 'package:flutter_application/Helpers/Typography.dart';

class Introscreen extends StatefulWidget {
  const Introscreen({super.key});

  @override
  State<Introscreen> createState() => _IntroscreenState();
}

class _IntroscreenState extends State<Introscreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/splashlogo.png", width: 200, height: 200),
          Text(
            "The world's no. 1 job search site",
            style: TextStyle(
              fontSize: 18,
              color: hexToColor("#D4AF37"),
              fontFamily: headingfont,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.85,
              padding: EdgeInsets.fromLTRB(8, 12, 8, 12),
              decoration: BoxDecoration(
                color: hexToColor("#D4AF37"),
                borderRadius: BorderRadius.circular(
                  8,
                ), // Adjust the value for more/less curve
              ),

              child: Text(
                "Sign in",
                style: TextStyle(
                  fontSize: 15,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? black
                          : lighttheme,
                  fontFamily: headingfont,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.85,
              padding: EdgeInsets.fromLTRB(8, 12, 8, 12),
              decoration: BoxDecoration(
                border: Border.all(color: hexToColor("#D4AF37"), width: 1),
                borderRadius: BorderRadius.circular(5),
              ),

              child: Text(
                "Create an account",
                style: TextStyle(
                  fontSize: 15,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? black
                          : lighttheme,
                  fontFamily: headingfont,
                ),
              ),
            ),
          ),
          SizedBox(),
        ],
      ),
    );
  }
}
