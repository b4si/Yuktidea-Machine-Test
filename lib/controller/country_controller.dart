import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:muhammed_basil/model/country_list_model.dart';
import 'package:muhammed_basil/services/country_list_services.dart';

class CountryController with ChangeNotifier {
  List<Datum> countryList = [];
  getCountryList() async {
    Response response = await CountryListService().getCountryList();
    CountryListModel countryListModel =
        CountryListModel.fromJson(response.data);
    countryList.clear();
    countryList.addAll(countryListModel.data ?? []);
    notifyListeners();
  }
}
