import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:muhammed_basil/utils/utils.dart';

class UserServices {
  logOutUser() async {
    String? savedaccessToken = await SavedDatas().getAccessToken();
    try {
      Response response = await Dio().post(
        '$baseUrl/api/logout',
        options: Options(
          headers: {"Authorization": savedaccessToken},
        ),
      );
      return response;
    } catch (e) {
      log(e.toString());
    }
  }

  deleteUser() async {
    String? savedaccessToken = await SavedDatas().getAccessToken();
    try {
      Response response = await Dio().post(
        '$baseUrl/api/delete',
        options: Options(
          headers: {"Authorization": savedaccessToken},
        ),
      );
      return response;
    } catch (e) {
      log(e.toString());
    }
  }
}
