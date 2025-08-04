import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Controllers/Cubits/LoginCubit.dart';
import 'package:flutter_application/Controllers/Utilities/Actions.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/Models/CubitModels/PageState.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_application/View/Helpers/Imagecontents.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController mailidcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

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
                          RichText(
                            text: TextSpan(
                              text: emailtext,
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
                              children: [],
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.all(10),
                            child: Form(
                              key: _formKey,
                              child: TextFormField(
                                controller: mailidcontroller,
                                focusNode: emailFocus,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(
                                    context,
                                  ).requestFocus(passwordFocus);
                                },
                                textInputAction: TextInputAction.next,

                                cursorColor: hexToColor(goldencolor),
                                style: TextStyle(
                                  fontSize: textsize3,
                                  fontFamily: headingfont,
                                  color:
                                      AdaptiveTheme.of(context).mode ==
                                              AdaptiveThemeMode.light
                                          ? black
                                          : lighttheme,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: hexToColor(goldencolor),
                                      width: 1.0,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: red,
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: red,
                                      width: 1.2,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: hexToColor(goldencolor),
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return requiredemailtext;
                                  }

                                  if (!emailRegex.hasMatch(value)) {
                                    return validemailtext;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),

                          RichText(
                            text: TextSpan(
                              text: passwordtext,
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
                              children: [],
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              controller: passwordcontroller,
                              focusNode: passwordFocus,
                              textInputAction: TextInputAction.done,
                              onSubmitted: (_) {
                                loginaction(
                                  context,
                                  _formKey,
                                  mailidcontroller.text,
                                  passwordcontroller.text,
                                );
                              },

                              cursorColor: hexToColor(goldencolor),
                              style: TextStyle(
                                fontSize: textsize3,
                                fontFamily: headingfont,
                                color:
                                    AdaptiveTheme.of(context).mode ==
                                            AdaptiveThemeMode.light
                                        ? black
                                        : lighttheme,
                              ),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: hexToColor(goldencolor),
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: hexToColor(goldencolor),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 30, top: 30),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: hexToColor(
                                    goldencolor,
                                  ), // Button background color
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 15,
                                  ), // Button padding
                                ),
                                onPressed: () {
                                  loginaction(
                                    context,
                                    _formKey,
                                    mailidcontroller.text,
                                    passwordcontroller.text,
                                  );
                                },
                                child: Text(
                                  siginbuttontext,
                                  style: TextStyle(
                                    fontSize: buttontextsize1,
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
                            ),
                          ),
                        ],
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
