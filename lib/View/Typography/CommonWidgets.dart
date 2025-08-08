//==============================Header widget===========================
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/Controllers/Constants/Appconstants.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';
import 'package:flutter_application/Controllers/Cubits/RegisterCubit.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/Models/AppUImodels.dart';
import 'package:flutter_application/Models/CubitModels/PageState.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_application/View/Helpers/Iconcontents.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget headerwidget(BuildContext context, String heading, a) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              a(true);
            },
            icon: Icon(
              size: iconsize2,
              closeicon,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            heading.toUpperCase(),
            style: TextStyle(
              fontSize: textsize5,
              color: hexToColor(goldencolor),
              fontFamily: headingfont,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      Divider(thickness: 1, color: hexToColor(goldencolor)),
    ],
  );
}

//====================================Text widget=======================
Widget textwidget(BuildContext context, String heading, int starrequired) {
  return RichText(
    text: TextSpan(
      text: heading,
      style: TextStyle(
        fontSize: textsize5,
        color:
            AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                ? black
                : lighttheme,
        fontFamily: headingfont,
        fontWeight: FontWeight.bold,
      ),
      children: [
        if (starrequired == 1)
          TextSpan(
            text: ' *',
            style: TextStyle(
              fontSize: textsize3,
              color: red,
              fontFamily: headingfont,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    ),
  );
}

//=====================================Widget dropdown=======================
Widget dropdownwidget(
  BuildContext context,
  List<String> dropdownitems,
  TextEditingController textbox2controller,
  FocusNode boxfocus,
) {
  return Container(
    padding: EdgeInsets.all(10),

    child: DropdownButtonFormField<String>(
      value: textbox2controller.text, // Default selected value
      iconEnabledColor: hexToColor(goldencolor),
      focusNode: boxfocus,
      items:
          dropdownitems.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: textsize3,
                  fontFamily: headingfont,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? black
                          : lighttheme,
                ),
              ),
            );
          }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          textbox2controller.text = newValue;
        }
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: hexToColor(goldencolor), width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: hexToColor(goldencolor), width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: red, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: red, width: 1.2),
        ),
      ),
    ),
  );
}

//=====================================Multiselect widget==================
Widget multiselectcheckboxwidget(
  BuildContext context,
  List<String> dropdownitems,
  List contents,
  a,
) {
  return Padding(
    padding: EdgeInsets.only(top: 10),
    child: Wrap(
      children:
          dropdownitems.map((option) {
            return Row(
              spacing: 10,
              children: [
                Checkbox(
                  side: BorderSide(color: hexToColor(goldencolor), width: 2),
                  activeColor: hexToColor(goldencolor),
                  value: contents.contains(option),
                  onChanged: (bool? value) {
                    a(value, option);
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      option,
                      style: TextStyle(
                        fontSize: textsize5,
                        color:
                            AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.light
                                ? black
                                : lighttheme,
                        fontFamily: headingfont,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
    ),
  );
}

//=====================================Widget displaydata===================
Widget displaydatawidget(BuildContext context, List contents, a) {
  return Wrap(
    spacing: 8.0, // Space between items horizontally
    runSpacing: 8.0, // Space between rows
    children:
        contents.map((item) {
          return Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: hexToColor(goldencolor).withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.split("~")[0],
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

                IconButton(
                  onPressed: () {
                    a(item);
                  },
                  icon: Icon(
                    deleteicon,
                    color:
                        AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? black
                            : lighttheme,
                    size: iconsize5,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
  );
}

//=================================Textbox widget==================
Widget textboxwidget(
  BuildContext context,
  _formKey,
  TextEditingController textbox1controller,
  FocusNode box1Focus,
  int starrequired,
  int maxline,
  String fieldname,
  String labeltext,
  String hinttext,
  bool visiblity,
  visiblechange,
  fieldsubmit,
) {
  return BlocBuilder<RegisterCubit, RegisterState>(
    builder: (context, statecontents) {
      return Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: TextFormField(
            controller: textbox1controller,
            focusNode: box1Focus,
            onFieldSubmitted: (_) {
              fieldsubmit(true);
            },
            keyboardType:
                (fieldname == phonetext || fieldname == minimumpayconsidertext)
                    ? TextInputType.number
                    : null,
            inputFormatters: [
              if (fieldname == phonetext)
                FilteringTextInputFormatter.allow(phoneRegex),
              if (fieldname == minimumpayconsidertext)
                FilteringTextInputFormatter.allow(payRegex),
            ],

            textInputAction: TextInputAction.next,
            maxLines: maxline,
            obscureText:
                (fieldname == passwordtext || fieldname == confirmpasswordtext)
                    ? !visiblity
                    : false,
            cursorColor: hexToColor(goldencolor),
            maxLength:
                (fieldname == passwordtext || fieldname == confirmpasswordtext)
                    ? 8
                    : null,
            style: TextStyle(
              fontSize: textsize3,
              fontFamily: headingfont,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
            ),
            decoration: InputDecoration(
              counterText: '',
              suffixIcon:
                  (fieldname == passwordtext ||
                          fieldname == confirmpasswordtext)
                      ? IconButton(
                        onPressed: () {
                          visiblechange(true);
                        },
                        icon: Icon(
                          visiblity ? visibleicon : visibilityofficon,
                          color: hexToColor(goldencolor),
                          size: iconsize5,
                        ),
                      )
                      : null,
              labelText: labeltext,
              hintText: hinttext,
              hintStyle: TextStyle(
                fontSize: textsize1,
                fontFamily: headingfont,
                color:
                    AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                        ? black.withOpacity(0.3)
                        : lighttheme.withOpacity(0.3),
                fontStyle: FontStyle.italic,
              ),
              labelStyle: TextStyle(
                fontSize: textsize1,
                fontFamily: headingfont,
                color: hexToColor(goldencolor),

                fontStyle: FontStyle.italic,
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
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: red, width: 1.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: red, width: 1.2),
              ),
            ),
            onChanged: (value) {
              _formKey.currentState!.validate();
            },
            validator: (value) {
              if (starrequired == 1 && (value == null || value.isEmpty)) {
                return requiredfieldtext;
              }
              if (fieldname == emailtext && !emailRegex.hasMatch(value!)) {
                return validemailtext;
              }
              if ((fieldname == passwordtext ||
                      fieldname == confirmpasswordtext) &&
                  !passwordregex.hasMatch(value!)) {
                return strongpasswordtext;
              }

              if (fieldname == confirmpasswordtext &&
                  statecontents.confirmpasswordcontroller.text !=
                      statecontents.passwordcontroller.text) {
                return passwordnomatchtext;
              }

              return null;
            },
          ),
        ),
      );
    },
  );
}

//=====================================One Select Widget=====================
Widget oneselectcheckwidget(
  BuildContext context,
  List<Profile_page_items1> profilesettinglist,
  statecontent,
  int i,
  a,
) {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
    child: Container(
      alignment: Alignment.center,

      padding: EdgeInsets.fromLTRB(8, 1, 8, 1),
      decoration: BoxDecoration(
        border: Border.all(color: hexToColor(goldencolor), width: 1),
        borderRadius: BorderRadius.circular(3),
      ),

      child: Column(
        children: [
          ListTile(
            leading: Icon(
              profilesettinglist[i].icon,
              size: iconsize3,
              color: hexToColor(goldencolor),
            ),

            title: Text(
              profilesettinglist[i].heading,
              style: TextStyle(
                fontSize: textsize5,
                color: hexToColor(goldencolor),

                fontFamily: headingfont,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Radio<int>(
              value: i,
              fillColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return hexToColor(goldencolor);
                }
                return hexToColor(goldencolor);
              }),
              groupValue: statecontent.selectedindex,
              onChanged: (int? value) {
                a(value);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20, left: 20, bottom: 15),
            child: Wrap(
              children: [
                Text(
                  profilesettinglist[i].content,
                  style: TextStyle(
                    fontSize: textsize2,
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
        ],
      ),
    ),
  );
}

//===============================Save button widget====================
Widget savebuttonwidget(BuildContext context, a) {
  return Column(
    children: [
      Divider(thickness: 1, color: hexToColor(goldencolor)),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: hexToColor(goldencolor),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          onPressed: () {
            a(true);
          },
          child: Text(
            savebuttontext,
            style: TextStyle(
              fontSize: buttontextsize1,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
              fontFamily: headingfont,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );
}
