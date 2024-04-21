import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:muhammed_basil/model/country_list_model.dart';
import 'package:muhammed_basil/model/desired_country_list_model.dart';
import 'package:muhammed_basil/services/country_list_services.dart';
import 'package:muhammed_basil/utils/utils.dart';

class CountryController with ChangeNotifier {
  TextEditingController phoneNumberController = TextEditingController();
  String selectedCountry = '';
  String selectedCountryCode = '';
  String selectedProfession = '';
  List<Datum> countryList = [];
  getCountryList() async {
    Response response = await CountryListService().getCountryList();
    CountryListModel countryListModel =
        CountryListModel.fromJson(response.data);
    countryList.clear();
    countryList.addAll(countryListModel.data ?? []);
    notifyListeners();
  }

  List<Country> desiredCountries = [];

  getDesiredCountryList() async {
    Response response = await CountryListService().getDesiredCountry();
    DesiredCountryListModel desiredCountryListModel =
        DesiredCountryListModel.fromJson(response.data);
    desiredCountries.clear();
    desiredCountries.addAll(desiredCountryListModel.data!.countries ?? []);
    notifyListeners();
  }

  int selectedIndex = -1;
  void toggleSelection(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  String selectedDesiredCountry = '';
  void saveSelectedCountry(int id) {
    SavedDatas().saveSelectedDesiredCountryId(id);
  }
}
