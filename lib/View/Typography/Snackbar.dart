import 'package:flutter/material.dart';
import 'package:flutter_application/Controllers/Utilities/Hexconversion.dart';
import 'package:flutter_application/View/Helpers/Colorcontents.dart';
import 'package:flutter_application/View/Helpers/Iconcontents.dart';
import 'package:flutter_application/Controllers/Constants/UIconstants.dart';

//==========================Simple snackbar===================
void simplesnackbar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: transparent,
      elevation: 0,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      content: Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(12),
          border: Border(
            left: BorderSide(color: hexToColor(goldencolor), width: 5),
          ),
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.2),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(righticon, color: hexToColor(goldencolor)),
            ),
            Expanded(child: Text(msg, style: TextStyle(color: black))),
          ],
        ),
      ),
    ),
  );
}

//==================================Undo snackbar===============================
undosnackbar(BuildContext context, String msg) {
  //  Column(
  //               children: [
  //                 if (isVisible)
  //                   Container(
  //                     padding: EdgeInsets.all(16),
  //                     decoration: BoxDecoration(
  //                       color: Colors.grey[200],
  //                       borderRadius: BorderRadius.circular(12),
  //                     ),
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Text('This is your content'),
  //                         ElevatedButton(
  //                           onPressed: () {
  //                          setState(() => isVisible = false);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: transparent,
      elevation: 0,
      duration: Duration(days: 1),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      content: Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(12),
          border: Border(
            left: BorderSide(color: hexToColor(goldencolor), width: 5),
          ),
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.2),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(erroricon, size: iconsize1),
            ),
            Expanded(child: Text(msg, style: TextStyle(color: black))),
            TextButton(
              onPressed: () {
                //  setState(() => isVisible = true);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child: Text(undobuttontext),
            ),
            IconButton(
              icon: Icon(closeicon),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ],
        ),
      ),
    ),
  );
  //               },
  //               child: Text('Hide'),
  //             ),
  //           ],
  //         ),
  //       ),
  //   ],
  // ),
}
