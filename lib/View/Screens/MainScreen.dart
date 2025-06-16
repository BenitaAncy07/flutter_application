// ignore_for_file: use_build_context_synchronously, prefer_typing_uninitialized_variables

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_application/Controllers/Cubits/PageCubit.dart';
import 'package:flutter_application/Controllers/Utilities/Actions.dart';
import 'package:flutter_application/Models/AppCubitmodels.dart';
import 'package:flutter_application/Models/Appconstants.dart';
import 'package:flutter_application/View/Typography/Appbar.dart';
import 'package:flutter_application/View/Typography/Bottombar.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Screens/HomeScreen.dart';
import 'package:flutter_application/View/Screens/IntroScreen.dart';
import 'package:flutter_application/View/Screens/MyJobScreen.dart';
import 'package:flutter_application/View/Screens/ProfileScreen.dart';
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
        return Scaffold(
          backgroundColor:
              AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                  ? lighttheme
                  : darktheme,
          appBar:
              // state.internetstatus == "online" &&
              state.page["page"] != introScreen
                  ? PreferredSize(
                    preferredSize: Size.fromHeight(kToolbarHeight),
                    child: Appbar1(),
                  )
                  : null,
          bottomNavigationBar:
              // state.internetstatus == "online" &&
              state.page["page"] != introScreen ? Bottombar1() : null,
          body: PopScope(
            canPop: false, // Prevents the route from being popped automatically
            onPopInvokedWithResult: (didPop, result) async {
              await backbuttonaction(context, state.page["page"], didPop);
            },
            child:
                // state.internetstatus == "online"
                //     ?
                state.page["page"] == introScreen
                    ? Introscreen()
                    : state.page["page"] == homeScreen
                    ? Home()
                    : state.page["page"] == myjobsScreen
                    ? MyJobs()
                    : state.page["page"] == profileScreen
                    ? Profilescreen()
                    : Container(),
            //: NoInternet(),
          ),
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
          context.read<PageCubit>().internetcheck("online");
          break;
        case InternetStatus.disconnected:
          context.read<PageCubit>().internetcheck("offline");
          break;
      }
    });
  }
}
