import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_application/Helpers/Constant.dart';
import 'package:flutter_application/Helpers/Typography.dart';
import 'package:flutter_application/Helpers/Hexconversion.dart';

class Appbar1 extends StatefulWidget {
  const Appbar1({super.key});

  @override
  State<Appbar1> createState() => _Appbar1State();
}

class _Appbar1State extends State<Appbar1> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
              ? lighttheme
              : darktheme,
      leading: Image.asset("assets/images/splashlogo.png"),
      title: Text(
        profile_appbarheading,
        style: TextStyle(
          fontSize: 15,
          color: hexToColor("#D4AF37"),
          fontFamily: headingfont,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                ? Icons.light_mode_outlined
                : Icons.dark_mode,
            color: hexToColor("#D4AF37"),
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(4.0), // Adjust the height of the border
        child: Container(color: hexToColor("#D4AF37"), height: 1),
      ),
    );
  }
}
