import 'package:flutter_application/Models/Appconstants.dart';
import 'package:flutter_application/View/Helpers/UIconstants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<List> {
  LoginCubit()
    : super([
        [false, true],
        jobseekertext,
      ]);

  void personupdate(int i) {
    emit([
      List<bool>.generate(2, (index) => index == i ? true : false),
      wholist[i].text,
    ]);
  }
}
