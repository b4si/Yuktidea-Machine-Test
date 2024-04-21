import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:muhammed_basil/utils/utils.dart';

class OtpServices {
  sendStudentOtp(String teleCode, String phoneNumber) async {
    try {
      log(teleCode + phoneNumber);
      Response response = await Dio().post('$baseUrl/api/student/login', data: {
        "tel_code": teleCode,
        "phone": phoneNumber,
      });
      return response;
    } catch (e) {
      log(e.toString());
    }
  }

  sendAgentOtp(String teleCode, String phoneNumber) async {
    try {
      Response response =
          await Dio().post('$baseUrl/api/counsellor/login', data: {
        "tel_code": teleCode,
        "phone": phoneNumber,
      });
      return response;
    } catch (e) {
      log(e.toString());
    }
  }

  reSendOtp(String phoneNumAndCode) async {
    try {
      Response response = await Dio().post(
        '$baseUrl/api/resend-otp',
        data: {
          "phone": phoneNumAndCode,
        },
      );
      return response;
    } catch (e) {
      log(e.toString());
    }
  }

  verifyOtp(numAndCode, otp) async {
    try {
      Response response = await Dio().post(
        '$baseUrl/api/verify-otp',
        data: {
          "code": otp,
          "phone": numAndCode,
        },
      );
      return response;
    } catch (e) {
      log(e.toString());
    }
  }
}
