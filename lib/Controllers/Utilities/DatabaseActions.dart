// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter_application/Controllers/Constants/ApiConstants.dart';
import 'package:http/http.dart' as http;

class Databaseactions {
  //==========================get login data=====================================
  getloginid(String person, String mail, String password) async {
    var uri = Uri.parse(url);
    var body = json.encode({
      'data': {
        'check': getlogin,
        'mail': mail,
        "password": password,
        "person": person,
      },
    });
    print(body);
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      final response = await http.post(uri, body: body, headers: headers);

      var info = json.decode(response.body);
      var data = info['data'][0]["id"];
      print(data);
      return data;
    } catch (e) {
      print(e);

      return "";
    }
  }

  //==========================Get all job data from the table=======================
  getalldata(String check, int limit, int offset, String searchvalue) async {
    var uri = Uri.parse(url);
    var body = json.encode({
      'data': {
        'check': check,
        "limit": limit,
        "offset": offset,
        "searchvalue": searchvalue,
      },
    });
    print(body);
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      final response = await http.post(uri, body: body, headers: headers);

      var info = json.decode(response.body);
      var data = info['data'];
      print(data);
      return data;
    } catch (e) {
      print(e);

      return "";
    }
  }

  //==========================Get particular job/jobseeker data from the table=======================
  getdata(String check, String id, String text) async {
    var uri = Uri.parse(url);
    var body = json.encode({
      'data': {'check': check, text: id},
    });
    print(body);
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      final response = await http.post(uri, body: body, headers: headers);

      var info = json.decode(response.body);
      var data = info['data'];
      print(data);
      return data;
    } catch (e) {
      print(e);

      return "";
    }
  }

  //=========================Update data===============================
  updatedata(
    String check,
    String id,
    List<String> updaterow,
    List<String> updatevalue,
    String jobseekerid,
  ) async {
    var uri = Uri.parse(url);
    var body = json.encode({
      'data': {
        'check': check,
        "id": id,
        "updaterow": updaterow,
        "updatevalue": updatevalue,
        "jobseekerid": jobseekerid,
      },
    });
    print(body);
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      final response = await http.post(uri, body: body, headers: headers);

      // var info = json.decode(response.body);
      // var data = info['data'][0]["msg"];
      // print(data);
      // return data;

      var info = json.decode(response.body);
      var data = info['data'];
      print(data);
      return data;
    } catch (e) {
      print(e);

      return "";
    }
  }

  //=========================Delete data===============================
  deletedata(String check, String id, String jobseekerid) async {
    var uri = Uri.parse(url);
    var body = json.encode({
      'data': {'check': check, "id": id, "jobseekerid": jobseekerid},
    });
    print(body);
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      final response = await http.post(uri, body: body, headers: headers);

      var info = json.decode(response.body);
      var data = info['data'];
      print(data);
      return data;
    } catch (e) {
      print(e);

      return "";
    }
  }
}
