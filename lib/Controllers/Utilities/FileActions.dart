// ignore_for_file: use_build_context_synchronously

import 'package:file_picker/file_picker.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_application/Controllers/Constants/ApiConstants.dart';
// import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_application/Controllers/Constants/Appconstants.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:html' as html;

//=============================Pick File Action========================
Future<Map> pickFileaction(BuildContext context) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    withData: true, // Important for web: gets file bytes
    type: FileType.custom,
    allowedExtensions: ['pdf'], // Customize as needed
  );

  if (result != null) {
    Uint8List? fileBytes;
    if (kIsWeb) {
      fileBytes = result.files.first.bytes;
    } else {
      if (Platform.isAndroid) {
        final filepath = result.files.first.path;
        fileBytes = await File(filepath!).readAsBytes();
      }
    }
    final filename = result.files.first.name;

    return {filebytetext: fileBytes, filenametext: filename};
  } else {
    // print('User canceled the picker');
    return {filebytetext: null, filenametext: ""};
  }
}

//==========================Download action===================================
downloadaction(
  BuildContext context,
  String jobseekerid,
  String fillename,
) async {
  try {
    String pdfurl = "$url$resumeurl$jobseekerid.pdf";
    if (kIsWeb) {
      html.window.open(pdfurl, "pdf");
    } else if (Platform.isAndroid || Platform.isIOS) {
      // Use path_provider and Dio

      Directory? dir;

      if (Platform.isAndroid) {
        dir = await getExternalStorageDirectory();
      } else if (Platform.isIOS) {
        dir = await getApplicationDocumentsDirectory();
      }
      String downloaddirectory = dir!.path;

      var response = await Dio().download(
        pdfurl,
        "$downloaddirectory$fillename",
      );

      if (response.statusCode == 200) {
        print(" Downloaded Successfully");
      }
    }
    //====================Using file downloader=====================
    // if (Platform.isAndroid) {
    //   FileDownloader.downloadFile(
    //     url: filepath,
    //     // name: "THE FILE NAME AFTER DOWNLOADING",
    //     onProgress: (String? fileName, double progress) {
    //       print('FILE fileName HAS PROGRESS $progress');
    //     },
    //     onDownloadCompleted: (String path) {
    //       print('FILE DOWNLOADED TO PATH: $path');
    //     },
    //     onDownloadError: (String error) {},
    //   );
    // }
  } catch (e) {
    print(e);
  }
}
