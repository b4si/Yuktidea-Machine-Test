import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:muhammed_basil/services/user_services.dart';
import 'package:muhammed_basil/utils/utils.dart';
import 'package:muhammed_basil/view/on_boarding_screen.dart';

class UserController with ChangeNotifier {
  logOutUser(context) async {
    Response response = await UserServices().logOutUser();
    if (response.statusCode == 200) {
      await SavedDatas().deleteAccessToken();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const OnBoardingScreen(),
          ),
          (route) => false);
    }
  }

  deleteUser(context) async {
    Response response = await UserServices().deleteUser();
    if (response.statusCode == 200) {
      await SavedDatas().deleteAccessToken();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const OnBoardingScreen(),
          ),
          (route) => false);
    }
  }
}
