// ignore_for_file: prefer_interpolation_to_compose_strings, non_constant_identifier_names

class Jobmodel {
  final String id,
      jobtitle,
      jobtype,
      workshift,
      payscale,
      payperiod,
      worklocation,
      companyname,
      location;

  Jobmodel({
    required this.id,
    required this.jobtitle,
    required this.jobtype,
    required this.companyname,
    required this.location,
    required this.payperiod,
    required this.payscale,
    required this.worklocation,
    required this.workshift,
  });

  factory Jobmodel.fromJson(Map<String, dynamic> json) {
    return Jobmodel(
      id: json['id'],
      jobtitle: json['jobtitle'],
      jobtype: json["jobtype"],
      workshift: json["workshift"],
      payscale: json["payscale"],
      payperiod: json["payperiod"],
      worklocation: json["worklocation"],
      companyname: json["company_name"],
      location: json["location"],
    );
  }
}

class Jobdetailmodel {
  final String id,
      jobtitle,
      jobtype,
      workshift,
      payscale,
      payperiod,
      worklocation,
      companyname,
      location,
      workschedule,
      aboutcompany,
      companytype;
  final List<String> skills, requirements, responsibilities, benefits;

  Jobdetailmodel({
    required this.id,
    required this.jobtitle,
    required this.jobtype,
    required this.companyname,
    required this.location,
    required this.payperiod,
    required this.payscale,
    required this.worklocation,
    required this.workshift,
    required this.skills,
    required this.requirements,
    required this.responsibilities,
    required this.benefits,
    required this.workschedule,
    required this.aboutcompany,
    required this.companytype,
  });

  factory Jobdetailmodel.fromJson(Map<String, dynamic> json) {
    return Jobdetailmodel(
      id: json['id'],
      jobtitle: json['jobtitle'],
      companyname: json["company_name"],
      companytype: json["companytype"],
      aboutcompany: json['aboutcompany'],
      location: json["location"],
      worklocation: json["worklocation"],
      skills: json["skills"].split("#"),
      jobtype: json["jobtype"],
      workshift: json["workshift"],
      workschedule: json["workschedule"],
      payscale: json["payscale"],
      payperiod: json["payperiod"],
      benefits: json["benefits"].split("#"),
      requirements: json["requirements"].split("#"),
      responsibilities: json["responsibilities"].split("#"),
    );
  }
}

class profiledatamodel {
  final int openprofile;
  final bool available_immediately;
  final String id,
      name,
      mail,
      phoneno,
      location,
      resume,
      resumedate,
      minimum_basepay,
      pay_period,
      education,
      skills,
      schedule,
      languages,
      shift,
      qualification,
      desired_jobtitle,
      jobtype,
      worklocation;

  profiledatamodel({
    required this.id,
    required this.name,
    required this.mail,
    required this.phoneno,
    required this.location,
    required this.openprofile,
    required this.resume,
    required this.resumedate,
    required this.minimum_basepay,
    required this.pay_period,
    required this.available_immediately,
    required this.qualification,

    required this.education,

    required this.skills,

    required this.languages,

    required this.shift,
    required this.schedule,
    required this.desired_jobtitle,
    required this.jobtype,
    required this.worklocation,
  });

  factory profiledatamodel.fromJson(Map<String, dynamic> json) {
    return profiledatamodel(
      id: json['id'],
      name: json['name'],
      mail: json["mail"],
      phoneno: json["phoneno"],
      location: json['location'],
      openprofile: int.parse(json["openprofile"]),
      resume: json["resume"],
      resumedate: json["resumedate"],
      minimum_basepay: json["minimum_basepay"],
      pay_period: json["pay_period"],
      available_immediately:
          json["available_immediately"] == "1" ? true : false,
      qualification: json["qualification"],

      education: json["education"],
      languages: json["language"],
      shift: json["shift"],
      schedule: json["schedule"],
      desired_jobtitle: json["desired_jobtitle"],
      jobtype: json["jobtype"],
      skills: json["skills"],
      worklocation: json["worklocation"],
    );
  }
}
