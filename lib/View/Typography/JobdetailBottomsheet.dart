import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Controllers/Cubits/JobDetailCubit.dart';
import 'package:flutter_application/Controllers/Utilities/Actions.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/Models/ApiModels.dart';
import 'package:flutter_application/Models/CubitModels/JobDetailState.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_application/View/Helpers/Iconcontents.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';
import 'package:flutter_application/View/Typography/Loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class jobdetailBottomSheet {
  void mainwidget(BuildContext context) {
    showModalBottomSheet(
      backgroundColor:
          AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
              ? lighttheme
              : darktheme,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BlocBuilder<Jobdetailcubit, Jobdetailstate>(
          builder: (context, state) {
            if (state is detailshow) {
              return Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appbarwidget(context, state.jobid),
                      headerwidget(context, state.value),
                      Divider(thickness: 1, color: hexToColor(goldencolor)),
                      if (state.value.skills.isNotEmpty)
                        profilewidget(context, state.value),
                      if (state.value.skills.isNotEmpty)
                        Divider(thickness: 1, color: hexToColor(goldencolor)),
                      jobdetailwidget(
                        context,
                        state.value,
                        (state.value.workshift.isEmpty &&
                                state.value.workschedule.isNotEmpty)
                            ? [state.value.workschedule]
                            : (state.value.workshift.isNotEmpty &&
                                state.value.workschedule.isEmpty)
                            ? [state.value.workshift]
                            : [state.value.workshift, state.value.workschedule],
                      ),
                      if (state.value.benefits.isNotEmpty)
                        Divider(thickness: 1, color: hexToColor(goldencolor)),
                      if (state.value.benefits.isNotEmpty)
                        benefitswidget(context, state.value),
                      Divider(thickness: 1, color: hexToColor(goldencolor)),
                      descriptionwidget(context, state.value),
                      Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: buttonwidget(context, state.jobid),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is JobdetailError) {
              return errorwidget(context, state.message);
            } else if (state is JobdetailLoading && state is! detailshow) {
              return loading();
            } else {
              return SizedBox.shrink();
            }
          },
        );
      },
    );
  }

  //================================Appbar widget==========================
  appbarwidget(BuildContext context, String jobid) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            closeaction(context);
          },
          icon: Icon(
            closeicon,
            size: iconsize1,
            color:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black
                    : lighttheme,
          ),
        ),
        IconButton(
          onPressed: () {
            shareaction(context, jobid);
          },
          icon: Icon(
            shareicon,
            size: iconsize1,
            color:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black
                    : lighttheme,
          ),
        ),
      ],
    );
  }

  //==============================Button widget=============================
  buttonwidget(BuildContext context, String jobid) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: hexToColor(goldencolor),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        onPressed: () {
          reportjobaction(context, jobid);
        },
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              flagicon,
              size: iconsize2,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
            ),
            Text(
              reportjobbuttontext,
              style: TextStyle(
                fontSize: buttontextsize1,
                color:
                    AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                        ? black
                        : lighttheme,
                fontFamily: headingfont,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //================================Header widget===========================
  Widget headerwidget(BuildContext context, Jobdetailmodel value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10, top: 10),
          child: Text(
            value.jobtitle,
            style: TextStyle(
              fontSize: textsize6,
              color: hexToColor(goldencolor),
              fontFamily: headingfont,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          value.companyname,
          style: TextStyle(
            fontSize: textsize4,
            color:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black
                    : lighttheme,
            fontFamily: headingfont,
          ),
        ),
        Text(
          value.location,
          style: TextStyle(
            fontSize: textsize4,
            color:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black
                    : lighttheme,
            fontFamily: headingfont,
          ),
        ),
        if (value.worklocation.isNotEmpty)
          Text(
            value.worklocation,
            style: TextStyle(
              fontSize: textsize4,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
              fontFamily: headingfont,
            ),
          ),
      ],
    );
  }

  //===============================Profile widget=================
  Widget profilewidget(BuildContext context, Jobdetailmodel value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            profileinsighttext,
            style: TextStyle(
              fontSize: textsize5,
              color: hexToColor(goldencolor),
              fontFamily: headingfont,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          spacing: 10,
          children: [
            Icon(skillicon, color: hexToColor(goldencolor), size: iconsize7),
            Text(
              skilltext,
              style: TextStyle(
                fontSize: textsize2,
                color:
                    AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                        ? black
                        : lighttheme,
                fontFamily: headingfont,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Wrap(
            spacing: 8.0, // Space between items
            runSpacing: 8.0, // Space between rows
            children:
                value.skills.map((item) {
                  return Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: hexToColor(goldencolor).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: textsize1,
                        color:
                            AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.light
                                ? black
                                : lighttheme,
                        fontFamily: headingfont,
                      ),
                    ),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }

  //=============================Job detail widget=====================
  jobdetailwidget(BuildContext context, Jobdetailmodel value, List shiftlist) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          jobdetailtext,
          style: TextStyle(
            fontSize: textsize5,
            color: hexToColor(goldencolor),
            fontWeight: FontWeight.bold,
          ),
        ),
        if (value.jobtype.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(bottom: 10, top: 10),
            child: Row(
              spacing: 10,
              children: [
                Icon(
                  jobtypeicon,
                  color: hexToColor(goldencolor),
                  size: iconsize7,
                ),
                Text(
                  jobtypetext,
                  style: TextStyle(
                    fontSize: textsize2,
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
        if (value.jobtype.isNotEmpty)
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children:
                [value.jobtype].map((item) {
                  return Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: hexToColor(goldencolor).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: textsize1,
                        color:
                            AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.light
                                ? black
                                : lighttheme,
                        fontFamily: headingfont,
                      ),
                    ),
                  );
                }).toList(),
          ),
        if (value.workschedule.isNotEmpty || value.workshift.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(bottom: 10, top: 10),
            child: Row(
              spacing: 10,
              children: [
                Icon(
                  shifticon,
                  color: hexToColor(goldencolor),
                  size: iconsize7,
                ),
                Text(
                  shifttext,
                  style: TextStyle(
                    fontSize: textsize2,
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
        if (value.workschedule.isNotEmpty || value.workshift.isNotEmpty)
          Wrap(
            spacing: 8.0, // Space between items
            runSpacing: 8.0, // Space between rows
            children:
                shiftlist.map((item) {
                  return Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: hexToColor(goldencolor).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: textsize1,
                        color:
                            AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.light
                                ? black
                                : lighttheme,
                        fontFamily: headingfont,
                      ),
                    ),
                  );
                }).toList(),
          ),
        if (value.payscale.isNotEmpty && value.payperiod.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(bottom: 10, top: 10),
            child: Row(
              spacing: 10,
              children: [
                Icon(
                  currencyicon,
                  color: hexToColor(goldencolor),
                  size: iconsize7,
                ),

                Text(
                  paytext,
                  style: TextStyle(
                    fontSize: textsize2,
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
        if (value.payscale.isNotEmpty && value.payperiod.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Wrap(
              spacing: 8.0, // Space between items
              runSpacing: 8.0, // Space between rows
              children:
                  ["$currencysymbol ${value.payscale} ${value.payperiod}"].map((
                    item,
                  ) {
                    return Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: hexToColor(goldencolor).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: textsize1,
                          color:
                              AdaptiveTheme.of(context).mode ==
                                      AdaptiveThemeMode.light
                                  ? black
                                  : lighttheme,
                          fontFamily: headingfont,
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
      ],
    );
  }

  //=====================================benefits widget====================
  Widget benefitswidget(BuildContext context, Jobdetailmodel value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          benefitstext,
          style: TextStyle(
            fontSize: textsize5,
            color: hexToColor(goldencolor),
            fontFamily: headingfont,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Wrap(
            spacing: 8.0, // Space between items
            runSpacing: 8.0, // Space between rows
            children:
                value.benefits.map((item) {
                  return Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: hexToColor(goldencolor).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: textsize1,
                        color:
                            AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.light
                                ? black
                                : lighttheme,
                        fontFamily: headingfont,
                      ),
                    ),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }

  //================================description widget========================
  Widget descriptionwidget(BuildContext context, Jobdetailmodel value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fulljob,
          style: TextStyle(
            fontSize: textsize5,
            color: hexToColor(goldencolor),

            fontFamily: headingfont,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: RichText(
            text: TextSpan(
              text: companytypetext,
              style: TextStyle(
                fontSize: textsize4,
                color:
                    AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                        ? black
                        : lighttheme,
                fontFamily: headingfont,
              ),
              children: [
                TextSpan(
                  text: value.companytype,
                  style: TextStyle(
                    fontSize: textsize3,
                    color:
                        AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? black
                            : lighttheme,
                    fontFamily: headingfont,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10, top: 10),
          child: RichText(
            text: TextSpan(
              text: aboutcompanytext,
              style: TextStyle(
                fontSize: textsize4,
                color:
                    AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                        ? black
                        : lighttheme,
                fontFamily: headingfont,
              ),
              children: [
                TextSpan(
                  text: value.aboutcompany,
                  style: TextStyle(
                    fontSize: textsize3,
                    color:
                        AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? black
                            : lighttheme,
                    fontFamily: headingfont,
                  ),
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            responsibilitiestext,
            style: TextStyle(
              fontSize: textsize4,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
              fontFamily: headingfont,
            ),
          ),
        ),
        for (var i = 0; i < value.responsibilities.length; i++)
          RichText(
            text: TextSpan(
              text: bulletsymbol,
              style: TextStyle(
                fontSize: textsize3,
                color: hexToColor(goldencolor),
                fontFamily: headingfont,
              ),
              children: [
                TextSpan(
                  text: value.responsibilities[i],
                  style: TextStyle(
                    fontSize: textsize3,
                    color:
                        AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? black
                            : lighttheme,
                    fontFamily: headingfont,
                  ),
                ),
              ],
            ),
          ),
        Padding(
          padding: EdgeInsets.only(bottom: 10, top: 10),
          child: Text(
            requirementstext,
            style: TextStyle(
              fontSize: textsize4,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
              fontFamily: headingfont,
            ),
          ),
        ),
        for (var i = 0; i < value.requirements.length; i++)
          RichText(
            text: TextSpan(
              text: "➤ ",
              style: TextStyle(
                fontSize: textsize3,
                color: hexToColor(goldencolor),
                fontFamily: headingfont,
              ),
              children: [
                TextSpan(
                  text: value.requirements[i],
                  style: TextStyle(
                    fontSize: textsize3,
                    color:
                        AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? black
                            : lighttheme,
                    fontFamily: headingfont,
                  ),
                ),
              ],
            ),
          ),

        Padding(padding: EdgeInsets.only(bottom: 10)),
      ],
    );
  }
}
