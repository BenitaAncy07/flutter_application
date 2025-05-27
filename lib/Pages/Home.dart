import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_application/Helpers/Bottomsheet.dart';
import 'package:flutter_application/Helpers/Typography.dart';
import 'package:flutter_application/Helpers/Hexconversion.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: TextField(
            controller: searchcontroller,
            cursorColor: hexToColor("#D4AF37"),
            style: TextStyle(
              fontSize: 13,
              fontFamily: headingfont,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
            ),
            decoration: InputDecoration(
              hintText: "Enter job, company, locality or keywords",
              hintStyle: TextStyle(
                fontSize: 13,
                fontFamily: headingfont,
                color:
                    AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                        ? black.withOpacity(0.5)
                        : lighttheme.withOpacity(0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: hexToColor("#D4AF37"),
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: hexToColor("#D4AF37"),
                  width: 1.0,
                ),
              ),

              prefixIcon: Icon(
                Icons.search_outlined,
                color: hexToColor("#D4AF37"),
                size: 20,
              ),
            ),
            onChanged: (query) {
              print("Search query: $query");
            },
          ),
        ),
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
                          onTap: () {
                            showBottomSheet2(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
                                      "₹ 35,000 - ₹ 45,000 a month",
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
                                    SizedBox(height: 10),
                                    Row(
                                      spacing: 10,
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
                                          //  color:hexToColor("#D4AF37").withOpacity(0.7),
                                          child: Text(
                                            "Full-time",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color:
                                                  AdaptiveTheme.of(
                                                            context,
                                                          ).mode ==
                                                          AdaptiveThemeMode
                                                              .light
                                                      ? black
                                                      : lighttheme,
                                              fontFamily: headingfont,
                                            ),
                                          ),
                                        ),
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
                                            "Day shift",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color:
                                                  AdaptiveTheme.of(
                                                            context,
                                                          ).mode ==
                                                          AdaptiveThemeMode
                                                              .light
                                                      ? black
                                                      : lighttheme,
                                              fontFamily: headingfont,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ), //)
                                  ],
                                ),

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      iconSize: 20,
                                      onPressed: () {
                                        print("bookmark");
                                      },
                                      icon: Icon(
                                        Icons.bookmark_outline,
                                        color: hexToColor("#D4AF37"),
                                      ),
                                    ),
                                    IconButton(
                                      iconSize: 20,
                                      onPressed: () {
                                        print("block");
                                      },
                                      icon: Icon(
                                        Icons.block_outlined,
                                        color: hexToColor("#D4AF37"),
                                      ),
                                    ),
                                    SizedBox(height: 80),
                                  ],
                                ),
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
