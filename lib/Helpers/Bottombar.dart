import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_application/Helpers/Typography.dart';
import 'package:flutter_application/Helpers/Hexconversion.dart';

class Bottombar1 extends StatefulWidget {
  const Bottombar1({super.key});

  @override
  State<Bottombar1> createState() => _Bottombar1State();
}

class _Bottombar1State extends State<Bottombar1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: hexToColor("#D4AF37"),
            width: 1,
          ), // Adds a top border
        ),
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              size: 20,
              color: hexToColor("#D4AF37"),
            ),
            icon: Icon(Icons.home_outlined, color: hexToColor("#D4AF37")),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.bookmark,
              size: 20,
              color: hexToColor("#D4AF37"),
            ),
            icon: Icon(
              Icons.bookmark_outline_outlined,
              color: hexToColor("#D4AF37"),
            ),
            label: 'My jobs',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.person,
              size: 20,
              color: hexToColor("#D4AF37"),
            ),
            icon: Icon(Icons.person_outlined, color: hexToColor("#D4AF37")),
            label: 'Profile',
          ),
        ],
        backgroundColor:
            AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                ? lighttheme
                : darktheme,
        selectedLabelStyle: TextStyle(fontSize: 11, fontFamily: headingfont),
        unselectedLabelStyle: TextStyle(
          fontSize: 11,
          color:
              AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                  ? black
                  : lighttheme,
          fontFamily: headingfont, // fontWeight: FontWeight.bold
        ),
        selectedItemColor: hexToColor("#D4AF37"),
        unselectedItemColor:
            AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                ? black
                : lighttheme,
        currentIndex: 1, // Tracks the selected item
        onTap: (index1) {
          // Handle navigation
        },
      ),
    );
  }
}
