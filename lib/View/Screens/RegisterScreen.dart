import 'package:flutter/material.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_application/View/Helpers/Imagecontents.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(color: hexToColor(goldencolor), height: 10),
        Padding(
          padding: EdgeInsets.only(top: 40, bottom: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(logo, width: 100, height: 100),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  introscreentext,
                  style: TextStyle(
                    fontSize: textsize6,
                    color: hexToColor(goldencolor),
                    fontFamily: headingfont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
