import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:muhammed_basil/controller/country_controller.dart';
import 'package:muhammed_basil/model/otp_send_response_model.dart';
import 'package:muhammed_basil/services/otp_services.dart';
import 'package:muhammed_basil/view/otp_screen.dart';
import 'package:provider/provider.dart';

class OtpController with ChangeNotifier {
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

  // sendAgentOtpFunction(teleCode, phoneNumber) async {
  //   Response response =
  //       await OtpServices().sendAgentOtp(teleCode, phoneNumber);
  //   OtpSendResponseModel otpSendResponseModel =
  //       OtpSendResponseModel.fromJson(response.data);
  //   sendOtp = otpSendResponseModel.status ?? false;
  // }
}
