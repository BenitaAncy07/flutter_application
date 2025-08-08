import 'package:flutter/material.dart';
import 'package:flutter_application/Controllers/Cubits/LoginCubit.dart';
import 'package:flutter_application/Controllers/Utilities/Actions.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/Controllers/Constants/Appconstants.dart';
import 'package:flutter_application/Models/CubitModels/PageState.dart';
import 'package:flutter_application/View/Helpers/ButtonContents.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';
import 'package:flutter_application/View/Typography/Appbar.dart';
import 'package:flutter_application/View/Typography/ButtonStyles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Introscreen extends StatelessWidget {
  const Introscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Column(
          children: [
            appbar1(context, introscreentext),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth:
                      MediaQuery.of(context).size.width < 400
                          ? double.infinity
                          : 400,
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 24, right: 24),
                  decoration: BoxDecoration(
                    color: transparent,
                    border: Border.all(
                      color: hexToColor(goldencolor),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                                      width:
                                          MediaQuery.of(context).size.width <
                                                  400
                                              ? MediaQuery.of(
                                                    context,
                                                  ).size.width /
                                                  2.8
                                              : 150,
                                      height:
                                          MediaQuery.of(context).size.width <
                                                  400
                                              ? MediaQuery.of(
                                                    context,
                                                  ).size.width /
                                                  2.6
                                              : 150,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              wholist[i].img,
                                              fit: BoxFit.cover,
                                            ),
                                            Text(
                                              wholist[i].text,
                                              style: TextStyle(
                                                fontSize: buttontextsize1,
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
                                        side: BorderSide(
                                          color: hexToColor(goldencolor),

                                          width: 2,
                                        ),
                                        activeColor: hexToColor(goldencolor),
                                        value: state.value[i],
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
                      buttonstyle1(context, coloredbutton, siginbuttontext, (
                        a,
                      ) {
                        signinaction(context);
                      }),

                      Padding(
                        padding: EdgeInsets.only(bottom: 50, top: 20),
                        child: buttonstyle1(
                          context,
                          onlyborderbutton,
                          createaccountbuttontext,
                          (a) {
                            createaccountaction(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
