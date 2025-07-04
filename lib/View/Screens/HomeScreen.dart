// ignore_for_file: must_be_immutable

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_application/Controllers/Cubits/Pagination/HomeCubit.dart';
import 'package:flutter_application/Controllers/Utilities/Actions.dart';
import 'package:flutter_application/Models/ApiModels.dart';
import 'package:flutter_application/Models/CubitModels/HomeState.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/View/Helpers/Iconcontents.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';
import 'package:flutter_application/View/Typography/Loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchcontroller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    homescreeninitial(context, _scrollController, searchcontroller.text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobCubit, JobState>(
      builder: (context, state) {
        if (state is JobLoading && state is! JobLoaded) {
          return loading();
        } else if (state is JobLoaded) {
          return Column(
            children: [
              searchbarwidget(context),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 20,
                  width: double.infinity,
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount:
                        state.jobs.length +
                        (state.hasMore ? 1 : 0), // Add 1 for loader
                    itemBuilder: (context, index) {
                      if (index < state.jobs.length) {
                        Jobmodel job = state.jobs[index];

                        return SizedBox(
                          width: MediaQuery.of(context).size.width - 10,
                          child: Card(
                            color:
                                AdaptiveTheme.of(context).mode ==
                                        AdaptiveThemeMode.light
                                    ? lighttheme
                                    : darktheme,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: hexToColor(goldencolor),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 4,
                            child: InkWell(
                              onTap: () {
                                jobviewaction(context, job.id);
                              },
                              child: IntrinsicHeight(
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      contentshowwidget(context, job),
                                      rightsidebuttonwidget(context),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return loading();
                      }
                    },
                  ),
                ),
              ),
            ],
          );
        } else if (state is JobError) {
          return errorwidget(context, state.message);
        } else {
          return SizedBox.shrink(); // or a fallback widget
        }
      },
    );
  }

  //============================searchbar widget================================
  Widget searchbarwidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: searchcontroller,
        cursorColor: hexToColor(goldencolor),
        style: TextStyle(
          fontSize: textsize3,
          fontFamily: headingfont,
          color:
              AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                  ? black
                  : lighttheme,
        ),
        decoration: InputDecoration(
          hintText: searchhinttext,
          hintStyle: TextStyle(
            fontSize: textsize3,
            fontFamily: headingfont,
            color:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black.withOpacity(0.5)
                    : lighttheme.withOpacity(0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: hexToColor(goldencolor), width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: hexToColor(goldencolor), width: 1.0),
          ),

          prefixIcon: Icon(
            searchicon,
            color: hexToColor(goldencolor),
            size: iconsize2,
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 5),
            child: InkWell(
              onTap: () {
                searchaction(context, searchcontroller.text);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.06,
                alignment: Alignment.center,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: hexToColor(goldencolor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  searchtext,
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
              ),
            ),
          ),
        ),
        onSubmitted: (value) {
          searchaction(context, searchcontroller.text);
        },
      ),
    );
  }

  //============================rightside button widget========================
  Widget rightsidebuttonwidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          iconSize: iconsize2,
          onPressed: () {
            savejobaction(context);
          },
          icon: Icon(saveicon, color: hexToColor(goldencolor)),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 80),
          child: IconButton(
            iconSize: iconsize2,
            onPressed: () {
              blockaction(context);
            },
            icon: Icon(blockicon, color: hexToColor(goldencolor)),
          ),
        ),
      ],
    );
  }

  //===========================Content show widget========================
  Widget contentshowwidget(BuildContext context, Jobmodel job) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            job.jobtitle,
            style: TextStyle(
              fontSize: textsize5,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
              fontFamily: headingfont,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        Text(
          job.companyname,
          style: TextStyle(
            fontSize: textsize3,
            color:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black
                    : lighttheme,
            fontFamily: headingfont,
          ),
        ),
        Text(
          job.location,
          style: TextStyle(
            fontSize: textsize3,
            color:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black
                    : lighttheme,
            fontFamily: headingfont,
          ),
        ),
        if (job.worklocation.isNotEmpty)
          Text(
            job.worklocation,
            style: TextStyle(
              fontSize: textsize3,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
              fontFamily: headingfont,
            ),
          ),
        if (job.payscale.isNotEmpty)
          Text(
            "$currencysymbol ${job.payscale} ${job.payperiod}",
            style: TextStyle(
              fontSize: textsize3,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
              fontFamily: headingfont,
            ),
          ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            spacing: 10,
            children: [
              if (job.jobtype.isNotEmpty)
                Container(
                  padding: EdgeInsets.fromLTRB(8, 1, 8, 1),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: hexToColor(goldencolor),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(3),
                  ),

                  child: Text(
                    job.jobtype,
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
                ),
              if (job.workshift.isNotEmpty)
                Container(
                  padding: EdgeInsets.fromLTRB(8, 1, 8, 1),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: hexToColor(goldencolor),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Text(
                    job.workshift,
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
                ),
            ],
          ),
        ),
      ],
    );
  }
}
