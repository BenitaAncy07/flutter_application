// ignore: camel_case_types
import 'package:flutter/material.dart';

class Update_Status_items {
  Update_Status_items(this.text, this.color, this.icon);

  String text;
  Color color;
  IconData icon;
}

class Profile_page_items {
  Profile_page_items(this.heading, this.content, this.icon);
  IconData icon;
  String heading, content;
}

class qualification_items {
  qualification_items(this.heading, this.textbox1, this.textbox2);
  String heading, textbox1, textbox2;
}

class jobpreference_items {
  jobpreference_items(
    this.heading,
    this.subheading,
    this.textbox1,
    this.textbox2,
  );
  String heading, subheading, textbox1, textbox2;
}

class Intropage_items {
  String text, img;
  Intropage_items(this.text, this.img);
}
