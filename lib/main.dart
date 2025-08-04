import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_application/Controllers/Cubits/BottombarCubit.dart';
import 'package:flutter_application/Controllers/Cubits/JobDetailCubit.dart';
import 'package:flutter_application/Controllers/Cubits/LoginCubit.dart';
import 'package:flutter_application/Controllers/Cubits/MyjobCubit.dart';
import 'package:flutter_application/Controllers/Cubits/PageCubit.dart';
import 'package:flutter_application/Controllers/Cubits/Pagination/HomeCubit.dart';
import 'package:flutter_application/Controllers/Cubits/ProfileCubit.dart';
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
        BlocProvider(create: (context) => JobCubit()),
        BlocProvider(create: (context) => Jobdetailcubit()),
        BlocProvider(create: (context) => Profiledetailcubit()),
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
