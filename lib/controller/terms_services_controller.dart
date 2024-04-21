import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:muhammed_basil/model/terms_and_conditions_model.dart';
import 'package:muhammed_basil/services/terms_and_conditions_services.dart';

class TermsAndConditonProvider with ChangeNotifier {
  TermsAndConditionsModel? termsAndConditionsModel;
  getTermsAndCondtions() async {
    Response response = await TermsAndConditonsServies().getTermsandConditons();
    log(response.data.toString());
    termsAndConditionsModel = TermsAndConditionsModel.fromJson(response.data);
    notifyListeners();
  }
}
