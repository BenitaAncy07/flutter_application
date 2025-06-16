import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_application/Controllers/Utilities/Actions.dart';
import 'package:flutter_application/View/Helpers/Bottombarcontents.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Fontcontents.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application/Controllers/Cubits/BottombarCubit.dart';

class Bottombar1 extends StatelessWidget {
  const Bottombar1({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottombarCubit, int>(
      builder: (context, selectedindex) {
        return Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: hexToColor(goldencolor), width: 1),
            ),
          ),
          child: BottomNavigationBar(
            items: bottombaritem,
            backgroundColor:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? lighttheme
                    : darktheme,
            selectedLabelStyle: TextStyle(
              fontSize: bottombarlabelsize,
              fontFamily: headingfont,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: bottombarlabelsize,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
              fontFamily: headingfont,
            ),
            selectedItemColor: hexToColor(goldencolor),
            unselectedItemColor:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black
                    : lighttheme,
            currentIndex: selectedindex,
            onTap: (index1) {
              bottombaraction(index1, context);
            },
          ),
        );
      },
    );
  }
}
