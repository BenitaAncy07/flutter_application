import 'package:flutter/material.dart';
import 'package:flutter_application/Controllers/Constants/ApiConstants.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';
import 'package:flutter_application/Controllers/Utilities/DatabaseActions.dart';
import 'package:flutter_application/Models/ApiModels.dart';
import 'package:flutter_application/Models/CubitModels/JobDetailState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Jobdetailcubit extends Cubit<Jobdetailstate> {
  Jobdetailcubit() : super(JobdetailInitial());

  //==================Data loading=======================
  Future<void> loadJobdetails(BuildContext context, String jobid) async {
    try {
      emit(JobdetailLoading());
      var jsonList = await Databaseactions().getdata(
        getjobdetail,
        jobid,
        jobidtext,
      );
      if (jsonList != null) {
        List<Jobdetailmodel> jobs =
            (jsonList as List)
                .map((json) => Jobdetailmodel.fromJson(json))
                .toList();

        emit(detailshow(jobid, jobs[0]));
      }
    } catch (e) {
      print(e);
      emit(JobdetailError(failedmsgtext));
    }
  }
}
