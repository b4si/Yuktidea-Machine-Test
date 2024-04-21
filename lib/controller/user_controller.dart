import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:muhammed_basil/controller/country_controller.dart';
import 'package:muhammed_basil/controller/otp_controller.dart';
import 'package:muhammed_basil/services/user_services.dart';
import 'package:muhammed_basil/utils/utils.dart';
import 'package:muhammed_basil/view/on_boarding_screen.dart';
import 'package:provider/provider.dart';

class UserController with ChangeNotifier {
  logOutUser(context) async {
    Response response = await UserServices().logOutUser();
    final otpProvider = Provider.of<OtpController>(context, listen: false);
    final countryController =
        Provider.of<CountryController>(context, listen: false);
    otpProvider.otpController.clear();
    countryController.phoneNumberController.clear();
    countryController.selectedIndex = -1;
    if (response.statusCode == 200) {
      await SavedDatas().deleteAccessToken();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const OnBoardingScreen(),
          ),
          (route) => true);
    }
    notifyListeners();
  }

  deleteUser(context) async {
    Response response = await UserServices().deleteUser();
    final otpProvider = Provider.of<OtpController>(context, listen: false);
    final countryController =
        Provider.of<CountryController>(context, listen: false);
    otpProvider.otpController.clear();
    countryController.phoneNumberController.clear();
    countryController.selectedIndex = -1;
    if (response.statusCode == 200) {
      await SavedDatas().deleteAccessToken();
      String accesstoken = await SavedDatas().getAccessToken() ?? '';
      log("------<<<<<<$accesstoken");

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const OnBoardingScreen(),
          ),
          (route) => true);
    }
    notifyListeners();
  }
}
