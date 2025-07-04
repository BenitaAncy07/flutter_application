import 'package:flutter_application/Models/ApiModels.dart';

abstract class Profiledetailstate {}

class ProfiledetailInitial extends Profiledetailstate {}

class profiledetailLoading extends Profiledetailstate {}

class showdetail extends Profiledetailstate {
  final String jobseekerid;
  final profiledatamodel value;
  showdetail(this.jobseekerid, this.value);
}

class profiledetailError extends Profiledetailstate {
  final String message;

  profiledetailError(this.message);
}
