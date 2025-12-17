import 'package:flutter/material.dart';

import '../app_colors/app_colors.dart';

class AppStyles {
  // Font sizes
  static const double fs10 = 10;
  static const double fs12 = 12;
  static const double fs14 = 14;
  static const double fs16 = 16;
  static const double fs18 = 18;
  static const double fs20 = 20;
  static const double fs24 = 24;
  static const double fs28 = 28;
  static const double fs32 = 32;
  static const double fs40 = 40;
  static const double fs48 = 48;
  static const double fs60 = 60;

  // Font weights
  static const FontWeight wThin = FontWeight.w100;
  static const FontWeight wLight = FontWeight.w300;
  static const FontWeight wRegular = FontWeight.w400;
  static const FontWeight wMedium = FontWeight.w500;
  static const FontWeight wSemiBold = FontWeight.w600;
  static const FontWeight wBold = FontWeight.w700;
  static const FontWeight wExtraBold = FontWeight.w800;
  static const FontWeight wBlack = FontWeight.w900;

  // -----------------------
  // TEXT STYLE TEMPLATES
  // -----------------------

  static const TextStyle regular14BleachedCedar = TextStyle(
    fontSize: fs14,
    fontWeight: wRegular,
    color: AppColors.bleachedCedar,
    fontFamily: "Cairo",
  );

  static const TextStyle semiBold14White = TextStyle(
    fontSize: fs14,
    fontWeight: wSemiBold,
    color: AppColors.whiteColor,
    fontFamily: "Cairo",
  );

  static const TextStyle semiBold14Gray1 = TextStyle(
    fontSize: fs14,
    fontWeight: wSemiBold,
    color: AppColors.greyColor1,
    fontFamily: "Cairo",
  );

  static const TextStyle semiBold14Orange = TextStyle(
    fontSize: fs14,
    fontWeight: wSemiBold,
    color: AppColors.orange,
    fontFamily: "Cairo",
  );

  static const TextStyle semiBold14Black = TextStyle(
    fontSize: fs14,
    fontWeight: wSemiBold,
    color: AppColors.blackColor,
    fontFamily: "Cairo",
  );

  static const TextStyle semiBold18Black = TextStyle(
    fontSize: fs18,
    fontWeight: wSemiBold,
    color: AppColors.blackColor,
    fontFamily: "Cairo",
  );

  static const TextStyle semiBold18White = TextStyle(
    fontSize: fs18,
    fontWeight: wSemiBold,
    color: AppColors.whiteColor,
    fontFamily: "Cairo",
  );

  static const TextStyle light12Gray = TextStyle(
    fontSize: fs12,
    fontWeight: wLight,
    color: AppColors.saltBox,
    fontFamily: "Cairo",
  );

  static const TextStyle light16White = TextStyle(
    fontSize: fs16,
    fontWeight: wLight,
    color: AppColors.whiteColor,
    fontFamily: "Cairo",
  );

  static const TextStyle regular14Black = TextStyle(
    fontSize: fs14,
    fontWeight: wRegular,
    color: AppColors.blackColor,
    fontFamily: "Cairo",
  );

  static const TextStyle regular16Topaz = TextStyle(
    fontSize: fs16,
    fontWeight: wRegular,
    color: AppColors.topaz,
    fontFamily: "Cairo",
  );

  static const TextStyle regular18Gray = TextStyle(
    fontSize: fs18,
    fontWeight: wRegular,
    color: AppColors.saltBox,
    fontFamily: "Cairo",
  );

  static const TextStyle medium14White = TextStyle(
    fontSize: fs14,
    fontWeight: wMedium,
    color: AppColors.whiteColor,
    fontFamily: "Cairo",
  );

  static const TextStyle medium12White = TextStyle(
    fontSize: fs12,
    fontWeight: wMedium,
    color: AppColors.whiteColor,
    fontFamily: "Cairo",
  );

  static const TextStyle medium12Black = TextStyle(
    fontSize: fs12,
    fontWeight: wMedium,
    color: AppColors.blackColor,
    fontFamily: "Cairo",
  );

  static const TextStyle medium16Black = TextStyle(
    fontSize: fs16,
    fontWeight: wMedium,
    color: AppColors.blackColor,
    fontFamily: "Cairo",
  );

  static const TextStyle semiBold16Black = TextStyle(
    fontSize: fs16,
    fontWeight: wSemiBold,
    color: AppColors.blackColor,
    fontFamily: "Cairo",
  );

  static const TextStyle semiBold16White = TextStyle(
    fontSize: fs16,
    fontWeight: wSemiBold,
    color: AppColors.whiteColor,
    fontFamily: "Cairo",
  );

  static const TextStyle semiBold20Black = TextStyle(
    fontSize: fs20,
    fontWeight: wSemiBold,
    color: AppColors.blackColor,
    fontFamily: "Cairo",
  );

  static const TextStyle semiBold20White = TextStyle(
    fontSize: fs20,
    fontWeight: wSemiBold,
    color: AppColors.whiteColor,
    fontFamily: "Cairo",
  );

  static const TextStyle bold24Black = TextStyle(
    fontSize: fs24,
    fontWeight: wBold,
    color: AppColors.blackColor,
    fontFamily: "Cairo",
  );

  static const TextStyle yellow16Bold = TextStyle(
    fontSize: fs16,
    fontWeight: wExtraBold,
    color: AppColors.yellowColor,
    fontFamily: "Cairo",
  );

  static const TextStyle extraBold16ShipGray = TextStyle(
    fontSize: fs16,
    fontWeight: wExtraBold,
    color: AppColors.shipGray,
    fontFamily: "Cairo",
  );
}
