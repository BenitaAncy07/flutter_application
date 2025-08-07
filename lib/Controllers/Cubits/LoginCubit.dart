import 'package:flutter/widgets.dart';
import 'package:flutter_application/Controllers/Cubits/PageCubit.dart';
import 'package:flutter_application/Controllers/Cubits/ProfileCubit.dart';
import 'package:flutter_application/Controllers/Cubits/RegisterCubit.dart';
import 'package:flutter_application/Controllers/Utilities/Actions.dart';
import 'package:flutter_application/Controllers/Utilities/DatabaseActions.dart';
import 'package:flutter_application/Controllers/Constants/Appconstants.dart';
import 'package:flutter_application/Models/CubitModels/PageState.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';
import 'package:flutter_application/View/Typography/Loading.dart';
import 'package:flutter_application/View/Typography/Snackbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState([false, true], jobseekertext, ""));

  //=====================Person selected=========================
  void personselected(int i) {
    emit(
      LoginState(
        List<bool>.generate(2, (index) => index == i ? true : false),
        wholist[i].text,
        state.loginid,
      ),
    );
  }

  //=====================Person update=========================
  void personupdate(String val, String loginid) {
    emit(
      LoginState(
        List<bool>.generate(2, (index) => wholist[index] == val ? true : false),
        val,
        loginid,
      ),
    );
  }

  //========================Login id=============================
  Future<void> loginid(
    BuildContext context,
    String mail,
    String password,
  ) async {
    loadingdialogBox(context);

    var a = await Databaseactions().getloginid(state.person, mail, password);

    if (a.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(loginidtext, a.toString());
      prefs.setString(loginpersontext, state.person);

      simplesnackbar(context, loginsuccessmsg);

      emit(LoginState(state.value, state.person, a));
      context.read<Profiledetailcubit>().loadprofiledetails(context, a);
      context.read<PageCubit>().nextPage(homeScreen);
    } else {
      simplesnackbar(context, logininvalidmsg);
    }

    closeaction(context);
    context.read<RegisterCubit>().reset();
  }
}
