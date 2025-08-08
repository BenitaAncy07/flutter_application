import 'package:flutter/material.dart';
import 'package:flutter_application/Controllers/Cubits/LoginCubit.dart';
import 'package:flutter_application/Controllers/Utilities/Actions.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/Models/CubitModels/PageState.dart';
import 'package:flutter_application/View/Helpers/ButtonContents.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';
import 'package:flutter_application/View/Typography/Appbar.dart';
import 'package:flutter_application/View/Typography/ButtonStyles.dart';
import 'package:flutter_application/View/Typography/CommonWidgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController mailidcontroller = TextEditingController(),
      passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>(), _formKey3 = GlobalKey<FormState>();
  FocusNode emailFocus = FocusNode(), passwordFocus = FocusNode();
  bool pasvisible = false;
  @override
  void dispose() {
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            state.person + logintext,
                            style: TextStyle(
                              fontSize: textsize6,
                              color: hexToColor(goldencolor),
                              fontFamily: headingfont,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textwidget(context, emailtext, 1),
                          textboxwidget(
                            context,
                            _formKey,
                            mailidcontroller,
                            emailFocus,
                            1,
                            1,
                            emailtext,
                            emaillabeltext,
                            emailhinttext,
                            false,
                            (b) {},
                            (a) {
                              FocusScope.of(
                                context,
                              ).requestFocus(passwordFocus);
                            },
                          ),

                          textwidget(context, passwordtext, 1),
                          textboxwidget(
                            context,
                            _formKey3,
                            passwordcontroller,
                            passwordFocus,
                            1,
                            1,
                            passwordtext,
                            passwordlabeltext,
                            passwordhinttext,
                            pasvisible,
                            (b) {
                              setState(() {
                                pasvisible = !pasvisible;
                              });
                            },
                            (a) {
                              loginaction(
                                context,
                                _formKey,
                                mailidcontroller.text,
                                passwordcontroller.text,
                              );
                            },
                          ),
                        ],
                      ),
                      elevatedbuttonstyle(
                        context,
                        coloredbutton,
                        siginbuttontext,
                        (a) {
                          loginaction(
                            context,
                            _formKey,
                            mailidcontroller.text,
                            passwordcontroller.text,
                          );
                        },
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
