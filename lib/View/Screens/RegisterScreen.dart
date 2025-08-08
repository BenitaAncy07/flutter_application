import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Controllers/Constants/Appconstants.dart';
import 'package:flutter_application/Controllers/Constants/GlobalConstants.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';
import 'package:flutter_application/Controllers/Cubits/LoginCubit.dart';
import 'package:flutter_application/Controllers/Cubits/RegisterCubit.dart';
import 'package:flutter_application/Controllers/Utilities/Actions.dart';
import 'package:flutter_application/Controllers/Utilities/FileActions.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/Models/CubitModels/PageState.dart';
import 'package:flutter_application/View/Helpers/ButtonContents.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_application/View/Helpers/Iconcontents.dart';
import 'package:flutter_application/View/Typography/Appbar.dart';
import 'package:flutter_application/View/Typography/ButtonStyles.dart';
import 'package:flutter_application/View/Typography/CommonWidgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  List<bool> showcontentindex = [false, false, false, false, false, false];
  int click = 0;
  bool pasvisible = false, confirmpasvisible = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, statecontents) {
        return BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  appbar1(context, introscreentext),
                  if (state.person == employertext)
                    employerwidget(state, statecontents),
                  if (state.person == jobseekertext)
                    jobseekerwidget(state, statecontents),
                ],
              ),
            );
          },
        );
      },
    );
  }

  //============================Employer widget=======================
  Widget employerwidget(LoginState state, RegisterState statecontents) {
    return MediaQuery.of(context).size.width > 800
        ? outerlayerwidget(
          Column(
            children: [
              Row(
                children: [
                  namewidget(statecontents),
                  emailwidget(statecontents),
                ],
              ),
              Row(
                children: [
                  passwordwidget(statecontents),
                  confirmpasswordwidget(statecontents),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                child: Text(
                  companydetailtext,
                  style: TextStyle(
                    fontSize: textsize6,
                    color: hexToColor(goldencolor),
                    fontFamily: headingfont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  companynamewidget(statecontents),
                  companytypewidget(statecontents),
                ],
              ),
              Row(
                children: [
                  aboutcompanywidget(statecontents),
                  locationwidget(statecontents, state),
                ],
              ),
              elevatedbuttonstyle(context, coloredbutton, registerbuttontext, (
                a,
              ) {
                registeraction(context, state.person, statecontents);
              }),
            ],
          ),
          state.person,
          registersubtext,
          state,
          statecontents,
        )
        : Column(
          children: [
            outerlayerwidget(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  namewidget(statecontents),
                  emailwidget(statecontents),
                  passwordwidget(statecontents),
                  confirmpasswordwidget(statecontents),
                ],
              ),
              state.person,
              registersubtext,
              state,
              statecontents,
            ),
            companydetailwidget(statecontents, state),
            elevatedbuttonstyle(context, coloredbutton, registerbuttontext, (
              onfieldsubmit,
            ) {
              registeraction(context, state.person, statecontents);
            }),
          ],
        );
  }

  //==========================Jobseekerwidget==============================
  Widget jobseekerwidget(LoginState state, RegisterState statecontents) {
    return MediaQuery.of(context).size.width > 800
        ? outerlayerwidget(
          Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      namewidget(statecontents),
                      emailwidget(statecontents),
                    ],
                  ),
                  Row(
                    children: [
                      passwordwidget(statecontents),
                      confirmpasswordwidget(statecontents),
                    ],
                  ),
                  Row(
                    children: [
                      phonewidget(statecontents, state),
                      locationwidget(statecontents, state),
                    ],
                  ),
                  resumewidget(statecontents),
                ],
              ),
              if (showcontentindex[0])
                workexperiencewidget(statecontents, state),
              if (showcontentindex[1]) educationwidget(statecontents, state),
              if (showcontentindex[2]) skillwidget(statecontents, state),
              if (showcontentindex[3]) languagewidget(statecontents, state),
              if (showcontentindex[4])
                desiredjobtitlewidget(statecontents, state),
              if (showcontentindex[5]) desiredjobschedule(statecontents, state),
              if (click < showcontentindex.length)
                iconbuttonstyle(
                  context,
                  coloredbutton,
                  righticon,
                  nextbuttontext,
                  (onfieldsubmit) {
                    setState(() {
                      if (click < showcontentindex.length) {
                        showcontentindex[click] = regconfirmbuttonaction(
                          context,
                          state.person,
                          statecontents,
                          click,
                        );
                        if (showcontentindex[click]) {
                          click = click + 1;
                        }
                      }
                    });
                  },
                ),
            ],
          ),
          state.person,
          registersubtext,
          state,
          statecontents,
        )
        : Column(
          children: [
            loginwidget(state, statecontents),
            if (showcontentindex[0]) workexperiencewidget(statecontents, state),
            if (showcontentindex[1]) educationwidget(statecontents, state),
            if (showcontentindex[2]) skillwidget(statecontents, state),
            if (state.person == jobseekertext && showcontentindex[3])
              languagewidget(statecontents, state),
            if (showcontentindex[4])
              desiredjobtitlewidget(statecontents, state),
            if (showcontentindex[5]) desiredjobschedule(statecontents, state),
            if (showcontentindex[5])
              elevatedbuttonstyle(context, coloredbutton, registerbuttontext, (
                onfieldsubmit,
              ) {
                registeraction(context, state.person, statecontents);
              }),
            if (click < showcontentindex.length)
              iconbuttonstyle(
                context,
                coloredbutton,
                righticon,
                nextbuttontext,
                (onfieldsubmit) {
                  setState(() {
                    if (click < showcontentindex.length) {
                      showcontentindex[click] = regconfirmbuttonaction(
                        context,
                        state.person,
                        statecontents,
                        click,
                      );
                      if (showcontentindex[click]) {
                        click = click + 1;
                      }
                    }
                  });
                },
              ),
          ],
        );
  }

  //==========================Login widget==================
  Widget loginwidget(LoginState state, RegisterState statecontents) {
    return outerlayerwidget(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          namewidget(statecontents),
          emailwidget(statecontents),
          passwordwidget(statecontents),
          confirmpasswordwidget(statecontents),
          phonewidget(statecontents, state),
          locationwidget(statecontents, state),
          resumewidget(statecontents),
        ],
      ),
      state.person,
      registersubtext,
      state,
      statecontents,
    );
  }

  //==========================company detail widget==================
  Widget companydetailwidget(RegisterState statecontents, LoginState state) {
    return outerlayerwidget(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          companynamewidget(statecontents),
          companytypewidget(statecontents),
          aboutcompanywidget(statecontents),
          locationwidget(statecontents, state),
        ],
      ),

      companydetailtext,
      "",
      state,
      statecontents,
    );
  }

  //==========================workexperience widget==================
  Widget workexperiencewidget(RegisterState statecontents, LoginState state) {
    return MediaQuery.of(context).size.width < 800
        ? outerlayerwidget(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              jobtitlewidget(statecontents),
              workedcompanywidget(statecontents),
              iconbuttonstyle(context, coloredbutton, addicon, addbuttontext, (
                onfieldsubmit,
              ) {
                setState(() {
                  addbuttonaction(statecontents, workexpereiencetext);
                });
              }),
              displaydatawidget(
                context,
                List.generate(
                  statecontents.jobtitle.length,
                  (int index) =>
                      "${statecontents.jobtitle[index]} - ${statecontents.company[index]}",
                ),
                (item) {
                  setState(() {
                    displaybuttonaction(
                      statecontents,
                      workexpereiencetext,
                      item,
                    );
                  });
                },
              ),
            ],
          ),
          workexpereiencetext,
          "",
          state,
          statecontents,
        )
        : Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
              child: Text(
                workexpereiencetext,
                style: TextStyle(
                  fontSize: textsize6,
                  color: hexToColor(goldencolor),
                  fontFamily: headingfont,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Row(
              children: [
                jobtitlewidget(statecontents),
                workedcompanywidget(statecontents),
              ],
            ),
            iconbuttonstyle(context, coloredbutton, addicon, addbuttontext, (
              onfieldsubmit,
            ) {
              setState(() {
                addbuttonaction(statecontents, workexpereiencetext);
              });
            }),
            displaydatawidget(
              context,
              List.generate(
                statecontents.jobtitle.length,
                (int index) =>
                    "${statecontents.jobtitle[index]} - ${statecontents.company[index]}",
              ),
              (item) {
                setState(() {
                  displaybuttonaction(statecontents, workexpereiencetext, item);
                });
              },
            ),
          ],
        );
  }

  //==============================education widget====================
  Widget educationwidget(RegisterState statecontents, LoginState state) {
    return MediaQuery.of(context).size.width < 800
        ? outerlayerwidget(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              leveleducationwidget(statecontents),
              fieldeducationwidget(statecontents),
              iconbuttonstyle(context, coloredbutton, addicon, addbuttontext, (
                onfieldsubmit,
              ) {
                setState(() {
                  addbuttonaction(statecontents, educationtext);
                });
              }),
              displaydatawidget(
                context,
                List.generate(
                  statecontents.level.length,
                  (int index) =>
                      "${statecontents.level[index]} - ${statecontents.field[index]}",
                ),
                (item) {
                  setState(() {
                    displaybuttonaction(statecontents, educationtext, item);
                  });
                },
              ),
            ],
          ),

          educationtext,
          "",
          state,
          statecontents,
        )
        : Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
              child: Text(
                educationtext,
                style: TextStyle(
                  fontSize: textsize6,
                  color: hexToColor(goldencolor),
                  fontFamily: headingfont,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                leveleducationwidget(statecontents),
                fieldeducationwidget(statecontents),
              ],
            ),
            iconbuttonstyle(context, coloredbutton, addicon, addbuttontext, (
              onfieldsubmit,
            ) {
              setState(() {
                addbuttonaction(statecontents, educationtext);
              });
            }),
            displaydatawidget(
              context,
              List.generate(
                statecontents.level.length,
                (int index) =>
                    "${statecontents.level[index]} - ${statecontents.field[index]}",
              ),
              (item) {
                setState(() {
                  displaybuttonaction(statecontents, educationtext, item);
                });
              },
            ),
          ],
        );
  }

  //=============================Skill widget=========================
  Widget skillwidget(RegisterState statecontents, LoginState state) {
    return MediaQuery.of(context).size.width < 800
        ? outerlayerwidget(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              skillwidget1(statecontents),
              expyearwidget(statecontents),
              iconbuttonstyle(context, coloredbutton, addicon, addbuttontext, (
                onfieldsubmit,
              ) {
                setState(() {
                  addbuttonaction(statecontents, skilltext2);
                });
              }),
              displaydatawidget(
                context,
                List.generate(
                  statecontents.skill.length,
                  (int index) =>
                      "${statecontents.skill[index]} - ${statecontents.expyear[index]}",
                ),
                (item) {
                  setState(() {
                    displaybuttonaction(statecontents, skilltext2, item);
                  });
                },
              ),
            ],
          ),

          skilltext,
          "",
          state,
          statecontents,
        )
        : Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
              child: Text(
                skilltext,
                style: TextStyle(
                  fontSize: textsize6,
                  color: hexToColor(goldencolor),
                  fontFamily: headingfont,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                skillwidget1(statecontents),
                expyearwidget(statecontents),
              ],
            ),
            iconbuttonstyle(context, coloredbutton, addicon, addbuttontext, (
              onfieldsubmit,
            ) {
              setState(() {
                addbuttonaction(statecontents, skilltext2);
              });
            }),
            displaydatawidget(
              context,
              List.generate(
                statecontents.skill.length,
                (int index) =>
                    "${statecontents.skill[index]} - ${statecontents.expyear[index]}",
              ),
              (item) {
                setState(() {
                  displaybuttonaction(statecontents, skilltext2, item);
                });
              },
            ),
          ],
        );
  }

  //=============================language widget=========================
  Widget languagewidget(RegisterState statecontents, LoginState state) {
    return MediaQuery.of(context).size.width < 800
        ? outerlayerwidget(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              languagewidget1(statecontents),
              proficiencywidget(statecontents),
              iconbuttonstyle(context, coloredbutton, addicon, addbuttontext, (
                onfieldsubmit,
              ) {
                setState(() {
                  addbuttonaction(statecontents, languagetext);
                });
              }),
              displaydatawidget(
                context,
                List.generate(
                  statecontents.language.length,
                  (int index) =>
                      "${statecontents.language[index]} - ${statecontents.proficiency[index]}",
                ),
                (item) {
                  setState(() {
                    displaybuttonaction(statecontents, languagetext, item);
                  });
                },
              ),
            ],
          ),

          languagetext,
          "",
          state,
          statecontents,
        )
        : Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  languagestext,
                  style: TextStyle(
                    fontSize: textsize6,
                    color: hexToColor(goldencolor),
                    fontFamily: headingfont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                languagewidget1(statecontents),
                proficiencywidget(statecontents),
              ],
            ),
            iconbuttonstyle(context, coloredbutton, addicon, addbuttontext, (
              onfieldsubmit,
            ) {
              setState(() {
                addbuttonaction(statecontents, languagetext);
              });
            }),
            displaydatawidget(
              context,
              List.generate(
                statecontents.language.length,
                (int index) =>
                    "${statecontents.language[index]} - ${statecontents.proficiency[index]}",
              ),
              (item) {
                setState(() {
                  displaybuttonaction(statecontents, languagetext, item);
                });
              },
            ),
          ],
        );
  }

  //================================desired job title====================
  Widget desiredjobtitlewidget(RegisterState statecontents, LoginState state) {
    return MediaQuery.of(context).size.width < 800
        ? outerlayerwidget(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              minimumpaywidget(statecontents),
              payperiodwidget(statecontents),
              desiredjobwidget(statecontents),
              iconbuttonstyle(context, coloredbutton, addicon, addbuttontext, (
                onfieldsubmit,
              ) {
                setState(() {
                  addbuttonaction(statecontents, desiredjobtext);
                });
              }),
              displaydatawidget(context, statecontents.desiredjob, (item) {
                setState(() {
                  displaybuttonaction(statecontents, desiredjobtext, item);
                });
              }),
            ],
          ),

          jobpreferencetext,
          "",
          state,
          statecontents,
        )
        : Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
              child: Text(
                jobpreferencetext,
                style: TextStyle(
                  fontSize: textsize6,
                  color: hexToColor(goldencolor),
                  fontFamily: headingfont,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                minimumpaywidget(statecontents),
                payperiodwidget(statecontents),
              ],
            ),
            Row(children: [desiredjobwidget(statecontents)]),
            iconbuttonstyle(context, coloredbutton, addicon, addbuttontext, (
              onfieldsubmit,
            ) {
              setState(() {
                addbuttonaction(statecontents, desiredjobtext);
              });
            }),
            displaydatawidget(context, statecontents.desiredjob, (item) {
              setState(() {
                displaybuttonaction(statecontents, desiredjobtext, item);
              });
            }),
          ],
        );
  }

  //=================================desired jobschedule=================
  Widget desiredjobschedule(RegisterState statecontents, LoginState state) {
    return MediaQuery.of(context).size.width < 800
        ? outerlayerwidget(
          worksettingwidget(statecontents),
          worksettingtext,
          "",
          state,
          statecontents,
        )
        : Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
              child: Text(
                worksettingtext,
                style: TextStyle(
                  fontSize: textsize6,
                  color: hexToColor(goldencolor),
                  fontFamily: headingfont,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            worksettingwidget(statecontents),
            elevatedbuttonstyle(context, coloredbutton, registerbuttontext, (
              onfieldsubmit,
            ) {
              registeraction(context, state.person, statecontents);
            }),
          ],
        );
  }

  //===================Outer Layer widget=====================
  Widget outerlayerwidget(
    Widget widget,
    String heading,
    String subheading,
    LoginState state,
    RegisterState statecontents,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth:
              MediaQuery.of(context).size.width > 800
                  ? MediaQuery.of(context).size.width -
                      (MediaQuery.of(context).size.width / 8)
                  : MediaQuery.of(context).size.width < 800
                  ? double.infinity
                  : 390,
        ),
        child: Container(
          padding: EdgeInsets.only(left: 24, right: 24, bottom: 10),
          decoration: BoxDecoration(
            color: transparent,
            border: Border.all(color: hexToColor(goldencolor), width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: subheading.isNotEmpty ? 0 : 20,
                  left: 20,
                ),
                child: Text(
                  heading,
                  style: TextStyle(
                    fontSize: textsize6,
                    color: hexToColor(goldencolor),
                    fontFamily: headingfont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (subheading.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(bottom: 20, left: 20),
                  child: Text(
                    registersubtext,
                    style: TextStyle(
                      fontSize: textsize3,
                      color: hexToColor(goldencolor),
                      fontFamily: headingfont,
                    ),
                  ),
                ),
              widget,
            ],
          ),
        ),
      ),
    );
  }

  //=================name widget===============================
  Widget namewidget(RegisterState statecontents) {
    Widget innerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textwidget(context, nametext, 1),
        textboxwidget(
          context,
          statecontents.formKey1,
          statecontents.namecontroller,
          statecontents.box1Focus,
          1,
          1,
          nametext,
          namelabeltext,
          namehinttext,
          false,
          (passvisiblechange) {},
          (onfieldsubmit) {
            FocusScope.of(context).requestFocus(statecontents.box2Focus);
          },
        ),
      ],
    );
    return MediaQuery.of(context).size.width > 800
        ? Expanded(child: innerWidget)
        : innerWidget;
  }

  //========================Email widget===========================
  Widget emailwidget(RegisterState statecontents) {
    Widget innerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textwidget(context, emailtext, 1),
        textboxwidget(
          context,
          statecontents.formKey2,
          statecontents.mailcontroller,
          statecontents.box2Focus,
          1,
          1,
          emailtext,
          emaillabeltext,
          emailhinttext,
          false,
          (passvisiblechange) {},
          (onfieldsubmit) {
            FocusScope.of(context).requestFocus(statecontents.box3Focus);
          },
        ),
      ],
    );
    return MediaQuery.of(context).size.width > 800
        ? Expanded(child: innerWidget)
        : innerWidget;
  }

  //========================Password widget===========================
  Widget passwordwidget(RegisterState statecontents) {
    Widget innerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textwidget(context, passwordtext, 1),
        textboxwidget(
          context,
          statecontents.formKey3,
          statecontents.passwordcontroller,
          statecontents.box3Focus,
          1,
          1,
          passwordtext,
          passwordlabeltext,
          passwordhinttext,
          pasvisible,
          (passvisiblechange) {
            setState(() {
              pasvisible = !pasvisible;
            });
          },
          (onfieldsubmit) {
            FocusScope.of(context).requestFocus(statecontents.box4Focus);
          },
        ),
      ],
    );
    return MediaQuery.of(context).size.width > 800
        ? Expanded(child: innerWidget)
        : innerWidget;
  }

  //========================confirm password widget===========================
  Widget confirmpasswordwidget(RegisterState statecontents) {
    Widget innerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textwidget(context, confirmpasswordtext, 1),
        textboxwidget(
          context,
          statecontents.formKey4,
          statecontents.confirmpasswordcontroller,
          statecontents.box4Focus,
          1,
          1,
          confirmpasswordtext,
          confirmpasswordlabeltext,
          passwordhinttext,
          confirmpasvisible,
          (passvisiblechange) {
            setState(() {
              confirmpasvisible = !confirmpasvisible;
            });
          },
          (onfieldsubmit) {
            FocusScope.of(context).requestFocus(statecontents.box5Focus);
          },
        ),
      ],
    );
    return MediaQuery.of(context).size.width > 800
        ? Expanded(child: innerWidget)
        : innerWidget;
  }

  //========================company name widget===========================
  Widget companynamewidget(RegisterState statecontents) {
    Widget innerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textwidget(context, companytext, 1),
        textboxwidget(
          context,
          statecontents.formKey5,
          statecontents.companycontroller,
          statecontents.box5Focus,
          1,
          1,
          companytext,
          companylabeltext,
          companyhinttext,
          false,
          (passvisiblechange) {},
          (onfieldsubmit) {
            FocusScope.of(context).requestFocus(statecontents.box6Focus);
          },
        ),
      ],
    );
    return MediaQuery.of(context).size.width > 800
        ? Expanded(child: innerWidget)
        : innerWidget;
  }

  //=========================Company type widget==================
  Widget companytypewidget(RegisterState statecontents) {
    Widget innerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textwidget(context, companytypetext, 1),
        textboxwidget(
          context,
          statecontents.formKey6,
          statecontents.companytypecontroller,
          statecontents.box6Focus,
          1,
          1,
          companytypetext,
          companytypelabeltext,
          companytypehinttext,
          false,
          (passvisiblechange) {},
          (onfieldsubmit) {
            FocusScope.of(context).requestFocus(statecontents.box7Focus);
          },
        ),
      ],
    );
    return MediaQuery.of(context).size.width > 800
        ? Expanded(child: innerWidget)
        : innerWidget;
  }

  //===========================About company widget=====================
  Widget aboutcompanywidget(RegisterState statecontents) {
    Widget innerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textwidget(context, aboutcompanytext, 1),
        textboxwidget(
          context,
          statecontents.formKey7,
          statecontents.aboutcompanycontroller,
          statecontents.box7Focus,
          1,
          3,
          aboutcompanytext,
          aboutcompanylabeltext,
          aboutcompanyhinttext,
          false,
          (passvisiblechange) {},
          (onfieldsubmit) {
            FocusScope.of(context).requestFocus(statecontents.box8Focus);
          },
        ),
      ],
    );
    return MediaQuery.of(context).size.width > 800
        ? Expanded(child: innerWidget)
        : innerWidget;
  }

  //===========================Location widget=====================
  Widget locationwidget(RegisterState statecontents, LoginState state) {
    Widget innerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textwidget(context, locationtext, 1),
        textboxwidget(
          context,
          state.person == jobseekertext
              ? statecontents.formKey6
              : statecontents.formKey8,
          statecontents.locationcontroller,
          state.person == jobseekertext
              ? statecontents.box6Focus
              : statecontents.box8Focus,
          1,
          1,
          locationtext,
          locationlabeltext,
          locationhinttext,
          false,
          (passvisiblechange) {},
          (onfieldsubmit) async {
            if (state.person == jobseekertext) {
              Map items = await pickFileaction(context);
              setState(() {
                statecontents.resumecontroller.text = items[filenametext];
                statecontents.resumepdf = items[filebytetext];
              });
            } else {
              registeraction(context, state.person, statecontents);
            }
          },
        ),
      ],
    );
    return MediaQuery.of(context).size.width > 800
        ? Expanded(child: innerWidget)
        : innerWidget;
  }

  //===========================Phone widget=====================
  Widget phonewidget(RegisterState statecontents, LoginState state) {
    Widget innerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textwidget(context, phonetext, 1),
        textboxwidget(
          context,
          statecontents.formKey5,
          statecontents.phonecontroller,
          statecontents.box5Focus,
          1,
          1,
          phonetext,
          phonenolabeltext,
          phonehinttext,
          false,
          (passvisiblechange) {},
          (onfieldsubmit) {
            FocusScope.of(context).requestFocus(statecontents.box6Focus);
          },
        ),
      ],
    );
    return MediaQuery.of(context).size.width > 800
        ? Expanded(child: innerWidget)
        : innerWidget;
  }

  //===========================Resume widget=====================
  Widget resumewidget(RegisterState statecontents) {
    Widget innerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textwidget(context, resumetext, 1),
        Row(
          children: [
            iconbuttonstyle(
              context,
              onlyborderbutton,
              uploadicon,
              uploadbuttontext,
              (onfieldsubmit) async {
                Map items = await pickFileaction(context);
                setState(() {
                  statecontents.resumecontroller.text = items[filenametext];
                  statecontents.resumepdf = items[filebytetext];
                });
              },
            ),

            Text(
              statecontents.resumecontroller.text,
              style: TextStyle(
                fontSize: buttontextsize2,
                color:
                    AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                        ? black
                        : lighttheme,
                fontFamily: headingfont,
              ),
            ),
          ],
        ),
      ],
    );
    return innerWidget;
  }

  //======================Jobtitle widget=======================
  Widget jobtitlewidget(RegisterState statecontents) {
    Widget innerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textwidget(context, jobtitletext, 1),
        textboxwidget(
          context,
          statecontents.formKey7,
          statecontents.jobtitlecontroller,
          statecontents.box7Focus,
          1,
          1,
          jobtitletext,
          jobtitlelabeltext,
          jobtitlehinttext,
          false,
          (passvisiblechange) {},
          (onfieldsubmit) {
            FocusScope.of(context).requestFocus(statecontents.box8Focus);
          },
        ),
      ],
    );
    return MediaQuery.of(context).size.width > 800
        ? Expanded(child: innerWidget)
        : innerWidget;
  }

  //======================Worked Company widget=======================
  Widget workedcompanywidget(RegisterState statecontents) {
    Widget innerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textwidget(context, companytext, 0),
        textboxwidget(
          context,
          statecontents.formKey8,
          statecontents.companycontroller,
          statecontents.box8Focus,
          0,
          1,
          companytext,
          workedcompanylabeltext,
          workedcompanyhinttext,
          false,
          (passvisiblechange) {},
          (onfieldsubmit) {
            setState(() {
              addbuttonaction(statecontents, workexpereiencetext);
            });
          },
        ),
      ],
    );
    return MediaQuery.of(context).size.width > 800
        ? Expanded(child: innerWidget)
        : innerWidget;
  }

  //======================Level education widget=======================
  Widget leveleducationwidget(RegisterState statecontents) {
    Widget innerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textwidget(context, leveleducationtext, 1),
        textboxwidget(
          context,
          statecontents.formKey9,
          statecontents.levelcontroller,
          statecontents.box9Focus,
          1,
          1,
          leveleducationtext,
          leveleducationlabeltext,
          leveleducationhinttext,
          false,
          (passvisiblechange) {},
          (onfieldsubmit) {
            FocusScope.of(context).requestFocus(statecontents.box10Focus);
          },
        ),
      ],
    );
    return MediaQuery.of(context).size.width > 800
        ? Expanded(child: innerWidget)
        : innerWidget;
  }

  //======================Field education widget=======================
  Widget fieldeducationwidget(RegisterState statecontents) {
    Widget innerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textwidget(context, fieldstudytext, 1),
        textboxwidget(
          context,
          statecontents.formKey10,
          statecontents.fieldcontroller,
          statecontents.box10Focus,
          1,
          1,
          fieldstudytext,
          fieldlabeltext,
          fieldeducationhinttext,
          false,
          (passvisiblechange) {},
          (onfieldsubmit) {
            setState(() {
              addbuttonaction(statecontents, educationtext);
            });
          },
        ),
      ],
    );
    return MediaQuery.of(context).size.width > 800
        ? Expanded(child: innerWidget)
        : innerWidget;
  }

  //======================skill widget=======================
  Widget skillwidget1(RegisterState statecontents) {
    Widget innerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textwidget(context, skilltext2, 1),
        textboxwidget(
          context,
          statecontents.formKey11,
          statecontents.skillcontroller,
          statecontents.box11Focus,
          1,
          1,
          skilltext2,
          skilllabeltext,
          skillhinttext,
          false,
          (passvisiblechange) {},
          (onfieldsubmit) {
            FocusScope.of(context).requestFocus(statecontents.box12Focus);
          },
        ),
      ],
    );
    return MediaQuery.of(context).size.width > 800
        ? Expanded(child: innerWidget)
        : innerWidget;
  }

  //======================expyear widget=======================
  Widget expyearwidget(RegisterState statecontents) {
    Widget innerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textwidget(context, expyeartext, 0),
        textboxwidget(
          context,
          statecontents.formKey12,
          statecontents.yearcontroller,
          statecontents.box12Focus,
          0,
          1,
          expyeartext,
          expyearlabeltext,
          expyearhinttext,
          false,
          (passvisiblechange) {},
          (onfieldsubmit) {
            setState(() {
              addbuttonaction(statecontents, skilltext2);
            });
          },
        ),
      ],
    );
    return MediaQuery.of(context).size.width > 800
        ? Expanded(child: innerWidget)
        : innerWidget;
  }

  //======================language widget=======================
  Widget languagewidget1(RegisterState statecontents) {
    Widget innerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textwidget(context, languagetext, 1),
        textboxwidget(
          context,
          statecontents.formKey13,
          statecontents.langcontroller,
          statecontents.box13Focus,
          1,
          1,
          languagetext,
          langlabeltext,
          langhintext,
          false,
          (passvisiblechange) {},
          (onfieldsubmit) {
            FocusScope.of(context).requestFocus(statecontents.box17Focus);
          },
        ),
      ],
    );
    return MediaQuery.of(context).size.width > 800
        ? Expanded(child: innerWidget)
        : innerWidget;
  }

  //======================proficiency widget=======================
  Widget proficiencywidget(RegisterState statecontents) {
    Widget innerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textwidget(context, proficiencytext, 1),
        dropdownwidget(
          context,
          languageproficiencyitems,
          statecontents.proficiencycontroller,
          statecontents.box17Focus,
        ),
      ],
    );
    return MediaQuery.of(context).size.width > 800
        ? Expanded(child: innerWidget)
        : innerWidget;
  }

  //======================Minimum pay widget=======================
  Widget minimumpaywidget(RegisterState statecontents) {
    Widget innerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textwidget(context, "$paytext ( $currencysymbol )", 1),
        textboxwidget(
          context,
          statecontents.formKey15,
          statecontents.paycontroller,
          statecontents.box15Focus,
          1,
          1,
          minimumpayconsidertext,
          minimumpaylabeltext,
          minimumpayhinttext,
          false,
          (passvisiblechange) {},
          (onfieldsubmit) {
            FocusScope.of(context).requestFocus(statecontents.box18Focus);
          },
        ),
      ],
    );
    return MediaQuery.of(context).size.width > 800
        ? Expanded(child: innerWidget)
        : innerWidget;
  }

  //======================pay period widget=======================
  Widget payperiodwidget(RegisterState statecontents) {
    Widget innerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textwidget(context, payperiodtext, 1),
        dropdownwidget(
          context,
          payperioditems,
          statecontents.payperiodcontroller,
          statecontents.box18Focus,
        ),
      ],
    );
    return MediaQuery.of(context).size.width > 800
        ? Expanded(child: innerWidget)
        : innerWidget;
  }

  //======================Desired job widget=======================
  Widget desiredjobwidget(RegisterState statecontents) {
    Widget innerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textwidget(context, jobtitlestext, 1),
        textboxwidget(
          context,
          statecontents.formKey16,
          statecontents.desiredjobcontroller,
          statecontents.box16Focus,
          1,
          1,
          desiredjobtext,
          desiredjoblabeltext,
          desiredjobhinttext,
          false,
          (passvisiblechange) {},
          (onfieldsubmit) {
            setState(() {
              addbuttonaction(statecontents, desiredjobtext);
            });
          },
        ),
      ],
    );
    return MediaQuery.of(context).size.width > 800
        ? Expanded(child: innerWidget)
        : innerWidget;
  }

  //======================work setting widget=======================
  Widget worksettingwidget(RegisterState statecontents) {
    Widget innerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textwidget(context, desiredjobtypetext, 1),
        multiselectcheckboxwidget(
          context,
          jobtypeitems,
          statecontents.jobtype,
          (value, option) {
            setState(() {
              if (value == true) {
                statecontents.jobtype.add(option);
              } else {
                statecontents.jobtype.remove(option);
              }
            });
          },
        ),
        textwidget(context, desiredscheduletext, 1),
        multiselectcheckboxwidget(
          context,
          scheduleitems,
          statecontents.schedule,
          (value, option) {
            setState(() {
              if (value == true) {
                statecontents.schedule.add(option);
              } else {
                statecontents.schedule.remove(option);
              }
            });
          },
        ),

        textwidget(context, shiftstext, 1),
        multiselectcheckboxwidget(context, shiftitems, statecontents.shift, (
          value,
          option,
        ) {
          setState(() {
            if (value == true) {
              statecontents.shift.add(option);
            } else {
              statecontents.shift.remove(option);
            }
          });
        }),
        textwidget(context, worklocationtext, 1),
        multiselectcheckboxwidget(
          context,
          locationitems,
          statecontents.worklocation,
          (value, option) {
            setState(() {
              if (value == true) {
                statecontents.worklocation.add(option);
              } else {
                statecontents.worklocation.remove(option);
              }
            });
          },
        ),
      ],
    );
    return innerWidget;
  }
}
