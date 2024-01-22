import 'package:flutter/material.dart';

//Colors
const Color kMainAppColor = Color(0xFF6A4DBA);
const Color kAppBarColor = Color(0xFF1A1717);
const Color kSecondaryColor = Color(0xFF747377);
const Color kSecondaryButtonColor = Color(0xFFB9B9B9);

//TextStyle
TextStyle kAppBarTextStyle = const TextStyle(
  fontFamily: 'Roboto',
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontSize: 16,
);

TextStyle kSecondaryTextStyle = const TextStyle(
  fontFamily: 'Roboto',
  color: kSecondaryColor,
  fontWeight: FontWeight.w400,
  fontSize: 16,
);

TextStyle kCardItemDescriptionTextStyle = const TextStyle(
  fontFamily: 'Roboto',
  color: kSecondaryColor,
  fontWeight: FontWeight.w400,
  fontSize: 14,
);

TextStyle kCardItemTitleTextStyle = const TextStyle(
  fontFamily: 'Roboto',
  color: kAppBarColor,
  fontWeight: FontWeight.w700,
  fontSize: 14,
);

TextStyle kAddCartTitleTextStyle = const TextStyle(
  fontFamily: 'Roboto',
  color: kAppBarColor,
  fontWeight: FontWeight.w500,
  fontSize: 14,
);

const kTimeInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFE6E6E6)),
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
  ),
  // errorBorder: kAuthInputBorder,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kMainAppColor),
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
  ),
  // focusedErrorBorder: kAuthInputBorder,
);

final kTextInputDecoration = InputDecoration(
  hintText: 'Enter message',
  hintStyle: kSecondaryTextStyle,

  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  fillColor: Colors.white,
  filled: true,
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFE6E6E6)),
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
  ),

  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: kMainAppColor),
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
  ),
  // focusedErrorBorder: kAuthInputBorder,
);

const List<int> colorsList = [
  0xFFF1F4FF,
  0xFFFFF1F1,
  0xFFFFFEF1,
  0xFFF5F1FF,
  0xFFFFF1FF,
];

const List<String> itemList = ["1 Minute", "3 Minute", "5 Minute"];

const List<String> iconList = [
  "assets/icons/icon1.svg",
  "assets/icons/icon2.svg",
  "assets/icons/icon3.svg",
  "assets/icons/icon4.svg",
  "assets/icons/icon5.svg",
];
