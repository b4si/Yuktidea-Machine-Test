import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:muhammed_basil/controller/country_controller.dart';
import 'package:muhammed_basil/model/otp_send_response_model.dart';
import 'package:muhammed_basil/model/verify_otp_response_model.dart';
import 'package:muhammed_basil/services/otp_services.dart';
import 'package:muhammed_basil/utils/utils.dart';
import 'package:muhammed_basil/view/desired_country_selection_screen.dart';
import 'package:muhammed_basil/view/otp_screen.dart';
import 'package:provider/provider.dart';

class OtpController with ChangeNotifier {
  late Timer timer;
  int countDown = 30;
  bool isResendEnabled = false;

  TextEditingController otpController = TextEditingController();

  void startCountDown() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countDown == 0) {
        timer.cancel();

        isResendEnabled = true;
      } else {
        countDown--;
      }
      notifyListeners();
    });
  }

  bool sendOtp = false;
  sendStudentOtpFunction(teleCode, phoneNumber, context) async {
    final provider = Provider.of<CountryController>(context, listen: false);
    if (provider.selectedProfession == 'student') {
      Response response =
          await OtpServices().sendStudentOtp(teleCode, phoneNumber);
      OtpSendResponseModel otpSendResponseModel =
          OtpSendResponseModel.fromJson(response.data);
      sendOtp = otpSendResponseModel.status ?? false;
      if (sendOtp) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const OtpScreen(),
          ),
        );
      } else {
        return;
      }
    } else {
      Response response =
          await OtpServices().sendAgentOtp(teleCode, phoneNumber);
      OtpSendResponseModel otpSendResponseModel =
          OtpSendResponseModel.fromJson(response.data);
      sendOtp = otpSendResponseModel.status ?? false;
      if (sendOtp) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const OtpScreen(),
          ),
        );
      } else {
        return;
      }
    }
  }

  void resendOtp(String numCode) async {
    Response response = await OtpServices().reSendOtp(numCode);
    OtpSendResponseModel otpSendResponseModel =
        OtpSendResponseModel.fromJson(response.data);
    sendOtp = otpSendResponseModel.status ?? false;
    if (sendOtp) {
      isResendEnabled = false;
      countDown = 30;
      startCountDown();
    }
  }

  bool otpVerified = false;
  verifyOtp(numAndCode, otp, context) async {
    Response response = await OtpServices().verifyOtp(
      numAndCode,
      otp,
    );
    VerifyOtpResponseModel verifyOtpResponseModel =
        VerifyOtpResponseModel.fromJson(response.data);
    otpVerified = verifyOtpResponseModel.status ?? false;
    if (otpVerified) {
      String accessToken = verifyOtpResponseModel.data!.accessToken ?? '';
      SavedDatas().saveAccessToken(accessToken);
      String? savedaccessToken = await SavedDatas().getAccessToken();
      log(savedaccessToken ?? '');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DesiredCountrySelectionScreen(),
        ),
      );
    }
  }

  // sendAgentOtpFunction(teleCode, phoneNumber) async {
  //   Response response =
  //       await OtpServices().sendAgentOtp(teleCode, phoneNumber);
  //   OtpSendResponseModel otpSendResponseModel =
  //       OtpSendResponseModel.fromJson(response.data);
  //   sendOtp = otpSendResponseModel.status ?? false;
  // }
}
