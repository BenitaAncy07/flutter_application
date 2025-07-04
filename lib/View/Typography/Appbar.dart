// ignore_for_file: use_build_context_synchronously

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_application/Controllers/Cubits/PageCubit.dart';
import 'package:flutter_application/Controllers/Utilities/Actions.dart';
import 'package:flutter_application/Models/CubitModels/PageState.dart';
import 'package:flutter_application/Controllers/Constants/Appconstants.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_application/View/Helpers/Iconcontents.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/View/Helpers/Imagecontents.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Appbar1 extends StatelessWidget {
  const Appbar1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, PageState>(
      builder: (context, state) {
        return AppBar(
          backgroundColor:
              AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                  ? lighttheme
                  : darktheme,
          leading: Image.asset(splashlogo),
          title: Text(
            state.page["page"] == homeScreen
                ? home_appbarheading
                : state.page["page"] == myjobsScreen
                ? myjob_appbarheading
                : profile_appbarheading,
            style: TextStyle(
              fontSize: textsize5,
              color: hexToColor(goldencolor),
              fontFamily: headingfont,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                themechange(context);
              },
              icon: Icon(
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? lighticon
                    : darkicon,
                color: hexToColor(goldencolor),
                size: iconsize1,
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(4.0),
            child: Container(color: hexToColor(goldencolor), height: 1),
          ),
        );
      },
    );
  }
}
