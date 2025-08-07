import 'package:flutter/material.dart';
import 'package:flutter_application/Controllers/Constants/ApiConstants.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';
import 'package:flutter_application/Controllers/Utilities/DatabaseActions.dart';
import 'package:flutter_application/Models/ApiModels.dart';
import 'package:flutter_application/Models/CubitModels/PageState.dart';
import 'package:flutter_application/Models/CubitModels/ProfileState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilesettingCubit extends Cubit<ProfileState> {
  ProfilesettingCubit() : super(ProfileState(0, false, false, false));

  void indexchange(int index) {
    emit(
      ProfileState(
        index,
        state.showqualificationcontent,
        state.showpreferencecontent,
        state.showavailablecontent,
      ),
    );
  }

  void showqualification(bool value) {
    emit(
      ProfileState(
        state.selectedindex,
        value,
        state.showpreferencecontent,
        state.showavailablecontent,
      ),
    );
  }

  void showjobpreference(bool value) {
    emit(
      ProfileState(
        state.selectedindex,
        state.showqualificationcontent,
        value,
        state.showavailablecontent,
      ),
    );
  }

  void showavailable(bool value) {
    emit(
      ProfileState(
        state.selectedindex,
        state.showqualificationcontent,
        state.showpreferencecontent,
        value,
      ),
    );
  }
}

class Profiledetailcubit extends Cubit<Profiledetailstate> {
  Profiledetailcubit() : super(ProfiledetailInitial());

  //==================Data loading=======================
  Future<void> loadprofiledetails(
    BuildContext context,
    String jobseekerid,
  ) async {
    try {
      //  emit(profiledetailLoading());
      var jsonList = await Databaseactions().getdata(
        getprofiledata,
        jobseekerid,
        jobseekeridtext,
      );
      dataload(jsonList, context, jobseekerid);
    } catch (e) {
      print(e);
      emit(profiledetailError(failedmsgtext));
    }
  }

  //==================Data update=======================
  Future<void> updateprofiledetails(
    BuildContext context,
    String check,
    String jobseekerid,
    List<String> changetext,
    List<String> changevalue,
  ) async {
    try {
      emit(profiledetailLoading());

      var jsonList = await Databaseactions().updatedata(
        check,
        jobseekerid,
        changetext,
        changevalue,
        jobseekerid,
      );
      dataload(jsonList, context, jobseekerid);
    } catch (e) {
      print(e);
      emit(profiledetailError(failedmsgtext));
    }
  }

  //===========================Delete profile data==============
  Future<void> deleteprofiledetails(
    BuildContext context,
    String check,
    String jobseekerid,
    String id,
  ) async {
    try {
      //  emit(profiledetailLoading());

      var jsonList = await Databaseactions().deletedata(check, id, jobseekerid);
      dataload(jsonList, context, jobseekerid);
    } catch (e) {
      print(e);
      emit(profiledetailError(failedmsgtext));
    }
  }

  //==================file upload=======================
  Future<void> fileupload(
    BuildContext context,
    fileBytes,
    String filename,
    String jobseekerid,
  ) async {
    try {
      //  emit(profiledetailLoading());

      var jsonList = await Databaseactions().uploadfile(
        fileBytes,
        jobseekerid,
        context,
        [resumeapitext],
        [filename],
      );
      dataload(jsonList, context, jobseekerid);
    } catch (e) {
      print(e);
      emit(profiledetailError(failedmsgtext));
    }
  }

  //========================data load=================
  dataload(jsonList, BuildContext context, String jobseekerid) {
    if (jsonList != null) {
      List<profiledatamodel> jobs =
          (jsonList as List)
              .map((json) => profiledatamodel.fromJson(json))
              .toList();

      emit(showdetail(jobseekerid, jobs[0]));
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<ProfilesettingCubit>().indexchange(jobs[0].openprofile);
      });
    }
  }
}
