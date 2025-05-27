import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_application/Helpers/Hexconversion.dart';
import 'package:flutter_application/Helpers/Sessions.dart';
import 'package:flutter_application/Helpers/Typography.dart';
import 'package:flutter_application/Helpers/Bottomsheet.dart';

class MyJobs extends StatefulWidget {
  const MyJobs({super.key});

  @override
  State<MyJobs> createState() => _MyJobsState();
}

class _MyJobsState extends State<MyJobs> {
  int selectedindex = 1;
  List<String> options = [
        "Saved", "Applied", // "Interviews",
        "Archived",
      ],
      optioncount = [
        "10", "10", //"20",
        "30",
      ],
      nocontent_img = [
        "no_saved_jobs.png",
        "No_jobs_applied.png",
        // "no_interviews.png",
        "no_archived_jobs.png",
      ],
      nocontent_text = [
        "No jobs saved yet",
        "No jobs applied yet",
        //  "No interviews yet",
        "Nothing yet",
      ],
      nocontent_text1 = [
        "Jobs you save appear here",
        "Jobs you applied appear here",
        // "Scheduled interviews appear here",
        "Applications you archive appear here",
      ];
  List<Update_Status_items> update_status = [
    Update_Status_items(
      "Interviewing",
      Colors.green.shade900,
      Icons.calendar_month,
    ),
    Update_Status_items(
      "Offer received",
      Colors.green.shade900,
      Icons.thumb_up,
    ),
    Update_Status_items("Hired", Colors.green.shade900, Icons.person),
    Update_Status_items(
      "Not selected by employer",
      Colors.red.shade900,
      Icons.close,
    ),
    Update_Status_items(
      "No longer interested",
      Colors.red.shade900,
      Icons.thumb_down,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: options.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () async {
                  setState(() {
                    selectedindex = index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Column(
                    children: [
                      Text(
                        optioncount[index],
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              index == selectedindex
                                  ? hexToColor("#D4AF37")
                                  : AdaptiveTheme.of(context).mode ==
                                      AdaptiveThemeMode.light
                                  ? black
                                  : lighttheme,
                          fontFamily: headingfont,
                          fontWeight:
                              index == selectedindex ? FontWeight.bold : null,
                        ),
                      ),
                      Text(
                        options[index],
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              index == selectedindex
                                  ? hexToColor("#D4AF37")
                                  : AdaptiveTheme.of(context).mode ==
                                      AdaptiveThemeMode.light
                                  ? black
                                  : lighttheme,
                          fontFamily: headingfont,
                          fontWeight:
                              index == selectedindex ? FontWeight.bold : null,
                        ),
                      ),
                      Divider(
                        color: hexToColor("#D4AF37"),
                        thickness: index == selectedindex ? 2 : 1,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        if (optioncount[selectedindex] == "0")
          Center(
            child: Column(
              children: [
                Image.asset("assets/images/${nocontent_img[selectedindex]}"),
                Text(
                  nocontent_text[selectedindex],
                  style: TextStyle(
                    fontSize: 15,
                    color:
                        AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? black
                            : lighttheme,
                    fontFamily: headingfont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  nocontent_text1[selectedindex],
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? black
                            : lighttheme,
                    fontFamily: headingfont,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: hexToColor(
                      "#D4AF37",
                    ), // Button background color
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ), // Button padding
                  ),
                  onPressed: () {},
                  child: Text(
                    "Find jobs",
                    style: TextStyle(
                      fontSize: 13,
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
              ],
            ),
          ),
        if (optioncount[selectedindex] != "0")
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 20,
              width: double.infinity,
              child: ListView.builder(
                itemCount: 10, // Number of items
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 10,
                        child: Card(
                          color:
                              AdaptiveTheme.of(context).mode ==
                                      AdaptiveThemeMode.light
                                  ? lighttheme
                                  : darktheme,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: hexToColor("#D4AF37"), // Border color
                              width: 1, // Border width
                            ),
                            borderRadius: BorderRadius.circular(
                              8,
                            ), // Rounded corners
                          ),
                          elevation: 4, // Adds a shadow effect
                          child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.fromLTRB(
                                          8,
                                          1,
                                          8,
                                          1,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: hexToColor("#D4AF37"),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            3,
                                          ),
                                        ),
                                        child: Text(
                                          "Application viewed",
                                          style: TextStyle(
                                            fontSize: 11,
                                            color:
                                                AdaptiveTheme.of(
                                                          context,
                                                        ).mode ==
                                                        AdaptiveThemeMode.light
                                                    ? black
                                                    : lighttheme,
                                            fontFamily: headingfont,
                                          ),
                                        ),
                                      ),

                                      IconButton(
                                        iconSize: 20,
                                        onPressed: () {
                                          showBottomSheet1(context, [
                                            if (options[selectedindex] ==
                                                "Applied")
                                              Update_Status_items(
                                                "Archive",
                                                Colors.green.shade900,
                                                Icons.archive,
                                              ),
                                            if (options[selectedindex] ==
                                                "Archived")
                                              Update_Status_items(
                                                "Unarchive",
                                                Colors.green.shade900,
                                                Icons.unarchive,
                                              ),
                                            if (options[selectedindex] ==
                                                "Applied")
                                              Update_Status_items(
                                                "Withdraw application",
                                                Colors.red.shade900,
                                                Icons.remove,
                                              ),
                                            Update_Status_items(
                                              "Report job",
                                              Colors.red.shade900,
                                              Icons.flag,
                                            ),
                                          ], "more option");
                                        },
                                        icon: Icon(
                                          Icons.more_vert,
                                          color: hexToColor("#D4AF37"),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'SENIOR FLUTTER DEVELOPER ',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          AdaptiveTheme.of(context).mode ==
                                                  AdaptiveThemeMode.light
                                              ? black
                                              : lighttheme,
                                      fontFamily: headingfont,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(height: 10),
                                  Text(
                                    "Anjita It Solutions Pvt Ltd",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color:
                                          AdaptiveTheme.of(context).mode ==
                                                  AdaptiveThemeMode.light
                                              ? black
                                              : lighttheme,
                                      fontFamily:
                                          headingfont, // fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    "Mumbai,Maharastra",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color:
                                          AdaptiveTheme.of(context).mode ==
                                                  AdaptiveThemeMode.light
                                              ? black
                                              : lighttheme,
                                      fontFamily: headingfont,
                                    ),
                                  ),
                                  Text(
                                    "Remote",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color:
                                          AdaptiveTheme.of(context).mode ==
                                                  AdaptiveThemeMode.light
                                              ? black
                                              : lighttheme,
                                      fontFamily: headingfont,
                                    ),
                                  ),
                                  Text(
                                    "Applied on 10 Apr",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color:
                                          AdaptiveTheme.of(context).mode ==
                                                  AdaptiveThemeMode.light
                                              ? black.withOpacity(0.5)
                                              : lighttheme.withOpacity(0.5),
                                      fontFamily: headingfont,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  if (options[selectedindex] != "Archived")
                                    InkWell(
                                      onTap: () {
                                        showBottomSheet1(
                                          context,
                                          update_status,
                                          "",
                                        );
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width *
                                            0.85,
                                        padding: EdgeInsets.fromLTRB(
                                          8,
                                          1,
                                          8,
                                          1,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: hexToColor("#D4AF37"),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            3,
                                          ),
                                        ),

                                        child: Text(
                                          options[selectedindex] == "Saved"
                                              ? "Apply now"
                                              : "Update status",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color:
                                                AdaptiveTheme.of(
                                                          context,
                                                        ).mode ==
                                                        AdaptiveThemeMode.light
                                                    ? black
                                                    : lighttheme,
                                            fontFamily: headingfont,
                                          ),
                                        ),
                                      ),
                                    ),

                                  SizedBox(height: 10),

                                  Container(
                                    color: hexToColor(
                                      "#D4AF37",
                                    ).withOpacity(0.3),
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width *
                                        0.85,
                                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),

                                    child: Row(
                                      spacing: 10,
                                      children: [
                                        Icon(
                                          Icons.block,
                                          color:
                                              AdaptiveTheme.of(context).mode ==
                                                      AdaptiveThemeMode.light
                                                  ? black
                                                  : lighttheme,
                                          size: 13,
                                        ),
                                        Text(
                                          "Job closed or expired",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                AdaptiveTheme.of(
                                                          context,
                                                        ).mode ==
                                                        AdaptiveThemeMode.light
                                                    ? black
                                                    : lighttheme,
                                            fontFamily: headingfont,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}
