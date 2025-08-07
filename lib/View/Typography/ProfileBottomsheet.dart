// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'package:adaptive_theme/adaptive_theme.dart';

import 'package:flutter_application/Controllers/Cubits/ProfileCubit.dart';
import 'package:flutter_application/Controllers/Utilities/Actions.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/Models/CubitModels/PageState.dart';
import 'package:flutter_application/Controllers/Constants/Appconstants.dart';
import 'package:flutter_application/Models/AppUImodels.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_application/View/Helpers/Iconcontents.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_application/View/Typography/CommonWidgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profilebottomsheet {
  void settingBottomSheet1(
    BuildContext context,
    String jobseekerid,
    int openprofilevalue,
  ) {
    showModalBottomSheet(
      isDismissible: false,
      backgroundColor:
          AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
              ? lighttheme
              : darktheme,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BlocBuilder<ProfilesettingCubit, ProfileState>(
          builder: (context, statecontent) {
            return Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  headerwidget(context, profilesetting, (a) {
                    closeaction(context);

                    context.read<ProfilesettingCubit>().indexchange(
                      openprofilevalue,
                    );
                  }),

                  for (int i = 0; i < profilesettinglist.length; i++)
                    oneselectcheckwidget(
                      context,
                      profilesettinglist,
                      statecontent,
                      i,
                      (value) {
                        profilesettingchange(context, value!, jobseekerid);
                      },
                    ),
                  savebuttonwidget(context, (a) {
                    saveprofiledata(
                      context,
                      profilesetting,
                      jobseekerid,
                      statecontent.selectedindex,
                    );
                  }),
                ],
              ),
            );
          },
        );
      },
    );
  }

  //==========================================Bottomsheet 2====================================
  void profile_bottomSheet2(
    BuildContext context,
    qualification_items item1,
    List contents,
    List starrequired,
    String heading,
    String jobseekerid,
  ) {
    final _formKey1 = GlobalKey<FormState>();
    final _formKey = GlobalKey<FormState>();
    FocusNode box1Focus = FocusNode();
    FocusNode box2Focus = FocusNode();
    TextEditingController textbox1controller = TextEditingController();
    TextEditingController textbox2controller = TextEditingController();
    showModalBottomSheet(
      isDismissible: false,
      backgroundColor:
          AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
              ? lighttheme
              : darktheme,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              headerwidget(context, item1.heading, (a) {
                closeaction(context);
              }),
              displaydatawidget(context, contents, (item) {
                profiledetaildelete(
                  context,
                  heading,
                  item.split("~")[1],
                  jobseekerid,
                );
              }),

              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textwidget(context, item1.textbox1, starrequired[0]),
                    textboxwidget(
                      context,
                      _formKey,
                      textbox1controller,
                      box1Focus,
                      starrequired[0],
                      1,
                      item1.textbox1,
                      "",
                      "",
                      false,
                      (passvisiblechange) {},
                      (a) {
                        FocusScope.of(context).requestFocus(box2Focus);
                      },
                    ),

                    textwidget(context, item1.textbox2, starrequired[1]),

                    textboxwidget(
                      context,
                      _formKey1,
                      textbox2controller,
                      box2Focus,
                      starrequired[1],
                      1,
                      item1.textbox2,
                      "",
                      "",
                      false,
                      (passvisiblechange) {},
                      (a) {
                        if (_formKey.currentState!.validate() &&
                            _formKey1.currentState!.validate()) {
                          saveprofiledata(context, heading, jobseekerid, [
                            textbox1controller.text,
                            textbox2controller.text,
                          ]);
                        }
                      },
                    ),
                  ],
                ),
              ),
              savebuttonwidget(context, (a) {
                if (_formKey.currentState!.validate() &&
                    _formKey1.currentState!.validate()) {
                  saveprofiledata(context, heading, jobseekerid, [
                    textbox1controller.text,
                    textbox2controller.text,
                  ]);
                }
              }),
            ],
          ),
        );
      },
    );
  }

  //===============================Bottomsheet 3=====================
  void profile_bottomsheet3(
    BuildContext context,
    qualification_items item1,
    List starrequired,
    List<String> options,
    List<String> options1,
    List<String> selectedOptions,
    String jobseekerid,
  ) {
    showModalBottomSheet(
      isDismissible: false,
      backgroundColor:
          AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
              ? lighttheme
              : darktheme,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  headerwidget(context, item1.heading, (a) {
                    closeaction(context);
                  }),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textwidget(context, item1.textbox1, starrequired[0]),
                        multiselectcheckboxwidget(
                          context,
                          options,
                          selectedOptions,
                          (value, option) {
                            setState(() {
                              if (value == true) {
                                selectedOptions.add(option);
                              } else {
                                selectedOptions.remove(option);
                              }
                            });
                          },
                        ),

                        textwidget(context, item1.textbox2, starrequired[1]),
                        multiselectcheckboxwidget(
                          context,
                          options1,
                          selectedOptions,
                          (value, option) {
                            setState(() {
                              if (value == true) {
                                selectedOptions.add(option);
                              } else {
                                selectedOptions.remove(option);
                              }
                            });
                          },
                        ),
                        savebuttonwidget(context, (a) {
                          selectedOptions =
                              selectedOptions
                                  .where((e) => e.isNotEmpty)
                                  .toList();
                          saveprofiledata(context, item1.heading, jobseekerid, [
                            selectedOptions.isEmpty
                                ? ""
                                : selectedOptions
                                    .where((e) => e.contains("shift"))
                                    .toList()
                                    .join("#"),
                            selectedOptions.isEmpty
                                ? ""
                                : selectedOptions
                                    .where((e) => !e.contains("shift"))
                                    .toList()
                                    .join("#"),
                          ]);
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  //==========================================Bottomsheet 4====================================
  void profile_bottomSheet4(
    BuildContext context,
    qualification_items item1,
    List contents,
    List starrequired,
    String heading,
    String jobseekerid,
    List<String> dropdownitems,
  ) {
    final _formKey = GlobalKey<FormState>();
    ;
    FocusNode box1Focus = FocusNode(), box2Focus = FocusNode();
    TextEditingController textbox1controller = TextEditingController(
      text: heading == minimumpaytext ? contents[0].split(" ")[1] : "",
    );
    TextEditingController textbox2controller = TextEditingController(
      text:
          heading == minimumpaytext
              ? contents[0].split(" ")[2] + " " + contents[0].split(" ")[3]
              : dropdownitems[0],
    );
    showModalBottomSheet(
      isDismissible: false,
      backgroundColor:
          AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
              ? lighttheme
              : darktheme,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              headerwidget(context, item1.heading, (a) {
                closeaction(context);
              }),
              if (heading != minimumpaytext)
                displaydatawidget(context, contents, (item) {
                  profiledetaildelete(
                    context,
                    heading,
                    item.split("~")[1],
                    jobseekerid,
                  );
                }),

              if (heading == minimumpaytext)
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: hexToColor(goldencolor).withOpacity(0.2),
                    ),
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Row(
                      spacing: 10,
                      children: [
                        Icon(
                          visibilityofficon,
                          color: hexToColor(goldencolor),
                          size: 13,
                        ),

                        Text(
                          employersnoseetext,
                          style: TextStyle(
                            fontSize: textsize3,
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
                ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textwidget(context, item1.textbox1, starrequired[0]),
                    textboxwidget(
                      context,
                      _formKey,
                      textbox1controller,
                      box1Focus,
                      starrequired[0],
                      1,
                      item1.textbox1,
                      "",
                      "",
                      false,
                      (passvisiblechange) {},
                      (a) {
                        FocusScope.of(context).requestFocus(box2Focus);
                      },
                    ),
                    textwidget(context, item1.textbox2, starrequired[1]),

                    dropdownwidget(
                      context,
                      dropdownitems,
                      textbox2controller,
                      box2Focus,
                    ),
                  ],
                ),
              ),
              savebuttonwidget(context, (a) {
                if (_formKey.currentState!.validate()) {
                  saveprofiledata(context, heading, jobseekerid, [
                    textbox1controller.text,
                    textbox2controller.text,
                  ]);
                }
              }),
            ],
          ),
        );
      },
    );
  }

  //===================================Bottomsheet 5==========================
  void profile_bottomSheet5(
    BuildContext context,
    qualification_items item1,
    List contents,
    List starrequired,
    String heading,
    String jobseekerid,
  ) {
    final _formKey = GlobalKey<FormState>();
    FocusNode box1Focus = FocusNode();
    TextEditingController textbox1controller = TextEditingController();

    showModalBottomSheet(
      isDismissible: false,
      backgroundColor:
          AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
              ? lighttheme
              : darktheme,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              headerwidget(context, item1.heading, (a) {
                closeaction(context);
              }),

              displaydatawidget(context, contents, (item) {
                profiledetaildelete(
                  context,
                  heading,
                  item.split("~")[1],
                  jobseekerid,
                );
              }),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textwidget(context, item1.textbox1, starrequired[0]),

                    textboxwidget(
                      context,
                      _formKey,
                      textbox1controller,
                      box1Focus,
                      starrequired[0],
                      1,
                      item1.textbox1,
                      "",
                      "",
                      false,
                      (passvisiblechange) {},
                      (a) {
                        if (_formKey.currentState!.validate()) {
                          saveprofiledata(
                            context,
                            heading,
                            jobseekerid,
                            textbox1controller.text,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              savebuttonwidget(context, (a) {
                if (_formKey.currentState!.validate()) {
                  saveprofiledata(
                    context,
                    heading,
                    jobseekerid,
                    textbox1controller.text,
                  );
                }
              }),
            ],
          ),
        );
      },
    );
  }

  //=====================================Bottomsheet 6=======================
  void profile_bottomSheet6(
    BuildContext context,
    qualification_items item1,
    List contents,
    String jobseekerid,
    List<String> dropdownitems,
  ) {
    showModalBottomSheet(
      isDismissible: false,
      backgroundColor:
          AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
              ? lighttheme
              : darktheme,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  headerwidget(context, item1.heading, (a) {
                    closeaction(context);
                  }),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textwidget(context, item1.textbox1, 1),
                        multiselectcheckboxwidget(
                          context,
                          dropdownitems,
                          contents,
                          (value, option) {
                            setState(() {
                              if (value == true) {
                                contents.add(option);
                              } else {
                                contents.remove(option);
                              }
                            });
                          },
                        ),
                        savebuttonwidget(context, (a) {
                          contents =
                              contents.where((e) => e.isNotEmpty).toList();
                          saveprofiledata(
                            context,
                            item1.heading,
                            jobseekerid,
                            contents.isEmpty ? "" : contents.join("#"),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
