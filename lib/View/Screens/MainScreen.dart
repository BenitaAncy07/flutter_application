// ignore_for_file: use_build_context_synchronously, prefer_typing_uninitialized_variables

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';
import 'package:flutter_application/Controllers/Cubits/LoginCubit.dart';
import 'package:flutter_application/Controllers/Cubits/PageCubit.dart';
import 'package:flutter_application/Controllers/Utilities/Actions.dart';
import 'package:flutter_application/Controllers/Constants/Appconstants.dart';
import 'package:flutter_application/Models/CubitModels/PageState.dart';
import 'package:flutter_application/View/Screens/LoginScreen.dart';
import 'package:flutter_application/View/Screens/RegisterScreen.dart';
import 'package:flutter_application/View/Typography/Appbar.dart';
import 'package:flutter_application/View/Typography/Bottombar.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Screens/Jobseeker/HomeScreen.dart';
import 'package:flutter_application/View/Screens/IntroScreen.dart';
import 'package:flutter_application/View/Screens/Jobseeker/MyJobScreen.dart';
import 'package:flutter_application/View/Screens/Jobseeker/ProfileScreen.dart';
import 'package:flutter_application/View/Typography/No_Internet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  var listener;
  @override
  void initState() {
    super.initState();
    internetconnectcheck();
  }

  @override
  dispose() {
    listener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, PageState>(
      builder: (context, state) {
        return BlocBuilder<LoginCubit, LoginState>(
          builder: (context, loginstate) {
            return Scaffold(
              backgroundColor:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? lighttheme
                      : darktheme,
              appBar:
                  state.internetstatus == onlinetext &&
                          (state.page[pagetext] == homeScreen ||
                              state.page[pagetext] == myjobsScreen ||
                              state.page[pagetext] == profileScreen)
                      ? PreferredSize(
                        preferredSize: Size.fromHeight(kToolbarHeight),
                        child: appbar2(context),
                      )
                      : null,
              bottomNavigationBar:
                  state.internetstatus == onlinetext &&
                          (state.page[pagetext] == homeScreen ||
                              state.page[pagetext] == myjobsScreen ||
                              state.page[pagetext] == profileScreen)
                      ? Bottombar1()
                      : null,
              body: PopScope(
                canPop:
                    false, // Prevents the route from being popped automatically
                onPopInvokedWithResult: (didPop, result) async {
                  await backbuttonaction(context, state.page[pagetext], didPop);
                },
                child:
                    state.internetstatus == onlinetext
                        ? state.page[pagetext] == introScreen
                            ? Introscreen()
                            : state.page[pagetext] == loginScreen
                            ? Loginscreen()
                            : state.page[pagetext] == registerScreen
                            ? Registerscreen()
                            : loginstate.person == employertext
                            ? Container() //admin
                            : state.page[pagetext] == homeScreen
                            ? Home()
                            : state.page[pagetext] == myjobsScreen
                            ? MyJobs()
                            : state.page[pagetext] == profileScreen
                            ? Profilescreen()
                            : Container()
                        : NoInternet(),
              ),
            );
          },
        );
      },
    );
  }

  //==========================Online or offline====================
  internetconnectcheck() async {
    listener = InternetConnection().onStatusChange.listen((
      InternetStatus status,
    ) {
      switch (status) {
        case InternetStatus.connected:
          context.read<PageCubit>().internetcheck(onlinetext);
          break;
        case InternetStatus.disconnected:
          context.read<PageCubit>().internetcheck(offlinetext);
          break;
      }
    });
  }
}
