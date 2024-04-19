import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:muhammed_basil/utils/utils.dart';

class CountryListService {
  getCountryList() async {
    try {
      Response response = await Dio().get('$baseUrl/api/countries');
      return response;
    } catch (e) {
      log(e.toString());
    }
  }
}
