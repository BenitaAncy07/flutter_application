import 'package:flutter_application/Models/ApiModels.dart';

abstract class Jobdetailstate {}

class JobdetailInitial extends Jobdetailstate {}

class JobdetailLoading extends Jobdetailstate {}

class detailshow extends Jobdetailstate {
  final String jobid;
  final Jobdetailmodel value;
  detailshow(this.jobid, this.value);
}

class JobdetailError extends Jobdetailstate {
  final String message;

  JobdetailError(this.message);
}
