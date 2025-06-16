import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_application/Controllers/Cubits/BottombarCubit.dart';
import 'package:flutter_application/Controllers/Cubits/LoginCubit.dart';
import 'package:flutter_application/Controllers/Cubits/MyjobCubit.dart';
import 'package:flutter_application/Controllers/Cubits/PageCubit.dart';
import 'package:flutter_application/Controllers/Cubits/ProfileSettingCubit.dart';
import 'package:flutter_application/View/Screens/Splashscreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PageCubit()),
        BlocProvider(create: (context) => BottombarCubit()),
        BlocProvider(create: (context) => MyjobCubit()),
        BlocProvider(create: (context) => ProfilesettingCubit()),
        BlocProvider(create: (context) => LoginCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light().copyWith(),
      dark: ThemeData.dark().copyWith(),
      initial: AdaptiveThemeMode.light,
      builder:
          (theme, darkTheme) => MaterialApp(
            title: 'Jobs',
            debugShowCheckedModeBanner: false,
            home: Splashscreen(),
          ),
    );
  }
}
