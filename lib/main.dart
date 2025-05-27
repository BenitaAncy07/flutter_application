import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

import 'package:flutter_application/Pages/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light().copyWith(),
      dark: ThemeData.dark().copyWith(),
      initial: AdaptiveThemeMode.dark,
      builder:
          (theme, darkTheme) => MaterialApp(
            title: 'Jobs',
            debugShowCheckedModeBanner: false,
            // theme:AdaptiveTheme.of(context).mode !=null? ThemeData(
            //   cardColor: AdaptiveTheme.of(context).mode ==
            //                             AdaptiveThemeMode.light?lighttheme:darktheme,
            //  // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            // ):ThemeData(),
            home: Splashscreen(),
          ),
    );
  }
}
