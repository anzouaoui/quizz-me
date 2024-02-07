import 'package:flutter/material.dart';


const Color primaryColor = Color.fromRGBO(42, 66, 140, 100);
const Color secondaryColor = Color(0xFF6A5AE0);
const Color whiteColor = Colors.white;
const Color blackColor = Colors.black;
const Color greyColor = Color(0xFF8A9CBF);
const Color grey9AColor = Color(0xFF9A9A9A);
const Color grey7CColor = Color(0xFF7C7C7C);
const Color redColor = Color(0xFFFF0000);
const Color yellowColor = Color(0xFFFDD835);
const Color pinkColor = Color(0xFFF06292);
const Color orangeColor = Color(0xFFE57373);
const Color lightBlueColor = Color(0xFF64B5F6);
const Color lightGreenColor = Color(0xFF4DB6AC);
const Color greenColor = Color(0xFF00D209);
const Color playIcon = Color(0xFFAED581);
const Color pauseIcon = Color(0xFFEF5350);
const Color trueAnswer = Color(0xFF4CAF50);
const Color falseAnswer = Color(0xFFF44336);

const double fixPadding = 10.0;

const SizedBox heightSpace = SizedBox(height: fixPadding);

const SizedBox height5Space = SizedBox(height: 5.0);

const SizedBox widthSpace = SizedBox(width: fixPadding);

const SizedBox width5Space = SizedBox(width: 5.0);

SizedBox heigthBox(double height) {
  return SizedBox(height: height);
}

SizedBox widthBox(double width) {
  return SizedBox(width: width);
}

const TextStyle bebas40Black = TextStyle(
    color: blackColor,
    fontSize: 40,
    fontWeight: FontWeight.w400,
    fontFamily: 'BebasNeue');

const TextStyle bebas36White = TextStyle(
    color: whiteColor,
    fontSize: 36,
    fontWeight: FontWeight.w400,
    fontFamily: 'BebasNeue');

const TextStyle bebas28White = TextStyle(
    color: whiteColor,
    fontSize: 28,
    fontWeight: FontWeight.w400,
    fontFamily: 'BebasNeue');
const TextStyle black32Primary =
    TextStyle(color: primaryColor, fontSize: 32, fontWeight: FontWeight.w900);

const TextStyle black18White =
    TextStyle(color: whiteColor, fontSize: 18, fontWeight: FontWeight.w900);

const TextStyle extrabold26Black =
    TextStyle(color: blackColor, fontSize: 26, fontWeight: FontWeight.w800);

const TextStyle extrabold20Black =
    TextStyle(color: blackColor, fontSize: 20, fontWeight: FontWeight.w800);

const TextStyle extrabold12Grey =
    TextStyle(color: greyColor, fontSize: 12, fontWeight: FontWeight.w800);

const TextStyle extrabold20lightBlue =
    TextStyle(color: lightBlueColor, fontSize: 20, fontWeight: FontWeight.w800);

const TextStyle extrabold20lightGreen = TextStyle(
    color: lightGreenColor, fontSize: 20, fontWeight: FontWeight.w800);

const TextStyle extrabold20Primary =
    TextStyle(color: primaryColor, fontSize: 20, fontWeight: FontWeight.w800);

const TextStyle extrabold22Primary =
    TextStyle(color: primaryColor, fontSize: 22, fontWeight: FontWeight.w800);

const TextStyle extrabold14Primary =
    TextStyle(color: primaryColor, fontSize: 14, fontWeight: FontWeight.w800);

const TextStyle extrabold14Yellow =
    TextStyle(color: yellowColor, fontSize: 14, fontWeight: FontWeight.w800);

const TextStyle extrabold26White =
    TextStyle(color: whiteColor, fontSize: 26, fontWeight: FontWeight.w800);

const TextStyle extrabold19White =
    TextStyle(color: whiteColor, fontSize: 19, fontWeight: FontWeight.w800);

const TextStyle extrabold18Pink =
    TextStyle(color: pinkColor, fontSize: 18, fontWeight: FontWeight.w800);

const TextStyle extrabold22White =
    TextStyle(color: whiteColor, fontSize: 22, fontWeight: FontWeight.w800);

const TextStyle semibold16Grey =
    TextStyle(color: greyColor, fontSize: 16, fontWeight: FontWeight.w600);

const TextStyle semibold14Grey =
    TextStyle(color: greyColor, fontSize: 14, fontWeight: FontWeight.w600);

const TextStyle semibold16Grey7C =
    TextStyle(color: grey7CColor, fontSize: 16, fontWeight: FontWeight.w600);

const TextStyle semibold16White =
    TextStyle(color: whiteColor, fontSize: 16, fontWeight: FontWeight.w600);

const TextStyle semibold18Black =
    TextStyle(color: blackColor, fontSize: 18, fontWeight: FontWeight.w600);

const TextStyle semibold16Black =
    TextStyle(color: blackColor, fontSize: 16, fontWeight: FontWeight.w600);

const TextStyle semibold16Red =
    TextStyle(color: redColor, fontSize: 16, fontWeight: FontWeight.w600);

const TextStyle semibold16Primary =
    TextStyle(color: primaryColor, fontSize: 16, fontWeight: FontWeight.w600);

const TextStyle semibold18Primary =
    TextStyle(color: primaryColor, fontSize: 18, fontWeight: FontWeight.w600);

const TextStyle bold20White =
    TextStyle(color: whiteColor, fontSize: 20, fontWeight: FontWeight.w700);

const TextStyle bold16White =
    TextStyle(color: whiteColor, fontSize: 16, fontWeight: FontWeight.w700);

const TextStyle bold18White =
    TextStyle(color: whiteColor, fontSize: 18, fontWeight: FontWeight.w700);

const TextStyle bold18Primary =
    TextStyle(color: primaryColor, fontSize: 18, fontWeight: FontWeight.w700);

const TextStyle bold14Primary =
    TextStyle(color: primaryColor, fontSize: 14, fontWeight: FontWeight.w700);

const TextStyle bold20Black =
    TextStyle(color: blackColor, fontSize: 20, fontWeight: FontWeight.w700);

const TextStyle bold20Primary =
    TextStyle(color: primaryColor, fontSize: 20, fontWeight: FontWeight.w700);

const TextStyle bold18Black =
    TextStyle(color: blackColor, fontSize: 18, fontWeight: FontWeight.w700);

const TextStyle bold16Black =
    TextStyle(color: blackColor, fontSize: 16, fontWeight: FontWeight.w700);

const TextStyle bold15White =
    TextStyle(color: whiteColor, fontSize: 15, fontWeight: FontWeight.w700);

const TextStyle bold16Primary =
    TextStyle(color: primaryColor, fontSize: 16, fontWeight: FontWeight.w700);

const TextStyle bold16Grey =
    TextStyle(color: greyColor, fontSize: 16, fontWeight: FontWeight.w700);

const TextStyle bold16lightBlue =
    TextStyle(color: lightBlueColor, fontSize: 16, fontWeight: FontWeight.w700);

const TextStyle bold16lightGreen = TextStyle(
    color: lightGreenColor, fontSize: 16, fontWeight: FontWeight.w700);

const TextStyle bold14Grey =
    TextStyle(color: greyColor, fontSize: 14, fontWeight: FontWeight.w700);

const TextStyle hyperlink =
TextStyle(color: blackColor, fontSize: 16, fontWeight: FontWeight.w600, decoration: TextDecoration.underline);
///*****************************************
///***************ICONS*********************
///*****************************************
const Icon play = Icon(Icons.play_circle);
const Icon pause = Icon(Icons.pause_circle);