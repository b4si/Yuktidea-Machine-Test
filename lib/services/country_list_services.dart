import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:muhammed_basil/utils/utils.dart';

class CountryListService {
  getCountryList() async {
    try {
      Response response = await Dio().get('$baseUrl/api/countries');
      return response;
    } catch (e) {
      log(
        e.toString(),
      );
    }
  }

  getDesiredCountry() async {
    try {
      String? savedaccessToken = await SavedDatas().getAccessToken();
      log('######$savedaccessToken');
      Response response = await Dio().get(
        "$baseUrl/api/select/country",
        options:
            Options(headers: {"Authorization": "Bearer $savedaccessToken"}),
      );
      log('----->>>>');
      return response;
    } catch (e) {
      log(e.toString());
    }
  }
}
