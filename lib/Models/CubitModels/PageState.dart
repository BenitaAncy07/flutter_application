import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application/Controllers/Constants/GlobalConstants.dart';

class PageState {
  final Map<String, dynamic> page;
  final String internetstatus;
  PageState(this.page, this.internetstatus);
}

class LoginState {
  String person, loginid;
  List<bool> value;
  LoginState(this.value, this.person, this.loginid);
}

class ProfileState {
  final int selectedindex;
  final bool showqualificationcontent,
      showpreferencecontent,
      showavailablecontent;

  ProfileState(
    this.selectedindex,
    this.showqualificationcontent,
    this.showpreferencecontent,
    this.showavailablecontent,
  );
}

class RegisterState {
  final formKey1 = GlobalKey<FormState>(),
      formKey2 = GlobalKey<FormState>(),
      formKey3 = GlobalKey<FormState>(),
      formKey4 = GlobalKey<FormState>(),
      formKey5 = GlobalKey<FormState>(),
      formKey6 = GlobalKey<FormState>(),
      formKey7 = GlobalKey<FormState>(),
      formKey8 = GlobalKey<FormState>(),
      formKey9 = GlobalKey<FormState>(),
      formKey10 = GlobalKey<FormState>(),
      formKey11 = GlobalKey<FormState>(),
      formKey12 = GlobalKey<FormState>(),
      formKey13 = GlobalKey<FormState>(),
      formKey15 = GlobalKey<FormState>(),
      formKey16 = GlobalKey<FormState>();

  FocusNode box1Focus = FocusNode(),
      box2Focus = FocusNode(),
      box3Focus = FocusNode(),
      box4Focus = FocusNode(),
      box5Focus = FocusNode(),
      box6Focus = FocusNode(),
      box7Focus = FocusNode(),
      box8Focus = FocusNode(),
      box9Focus = FocusNode(),
      box10Focus = FocusNode(),
      box11Focus = FocusNode(),
      box12Focus = FocusNode(),
      box13Focus = FocusNode(),
      box15Focus = FocusNode(),
      box16Focus = FocusNode(),
      box17Focus = FocusNode(),
      box18Focus = FocusNode();

  TextEditingController namecontroller = TextEditingController(),
      mailcontroller = TextEditingController(),
      passwordcontroller = TextEditingController(),
      confirmpasswordcontroller = TextEditingController(),
      companycontroller = TextEditingController(),
      companytypecontroller = TextEditingController(),
      aboutcompanycontroller = TextEditingController(),
      locationcontroller = TextEditingController(),
      phonecontroller = TextEditingController(),
      jobtitlecontroller = TextEditingController(),
      levelcontroller = TextEditingController(),
      fieldcontroller = TextEditingController(),
      skillcontroller = TextEditingController(),
      yearcontroller = TextEditingController(),
      langcontroller = TextEditingController(),
      proficiencycontroller = TextEditingController(
        text: languageproficiencyitems[0],
      ),
      paycontroller = TextEditingController(),
      payperiodcontroller = TextEditingController(text: payperioditems[0]),
      desiredjobcontroller = TextEditingController(),
      resumecontroller = TextEditingController();

  List<String> jobtitle = [],
      company = [],
      level = [],
      field = [],
      language = [],
      expyear = [],
      proficiency = [],
      skill = [],
      desiredjob = [],
      jobtype = [],
      schedule = [],
      shift = [],
      worklocation = [];

  Uint8List? resumepdf;
  // RegisterState(
  //   this.aboutcompanycontroller,
  //   this.box10Focus,s
  //   this.box11Focus,
  //   this.box12Focus,
  //   this.box13Focus,
  //   this.box15Focus,
  //   this.box16Focus,
  //   this.box1Focus,
  //   this.box2Focus,
  //   this.box3Focus,
  //   this.box4Focus,
  //   this.box5Focus,
  //   this.box6Focus,
  //   this.box7Focus,
  //   this.box8Focus,
  //   this.box9Focus,
  //   this.companycontroller,
  //   this.companytypecontroller,
  //   this.confirmpasswordcontroller,
  //   this.desiredjob,
  //   this.desiredjobcontroller,
  //   this.educate,
  //   this.fieldcontroller,
  //   this.jobtitlecontroller,
  //   this.jobtype,
  //   this.lang,
  //   this.langcontroller,
  //   this.levelcontroller,
  //   this.locationcontroller,
  //   this.mailcontroller,
  //   this.namecontroller,
  //   this.passwordcontroller,
  //   this.paycontroller,
  //   this.payperiodcontroller,
  //   this.phonecontroller,
  //   this.proficiencycontroller,
  //   this.schedule,
  //   this.shift,
  //   this.skill,
  //   this.skillcontroller,
  //   this.workexp,
  //   this.worklocation,
  //   this.yearcontroller,
  // );
}
