import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_application/Helpers/Appbar.dart';
import 'package:flutter_application/Helpers/Bottombar.dart';
import 'package:flutter_application/Helpers/Typography.dart';
import 'package:flutter_application/Pages/Home.dart';
import 'package:flutter_application/Pages/IntroScreen.dart';
import 'package:flutter_application/Pages/MyJobs.dart';
import 'package:flutter_application/Pages/Profile.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor:
              AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                  ? lighttheme
                  : darktheme,

          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Appbar1(),
          ),
          bottomNavigationBar: Bottombar1(),
          body: // Introscreen(),
              Profilescreen(),
          //  Home(),
          // MyJobs(),
        ),
      ],
    );
  }
}
