import 'dart:developer';

import 'package:dio/dio.dart';

class TermsAndConditonsServies {
  getTermsandConditons() async {
    try {
      Response response = await Dio().get(
        'https://studylancer.yuktidea.com/api/terms-conditions',
      );
      return response;
    } catch (e) {
      log(e.toString());
    }
  }
}
