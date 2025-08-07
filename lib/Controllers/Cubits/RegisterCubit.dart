import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application/Controllers/Constants/ApiConstants.dart';
import 'package:flutter_application/Controllers/Constants/GlobalConstants.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';
import 'package:flutter_application/Controllers/Cubits/LoginCubit.dart';
import 'package:flutter_application/Controllers/Utilities/Actions.dart';
import 'package:flutter_application/Controllers/Utilities/DatabaseActions.dart';
import 'package:flutter_application/View/Typography/Loading.dart';
import 'package:flutter_application/View/Typography/Snackbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Models/CubitModels/PageState.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState());

  Future<void> updatedatas(BuildContext context, String person) async {
    loadingdialogBox(context);
    String baseimage = "";
    if (person == jobseekertext) {
      baseimage = base64Encode(state.resumepdf as List<int>);
    }
    var msg = await Databaseactions().registerdata(
      person == jobseekertext
          ? [
            "check",
            "name",
            "mail",
            "password",
            "phone_no",
            "location",
            "resume",
            "minimum_basepay",
            "pay_period",
            "jobtype",
            "workschedule",
            "workshift",
            "worklocation",
            "jobtitle",
            "company",
            "leveleducation",
            "fieldeducation",
            "expyear",
            "proficiency",
            "skill",
            "language",
            "desiredjob",
            "resumepdf",
          ]
          : [
            "check",
            "name",
            "mail",
            "password",
            "company_name",
            "company_type",
            "about_you",
            "location",
          ],
      person == jobseekertext
          ? [
            insertjobseeker,
            state.namecontroller.text,
            state.mailcontroller.text,
            state.passwordcontroller.text,
            state.phonecontroller.text,
            state.locationcontroller.text,
            state.resumecontroller.text,
            state.paycontroller.text,
            state.payperiodcontroller.text,
            state.jobtype.join("#"),
            state.schedule.join("#"),
            state.shift.join("#"),
            state.worklocation.join("#"),
            state.jobtitle,
            state.company,
            state.level,
            state.field,
            state.skill,
            state.expyear,
            state.language,
            state.proficiency,
            state.desiredjob,
            baseimage,
          ]
          : [
            insertemployer,
            state.namecontroller.text,
            state.mailcontroller.text,
            state.passwordcontroller.text,
            state.companycontroller.text,
            state.companytypecontroller.text,
            state.aboutcompanycontroller.text,
            state.locationcontroller.text,
          ],
    );
    closeaction(context);
    if (msg != null) {
      simplesnackbar(context, msg);
      if (msg == accountcreatedmsg) {
        context.read<LoginCubit>().loginid(
          context,
          state.mailcontroller.text,
          state.passwordcontroller.text,
        );
      }
    }
  }

  void reset() {
    state.namecontroller.clear();
    state.mailcontroller.clear();
    state.passwordcontroller.clear();
    state.confirmpasswordcontroller.clear();
    state.companycontroller.clear();
    state.companytypecontroller.clear();
    state.aboutcompanycontroller.clear();
    state.locationcontroller.clear();
    state.phonecontroller.clear();
    state.jobtitlecontroller.clear();
    state.levelcontroller.clear();
    state.fieldcontroller.clear();
    state.skillcontroller.clear();
    state.yearcontroller.clear();
    state.langcontroller.clear();
    state.proficiencycontroller.text = languageproficiencyitems[0];
    state.paycontroller.clear();
    state.payperiodcontroller.text = payperioditems[0];
    state.desiredjobcontroller.clear();
    state.resumecontroller.clear();
    // Clear all focus nodes
    state.box1Focus.unfocus();
    state.box2Focus.unfocus();
    state.box3Focus.unfocus();
    state.box4Focus.unfocus();
    state.box5Focus.unfocus();
    state.box6Focus.unfocus();
    state.box7Focus.unfocus();
    state.box8Focus.unfocus();
    state.box9Focus.unfocus();
    state.box10Focus.unfocus();
    state.box11Focus.unfocus();
    state.box12Focus.unfocus();
    state.box13Focus.unfocus();
    state.box15Focus.unfocus();
    state.box16Focus.unfocus();
    state.box17Focus.unfocus();
    state.box18Focus.unfocus();

    // Reset lists
    state.jobtitle.clear();
    state.company.clear();
    state.level.clear();
    state.field.clear();
    state.language.clear();
    state.expyear.clear();
    state.proficiency.clear();
    state.skill.clear();
    state.desiredjob.clear();
    state.jobtype.clear();
    state.schedule.clear();
    state.shift.clear();
    state.worklocation.clear();

    state.resumepdf = null;
    emit(state);
  }
}
