import 'package:flutter_application/Controllers/Constants/ApiConstants.dart';
import 'package:flutter_application/Controllers/Utilities/DatabaseActions.dart';
import 'package:flutter_application/Models/ApiModels.dart';
import 'package:flutter_application/Models/CubitModels/HomeState.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobCubit extends Cubit<JobState> {
  JobCubit() : super(JobInitial());

  int _offset = 0;
  final int _limit = 15;
  List<Jobmodel> _allJobs = [];

  //==================Data loading=======================
  Future<void> loadJobs(String searchdata) async {
    try {
      if (_allJobs.isEmpty) {
        emit(JobLoading());
      }
      var jsonList = await Databaseactions().getalldata(
        getalljobs,
        _limit,
        _offset,
        searchdata,
      );
      if (jsonList != null) {
        var jobs =
            (jsonList as List).map((json) => Jobmodel.fromJson(json)).toList();

        _allJobs.addAll(jobs);
        _offset += _limit;
        emit(JobLoaded(List.from(_allJobs), jobs.length == _limit));
      }
    } catch (e) {
      print(e);
      emit(JobError(failedmsgtext));
    }
  }

  //==================emptylist======================
  emptylist() {
    _allJobs = [];
    _offset = 0;
    emit(JobLoaded(_allJobs, _offset == 0));
  }
}
