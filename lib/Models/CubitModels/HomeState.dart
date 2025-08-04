import 'package:flutter_application/Models/ApiModels.dart';

abstract class JobState {}

class JobInitial extends JobState {}

class JobLoading extends JobState {}

class JobLoaded extends JobState {
  final List<Jobmodel> jobs;
  final bool hasMore;

  JobLoaded(this.jobs, this.hasMore);
}

class JobError extends JobState {
  final String message;

  JobError(this.message);
}
