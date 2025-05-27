import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/Material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter_application/Helpers/Typography.dart';
import 'package:flutter_application/Pages/MainScreen.dart';


class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  EasySplashScreen(
      logoWidth: 100,
      logo: Image.asset("assets/images/splashlogo.png"),
     // title: Text("", ),
      backgroundColor: AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light?lighttheme:darktheme,
    showLoader: false,
      // loadingText: Text(
      //   "Loading...",
      //   style: text1,
      // ),
      navigator: const MainScreen(),
      durationInSeconds: 2,
    );
  }
}