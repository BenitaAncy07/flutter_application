import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Controllers/Cubits/LoginCubit.dart';
import 'package:flutter_application/Controllers/Utilities/Actions.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/Models/Appconstants.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_application/View/Helpers/Imagecontents.dart';
import 'package:flutter_application/View/Helpers/UIconstants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Introscreen extends StatelessWidget {
  const Introscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, List>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(splashlogo, width: 200, height: 200),

              Text(
                introscreentext,
                style: TextStyle(
                  fontSize: introscreentextsize,
                  color: hexToColor(goldencolor),
                  fontFamily: headingfont,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 30, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < wholist.length; i++)
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Stack(
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: hexToColor(goldencolor),
                                  width: 2,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      wholist[i].img,
                                      fit: BoxFit.cover,
                                    ),
                                    Text(
                                      wholist[i].text,
                                      style: TextStyle(
                                        fontSize: buttontextsize,
                                        color: hexToColor(goldencolor),
                                        fontFamily: headingfont,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Positioned(
                              top: 2,
                              right: 2,
                              child: Checkbox(
                                activeColor: hexToColor(goldencolor),
                                value: state[0][i],
                                onChanged: (bool? value) {
                                  selectwhoaction(context, i);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  signinaction(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding: EdgeInsets.fromLTRB(8, 12, 8, 12),
                  decoration: BoxDecoration(
                    color: hexToColor(goldencolor),
                    borderRadius: BorderRadius.circular(8),
                  ),

                  child: Text(
                    siginbuttontext,
                    style: TextStyle(
                      fontSize: buttontextsize,
                      color:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? black
                              : lighttheme,
                      fontFamily: headingfont,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 10, top: 20),
                child: InkWell(
                  onTap: () {
                    createaccountaction();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: EdgeInsets.fromLTRB(8, 12, 8, 12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: hexToColor(goldencolor),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: Text(
                      createaccountbuttontext,
                      style: TextStyle(
                        fontSize: buttontextsize,
                        color:
                            AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.light
                                ? black
                                : lighttheme,
                        fontFamily: headingfont,
                      ),
                    ),
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  skipaction(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding: EdgeInsets.fromLTRB(8, 12, 8, 12),
                  child: Text(
                    skipbuttontext,
                    style: TextStyle(
                      fontSize: buttontextsize,
                      color: hexToColor(goldencolor),
                      fontFamily: headingfont,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
