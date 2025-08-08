// ignore_for_file: must_be_immutable

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_application/Controllers/Constants/GlobalConstants.dart';
import 'package:flutter_application/Controllers/Cubits/Pagination/HomeCubit.dart';
import 'package:flutter_application/Controllers/Cubits/ProfileCubit.dart';
import 'package:flutter_application/Controllers/Utilities/Actions.dart';
import 'package:flutter_application/Models/ApiModels.dart';
import 'package:flutter_application/Models/CubitModels/HomeState.dart';
import 'package:flutter_application/Models/CubitModels/PageState.dart';
import 'package:flutter_application/Models/CubitModels/ProfileState.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/View/Helpers/Iconcontents.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';
import 'package:flutter_application/View/Typography/CommonWidgets.dart';
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
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, statecontents) {
        return BlocBuilder<JobCubit, JobState>(
          builder: (context, state) {
            if (state is JobLoading && state is! JobLoaded) {
              return loading();
            } else if (state is JobLoaded) {
              return Column(
                children: [
                  searchbarwidget(context, statecontents),
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
                          } else if (state.jobs.isEmpty) {
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
      },
    );
  }

  //============================searchbar widget================================
  Widget searchbarwidget(BuildContext context, FilterState statecontents) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            flex: 1,
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

                prefixIcon: Icon(
                  searchicon,
                  color: hexToColor(goldencolor),
                  size: iconsize2,
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 5, top: 2, bottom: 2),
                  child: InkWell(
                    onTap: () {
                      searchaction(context, searchcontroller.text);
                    },
                    child: Container(
                      width: 60,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(right: 8, left: 8),
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
          ),
          IconButton(
            onPressed: () {
              filterbottomsheet(statecontents);
            },
            icon: Icon(
              filtericon,
              color: hexToColor(goldencolor),
              size: iconsize1,
            ),
          ),
        ],
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

  //==================filter work setting widget=======================
  Widget worksettingwidget(FilterState statecontents) {
    Widget innerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textwidget(context, jobtitlestext, 0),
        multiselectcheckboxwidget(
          context,
          locationitems,
          statecontents.desiredjob,
          (value, option) {
            setState(() {
              if (value == true) {
                statecontents.desiredjob.add(option);
              } else {
                statecontents.desiredjob.remove(option);
              }
            });
          },
        ),
        textwidget(context, desiredjobtypetext, 0),
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
        textwidget(context, desiredscheduletext, 0),
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

        textwidget(context, shiftstext, 0),
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
        textwidget(context, worklocationtext, 0),
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

  //=======================Filter Bottomsheet================
  void filterbottomsheet(FilterState statecontents) {
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                headerwidget(context, "Applied Filters", (a) {
                  closeaction(context);
                }),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textwidget(context, jobtitlestext, 0),
                    multiselectcheckboxwidget(
                      context,
                      statecontents.desiredjob,
                      statecontents.desiredjob,
                      (value, option) {
                        setState(() {
                          if (value == true) {
                            statecontents.desiredjob.add(option);
                          } else {
                            statecontents.desiredjob.remove(option);
                          }
                        });
                      },
                    ),
                    textwidget(context, desiredjobtypetext, 0),
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
                    textwidget(context, desiredscheduletext, 0),
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

                    textwidget(context, shiftstext, 0),
                    multiselectcheckboxwidget(
                      context,
                      shiftitems,
                      statecontents.shift,
                      (value, option) {
                        setState(() {
                          if (value == true) {
                            statecontents.shift.add(option);
                          } else {
                            statecontents.shift.remove(option);
                          }
                        });
                      },
                    ),
                    textwidget(context, worklocationtext, 0),
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
